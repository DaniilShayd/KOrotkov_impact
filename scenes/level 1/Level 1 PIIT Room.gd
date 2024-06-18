extends Node2D

var next_scene = preload("res://scenes/level 2/Level 2 FCS Corridor.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name != "KOrotkov player":
		return 
	get_tree().change_scene_to_packed(next_scene)
