using Godot;
using System;

public partial class plateau : Node2D
{
	
	Camera2D camObject;
	
	Marker2D makerPlayer1;
	
	enum CameraStates
	{
		MOVE,
		ZOOM,
		UNZOOM
	}
	
	CameraStates camState = CameraStates.MOVE;
	
	const ushort MAXIMUM_SPEED = 20;
	const ushort ACCELERATION = 20;
	
	float CamSpeed = 0.00f;
	
	
	Vector2 go_to = new Vector2(0,0);
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		this.camObject = GetNode<Camera2D>("cam2D");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _PhysicsProcess(double delta)
	{
		this.CameraStateMachine();
	}
	
	private void CameraMovement(){
		/*
			Cette méthode est appelée pour les déplacements de caméra
		*/
		if (this.camObject.GlobalPosition.Y > this.go_to.Y){
			//this.CamSpeed = Mathf.;
		} else if (this.camObject.GlobalPosition.Y < this.go_to.Y) {
			
		}
	}
	
	private void CameraStateMachine(){
		switch (camState) {
			case CameraStates.MOVE:
				this.CameraMovement();
				break;
			default:
				break;
		}
		if (this.camObject.GlobalPosition.X > 2){
			
		}
	}
}
