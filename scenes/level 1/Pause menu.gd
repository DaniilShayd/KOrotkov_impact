extends Control
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("RESET") # Replace with function body.


func resume():
	get_tree().paused = false;
	$AnimationPlayer.play_backwards("blur")
	
func pause():
	get_tree().paused = true;
	$AnimationPlayer.play("blur")
	
func testEsc():
	if Input.is_action_just_pressed("escape") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("escape") and get_tree().paused:
		resume() 


func _on_resume_pressed():
	resume() # Replace with function body.


func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()


func _on_exit_pressed():
	pass # Replace with function body.
	
func _process(delta):
	testEsc()
