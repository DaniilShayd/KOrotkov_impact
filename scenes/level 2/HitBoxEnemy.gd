extends Area2D


@onready var enemy = $".."
@onready var area_2d = $"../../KOrotkov player/Weapon/Area2D"
@onready var k_orotkov_player = $"../../KOrotkov player"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



	


func _on_area_entered(area):
	if area == area_2d and k_orotkov_player.attacking:
		print(enemy.health)
		enemy.health -=1
