extends Node


var ACTION
enum {PLAYER1,PLAYER2, CONFRONTATION}

var move_from = Vector2.ZERO
var move_to = Vector2.ZERO

var _speed_cam = 0

const MAXIMUM_SPEED = 10
const ACCELRATION = 4
const MAX_ZOOM = 1
const MIN_ZOOM = 0.6
const SPEED_ZOOM = 0.025


var STATE_CAM
enum {MOVE, ZOOM, UNZOOM}

func _ready():
	self.ACTION = PLAYER1
	self.SetCameraMove(MOVE,"player1")


func SetCameraMove(new_state, destination):
	self.STATE_CAM = new_state
	match destination:
		"player1":
			self.move_to = self.get_node("Marker2DPlayer1").global_position
		"player2":
			self.move_to = self.get_node("Marker2DPlayer2").global_position
		"confrontation":
			self.move_to = self.get_node("Marker2DPlayerConfrontation").global_position


func StateMachineCam():
	if self.STATE_CAM == MOVE:
		self.move_from = self._cam.global_position
		if move_from.y < move_to.y+2:
			self._speed_cam = min(self._speed_cam+self.ACCELRATION, self.MAXIMUM_SPEED)
		elif move_from.y > move_to.y-2:
			self._speed_cam = max(self._speed_cam-self.ACCELRATION, -self.MAXIMUM_SPEED)
		
		if move_from.y > move_to.y - 2 and move_from.y < move_to.y + 2:
			self._speed_cam = 0.00
			self.STATE_CAM = ZOOM
		else:
			self._speed_cam = lerpf(self._speed_cam, 0.00,0.15)
		
		self.move_from.y += self._speed_cam
		self._cam.global_position = self.move_from
	elif self.STATE_CAM == ZOOM:
		if self._cam.zoom.x < self.MAX_ZOOM:
			self._cam.zoom.x = min(self._cam.zoom.x+self.SPEED_ZOOM, self.MAX_ZOOM)
			self._cam.zoom.y = self._cam.zoom.x
		else:
			self.STATE_CAM = UNZOOM
	elif self.STATE_CAM == UNZOOM:
		if self._cam.zoom.x > self.MIN_ZOOM:
			self._cam.zoom.x = max(self._cam.zoom.x-self.SPEED_ZOOM, self.MIN_ZOOM)
			self._cam.zoom.y = self._cam.zoom.x
			if self._cam.zoom.x < self.MIN_ZOOM+0.01:
				self.ChangeCam()


func ChangeCam():
	match self.ACTION:
		PLAYER1:
			self.ACTION = PLAYER2
			self.SetCameraMove(MOVE, "player2")
		PLAYER2:
			self.ACTION = CONFRONTATION
			self.SetCameraMove(MOVE, "confrontation")
		CONFRONTATION:
			self.ACTION = PLAYER1
			self.SetCameraMove(MOVE, "player1")

