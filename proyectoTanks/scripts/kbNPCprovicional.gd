extends KinematicBody2D

export (int) var speed = 200
export (float) var rotationSpeed = 1.5

var velocity = Vector2()
var rotationDir = 0
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func buscar():
	
	pass

func atacar():
	
	pass

func recibeDamages():
	print("DAÑOOOOO")
	pass

func _physics_process(delta):
	
	pass