class_name Player extends Node2D
#Clase Abstracta

var salud: int
var is_alive: bool #Comprueba si el jugador esta vivo
var speed: float
var animacion_actual #Guardara la animacion actual
#var weapon = Position2D -- por ahora es para guardar la posicion del cañon al disparar


func _process(delta):
	animaciones()

func _physics_process(delta):
	movimiento()
	ataque()	
	
func movimiento():
	pass

func animaciones():
	pass

func ataque():
	pass
