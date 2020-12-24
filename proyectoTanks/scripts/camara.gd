extends Camera2D

export var velocidadDeLaCamara = 15

export var limiteInferior = 560
export var limiteSuperior = -560
export var limiteDerecho = 830
export var limiteIzquierdo = -830

func _ready():
	pass

func deGuiACamara():
	pass

func _process(delta):
	var posicion =  position
	
	#Guarda un bit hacia la direccion del movimiento en eje X
	var moverX = int(Input.is_action_pressed("ui_left")) - int(Input.is_action_pressed("ui_right"))
	#guarda un bit hacia la direccion del movimiento en eje Y
	var moverY = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	#Se necesita el delta * velocidad de movimiento dos veces en la formula
	#por tanto se aplica esta parte de la formula ahorrando un proceso
	var DeltaMultiplicado = velocidadDeLaCamara * delta
	posicion.x = lerp(posicion.x, posicion.x - moverX * velocidadDeLaCamara, DeltaMultiplicado)
	posicion.y = lerp(posicion.y, posicion.y - moverY * velocidadDeLaCamara, DeltaMultiplicado)
	#lerp es interpolacion lineal
	#consigue un valor perteneciente a la función asociada que estamos creando
	#la formula traza una recta entre dos valores y así se calcula el movimiento
	
	if(posicion.x <= limiteSuperior):
		posicion.x += velocidadDeLaCamara
		
	if( posicion.x >= limiteInferior):
		posicion.x -= velocidadDeLaCamara
		
	if(posicion.y <= limiteIzquierdo):
		posicion.y += velocidadDeLaCamara
		
	if(posicion.y >= limiteDerecho):
		posicion.y -= velocidadDeLaCamara
	print(posicion)
	position = posicion
