class_name Bullet3
extends Area2D

export var speed: float = 400.0
var _direction: Vector2 = Vector2.UP

func set_direction(dir: Vector2) -> void:
	_direction = dir.normalized()

func _process(delta: float) -> void:
	position += _direction * speed * delta
	if position.y < -10:
		queue_free()
