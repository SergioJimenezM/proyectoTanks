extends Node2D

#el viewport debe moverse cuando el mouse presiona

var mapa#almacenara la instancia del mapa para editarlo
var spriteActual = 0 #por defecto coloca un sprite
export var minSprite = 0
export var maxSprite = 2
#Se puede optimizar esto buscando las direcciones del recurso directamente?
var nombresSprites = ["res://sprites/hierba.png","res://sprites/tierra.png","res://sprites/ladrillos.png"]
func _ready():
	mapa = $mapa

func _input(event):
	if(event is InputEventMouseButton):
		
		#WARNING, esto es para pc solamente
		#hay que hacerlo multiplataforma eventualmente
		#toma las presiones del mouse
		
		if(event.is_action_pressed("ui_accept")):
			#coloca el sprite selecionado
			var tilePos = mapa.world_to_map(event.position)
			mapa.set_cellv(tilePos, spriteActual)
		
		if(event.is_action_pressed("ui_cancel")):
			#elimina sprites siempre para evitar un borrar
			var tilePos = mapa.world_to_map(event.position)
			mapa.set_cellv(tilePos, -1)
		if(event.is_action_pressed("ui_plus")):
			if(spriteActual < maxSprite):
				spriteActual += 1 
			else:
				spriteActual = minSprite
			$elemento.texture = load(nombresSprites[spriteActual])
		if(event.is_action_pressed("ui_minus")):
			if(spriteActual > minSprite):
				spriteActual -= 1 
			else:
				spriteActual = maxSprite
			$elemento.texture = load(nombresSprites[spriteActual])