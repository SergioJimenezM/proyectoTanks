extends Node2D

func _ready():
	var spawn = get_node("puntoDeSpawn1")
	var spawn2 = get_node("puntoDeSpawn2")
	var tank = load("res://escenas/tankeJugador.tscn").instance()
	var npc = load("res://escenas/kbNPCprovicional.tscn").instance()
	tank.set_position(spawn.get_position())
	npc.set_position(spawn2.get_position())
	get_parent().add_child(tank)
	get_parent().add_child(npc)
	
