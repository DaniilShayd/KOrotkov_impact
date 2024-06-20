extends State
class_name EnemyFollow

@export var enemy: CharacterBody2D
@export var move_speed := 40.0
var player: CharacterBody2D

func enter():
	player = $"../../../KOrotkov player"
	
func physics_update(delta: float):
	var direction = player.global_position - enemy.global_position
	print(direction.length())
	if direction.length() > 300:
		transitioned.emit(self, "enemy_shoot")
	elif direction.length() > 100:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
	
	

		
