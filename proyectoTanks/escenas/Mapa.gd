extends Node2D

func _ready():
	var spawn = get_node("Position2D")
	var tank = load("res://escenas/tankeAmarillo.tscn").instance()
	tank.set_position(spawn.get_position())
	get_parent().add_child(tank)
