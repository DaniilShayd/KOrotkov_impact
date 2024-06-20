extends State
class_name EnemyShoot
@export var bullet_node: PackedScene
@export var enemy: CharacterBody2D
var player: CharacterBody2D
@onready var shoot_frequency = $"shoot frequency"
var is_shooting = true
func enter():
	player = $"../../../KOrotkov player"
	
func physics_update(delta: float):
	var direction = player.global_position - enemy.global_position
	print(direction.length())
	if is_shooting:
		var bullet = bullet_node.instantiate()
		bullet.position = enemy.position
		get_tree().current_scene.add_child(bullet)
		shoot_frequency.start()
		is_shooting = false
	
	if direction.length() < 300:
		transitioned.emit(self, "enemy_follow")
		


func _on_timer_timeout():
	is_shooting = true
