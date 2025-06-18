extends Node2D

@export var speed := 2000.0
@export var damage := 10
var direction := Vector2.UP

func _physics_process(delta):
	var from = global_position
	var to = from + direction * speed * delta

	var params := PhysicsRayQueryParameters2D.new()
	params.from = from
	params.to = to
	params.exclude = [self]
	params.collision_mask = 1  # Ajusta según tus capas

	var space_state = get_world_2d().direct_space_state
	var result := space_state.intersect_ray(params)

	if result:
		var collider = result.collider
		if collider and collider.has_method("take_damage"):
			collider.take_damage(damage)
		queue_free()
	else:
		global_position = to
