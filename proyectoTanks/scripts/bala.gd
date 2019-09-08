extends KinematicBody2D

var speed = 750
var velocity = Vector2()

func inicio(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity*delta)
	if collision:
		queue_free()
	pass