extends Node2D


var DEBUG
enum {CAM, PLATEAU, KEYBOARD}

@onready var _cam = self.get_node("Camera2D")
@onready var _plateau = self.get_node("plateau")

@onready var _cam_anim_src = load("res://src/scripts/proto/gameplay_anim/anim_camera.gd")

func _ready():
	self.DEBUG = CAM


func _physics_process(_delta):
	if self.DEBUG == CAM:
		self.Cam_Animation()
	elif self.DEBUG == PLATEAU:
		self.StatePlateau()
	elif self.DEBUG == KEYBOARD:
		if Input.is_action_pressed("droite"):
			self._plateau.rotation += 0.05
		elif Input.is_action_pressed("gauche"):
			self._plateau.rotation -= 0.05



func Cam_Animation():
	if not self._cam_anim_obj:
		self._cam_anim_src.SetCameraMove()
	

func StatePlateau():
	self._plateau.rotation += 0.05





