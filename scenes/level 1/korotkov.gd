extends CharacterBody2D

const max_speed = 400
const accel = 1500
const friction = 4000

var input = Vector2.ZERO


@onready var walk_sound = $walk_sound
@onready var animation = $AnimatedSprite2D
 
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		
		if !walk_sound.playing:
			walk_sound.play()
		
		if Input.is_action_pressed("ui_up"):
			animation.play("up right")
			animation.flip_h = false
				
		elif Input.is_action_pressed("ui_down"):
			animation.play("down right")
			animation.flip_h = false
		else:
			animation.play("right")
			animation.flip_h = false
			
	elif Input.is_action_pressed("ui_left"):
		
		if !walk_sound.playing:
			walk_sound.play()
		
		if Input.is_action_pressed("ui_up"):
			animation.play("up right")
			animation.flip_h = true
		elif Input.is_action_pressed("ui_down"):
			animation.play("down right")
			animation.flip_h = true 
		else:
			animation.play("right")
			animation.flip_h = true 
	elif Input.is_action_pressed("ui_up"):
		
		if !walk_sound.playing:
			walk_sound.play()
		
		animation.play("up")
	elif Input.is_action_pressed("ui_down"):
		
		if !walk_sound.playing:
			walk_sound.play()
		
		animation.play("down")
	else:
		animation.play("idle")
		if walk_sound.playing:
			walk_sound.stop()
		
	player_movement(delta)
	
func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()

func player_movement(delta):
	input = get_input() 
	

	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(max_speed)
		
		
	move_and_slide()
	







