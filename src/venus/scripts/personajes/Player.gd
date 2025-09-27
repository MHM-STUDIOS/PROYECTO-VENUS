class_name Player extends Node2D
#Clase Abstracta

var salud: int
var is_alive: bool #Comprueba si el jugador esta vivo
var speed: float
#var weapon = Position2D -- por ahora es para guardar la posicion del cañon al disparar

#Maquina de Estados
enum STATE {
	IDLE,
	ADELANTE,
	ABAJO,
	GIRO_IZQUIERDA,
	GIRO_DERECHA,
}

func _physics_process(delta):
	movimiento()
	ataque()	
	
func movimiento():
	pass

func animaciones(anim):
	pass

func ataque():
	pass
