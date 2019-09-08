extends KinematicBody2D

export (int) var speed = 200
export (float) var rotationSpeed = 1.5

var velocity = Vector2()
var rotationDir = 0
var bala = load("res://escenas/bala.tscn")

func get_input():
	rotationDir = 0
	velocity = Vector2()
	if(Input.is_action_pressed("ui_right")):
		rotationDir += 1
	if(Input.is_action_pressed("ui_left")):
		rotationDir -= 1
	if(Input.is_action_pressed("ui_down")):
		velocity = Vector2(0, speed).rotated(rotation)
	if(Input.is_action_pressed("ui_up")):
		velocity = Vector2(0, -speed).rotated(rotation)
	if(Input.is_action_pressed("ui_cancel")):
		pass
	if(Input.is_action_just_pressed("ui_shoot")):
		shot()

func shot():
	var nuevaBala = bala.instance()
	nuevaBala.inicio($Position2D.global_position, self.rotation)
	get_parent().add_child(nuevaBala)

func _physics_process(delta):
	get_input()
	rotation += rotationDir * rotationSpeed * delta
	velocity = move_and_slide(velocity)