class_name RedshipController extends Player

onready var animated_sprite = $"../AnimatedSprite"
onready var redship = $".."


#movimiento
var mov

func _ready():
	animacion_actual = animated_sprite.play("idle")
	speed = 400

func movimiento():
	mov = Input.get_vector("izquierda", "derecha", "arriba", "abajo")
	mov.normalized()
	
	redship.move_and_slide(mov * speed)
	

func animaciones():
	pass

func ataque():
	pass
