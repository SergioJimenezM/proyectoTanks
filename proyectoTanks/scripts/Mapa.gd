extends Node2D

func _ready():
	var spawn = get_node("puntoDeSpawn1")
	var tank = load("res://escenas/tankeJugador.tscn").instantiate()
	tank.set_position(spawn.get_position())
	add_child(tank)
	
