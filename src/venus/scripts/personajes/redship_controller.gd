class_name RedShipController extends KinematicBody2D

"""ZONA ONREADYS"""
onready var animation_player = $"../AnimationPlayer"
onready var ssmod = $ShootStyleMod

"""ZONA EXPORTS"""
export var salud: int
export var is_alive: bool #Comprueba si el jugador esta vivo
export var speed: float
#var weapon = Position2D -- por ahora es para guardar la posicion del cañon al disparar



#movimiento
var mov_x #realmente hay que explicar?
var mov_y
var mov

"""MANEJO DE EVENTOS"""
func _input(event):
	if event.is_action_pressed("cambio_arma"):
		ssmod.current_style = (ssmod.current_style % 3) + 1
		print("Estilo actual:", ssmod.current_style)
		
func _ready():
	pass

func _physics_process(delta):
	movimiento()
	ataque()

func _process(delta):
	# Limitar posición dentro de la pantalla
	var screen_size = get_viewport_rect().size
	var margin = 20

	position.x = clamp(position.x, 20, screen_size.x - margin)
	position.y = clamp(position.y, 20, screen_size.y - margin)

func movimiento():
	mov_x = int(Input.is_action_pressed("derecha")) - int(Input.is_action_pressed("izquierda"))
	mov_y = int(Input.is_action_pressed("abajo")) - int(Input.is_action_pressed("arriba"))	
	mov = Vector2(mov_x, mov_y)
	mov.normalized()
	move_and_slide(mov * speed)

func animaciones(anim):
	pass

func ataque():
	if Input.is_action_pressed("ataque_1"):
		ssmod.shoot()
