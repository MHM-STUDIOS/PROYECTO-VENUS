class_name RedshipController extends Player

onready var animation_player = $"../AnimationPlayer"

onready var redship= $".."

var estado_actual

#---------------------
#movimiento
var mov_x
var mov

func _ready():
	estado_actual = STATE.IDLE
	speed = 400
	
func _process(delta):
	# Limitar posición dentro de la pantalla
	var screen_size = get_viewport_rect().size
	var margin = 20

	redship.position.x = clamp(redship.position.x, 20, screen_size.x - margin)
	redship.position.y = clamp(redship.position.y, 20, screen_size.y - margin)
	
	animaciones(estado_actual)

func movimiento():
	mov = Vector2(
		int(Input.is_action_pressed("derecha")) - int(Input.is_action_pressed("izquierda")),
		int(Input.is_action_pressed("abajo")) - int(Input.is_action_pressed("arriba"))
	).normalized()

	match estado_actual:
		STATE.IDLE:
			if(mov.x > 0):
				estado_actual = STATE.GIRO_DERECHA
			elif(mov.x < 0):
				estado_actual = STATE.GIRO_IZQUIERDA
			elif mov.y > 0:
				estado_actual = STATE.ABAJO
			elif mov.y < 0:
				estado_actual = STATE.ADELANTE
				
		STATE.ADELANTE:
			if(mov.x > 0):
				estado_actual = STATE.GIRO_DERECHA
			elif(mov.x < 0):
				estado_actual = STATE.GIRO_IZQUIERDA
			elif (mov.x == 0 and mov.y == 0):
				estado_actual = STATE.IDLE
				
		STATE.ABAJO:
			if(mov.x > 0):
				estado_actual = STATE.GIRO_DERECHA
			elif(mov.x < 0):
				estado_actual = STATE.GIRO_IZQUIERDA
			elif mov.y < 0:
				estado_actual = STATE.ADELANTE
			elif (mov.x == 0 and mov.y == 0):
				estado_actual = STATE.IDLE
				
		STATE.GIRO_IZQUIERDA:
			if mov.y < 0:
				estado_actual = STATE.ADELANTE
			elif mov.y > 0:
				estado_actual = STATE.ABAJO
			elif (mov.x == 0 and mov.y == 0):
				estado_actual = STATE.IDLE
				
		STATE.GIRO_DERECHA:
			if mov.y < 0:
				estado_actual = STATE.ADELANTE
			elif mov.y > 0:
				estado_actual = STATE.ABAJO
			elif (mov.x == 0 and mov.y == 0):
				estado_actual = STATE.IDLE
				
	redship.move_and_slide(mov * speed)
		
func animaciones(anim):
	match anim:
		STATE.IDLE:
			animation_player.play("idle")
		STATE.GIRO_DERECHA:
			animation_player.play("girar_derecha")
		STATE.GIRO_IZQUIERDA:
			animation_player.play("girar_izquierda")
		STATE.ADELANTE:
			animation_player.play("idle")
		STATE.ABAJO:
			animation_player.play("idle")

func ataque():
	pass
