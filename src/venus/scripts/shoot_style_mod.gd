class_name ShootStyleMod
extends Node2D

export(PackedScene) var bullet_1
export(PackedScene) var bullet_2
export(PackedScene) var bullet_3

export var fire_rate := 0.25 # tiempo entre disparos
var _cooldown := 0.0

enum FIRE_STYLE { ONE, TWO, THREE }
var current_style = FIRE_STYLE.ONE

func _process(delta: float) -> void:
	if _cooldown > 0.0:
		_cooldown -= delta

#Controla la posicion de las balas	
func shoot() -> void:
	if _cooldown > 0.0:
		return
	_cooldown = fire_rate

	match current_style:
		FIRE_STYLE.ONE:
			_spawn_bullet(bullet_1, Vector2(0, -1))

		FIRE_STYLE.TWO:
			_spawn_bullet(bullet_2, Vector2(-0.2, -1))
			_spawn_bullet(bullet_2, Vector2(0.2, -1))

		FIRE_STYLE.THREE:
			_spawn_bullet(bullet_3, Vector2(0, -1))
			_spawn_bullet(bullet_3, Vector2(-0.3, -1))
			_spawn_bullet(bullet_3, Vector2(0.3, -1))

#controla  el spawm de las balas
func _spawn_bullet(scene: PackedScene, dir: Vector2) -> void:
	if scene == null:
		return
	var bullet = scene.instance()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = global_position
	if bullet.has_method("set_direction"):
		bullet.set_direction(dir)
