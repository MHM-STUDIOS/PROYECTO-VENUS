class_name RedshipController extends Player

onready var animation_player = $"../AnimationPlayer"

onready var redship= $".."


#movimiento
var mov_x
var mov_y
var mov

func _ready():
	speed = 400

func _process(delta):
	# Limitar posición dentro de la pantalla
	var screen_size = get_viewport_rect().size
	var margin = 20

	redship.position.x = clamp(redship.position.x, 20, screen_size.x - margin)
	redship.position.y = clamp(redship.position.y, 20, screen_size.y - margin)

func movimiento():
	mov_x = int(Input.is_action_pressed("derecha")) - int(Input.is_action_pressed("izquierda"))
	mov_y = int(Input.is_action_pressed("abajo")) - int(Input.is_action_pressed("arriba"))	
	mov = Vector2(mov_x, mov_y)
	mov.normalized()
	redship.move_and_slide(mov * speed)


func animaciones(anim):
	pass

func ataque():
	pass
