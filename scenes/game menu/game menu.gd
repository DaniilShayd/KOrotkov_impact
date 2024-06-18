extends Node2D

@onready var goida = $GOIDA
@onready var menu_music = $"Menu music"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_game_pressed():
	#menu_music.stop()
	goida.play()
	await goida.finished
	get_tree().change_scene_to_file("res://scenes/level 1/Level 1 PIIT Room.tscn")
	


func _on_exit_pressed():
	get_tree().quit()
