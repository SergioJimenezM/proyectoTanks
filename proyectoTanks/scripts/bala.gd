extends CharacterBody2D

var speed = 750

func inicio(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(0, -speed).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity*delta)
	if collision:
		if collision.collider.has_method("recibeDamages"):
			collision.collider.recibeDamages()
		queue_free()
	pass
