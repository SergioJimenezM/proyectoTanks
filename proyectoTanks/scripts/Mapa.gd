extends Node2D

func _ready():
	var spawn = get_node("puntoDeSpawn1")
	var tank = load("res://escenas/tankeJugador.tscn").instance()
	tank.set_position(spawn.get_position())
	get_parent().add_child(tank)