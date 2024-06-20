extends CharacterBody2D

const max_speed = 400
const accel = 1500
const friction = 4000

var input = Vector2.ZERO


@onready var walk_sound = $walk_sound
@onready var animation = $AnimatedSprite2D
@onready var attack_animation = $"Weapon/Area2D/Attack animation"
@onready var weapon = $Weapon
@onready var timer = $Timer
var attacking = false
@onready var attack_sound = $Weapon/attack_sound


func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		animation.flip_h = false
		if !walk_sound.playing:
			walk_sound.play()
		
		if Input.is_action_pressed("ui_up"):
			if Input.is_action_just_pressed("attack"):
				_on_attack("attack up right", 315)
			else:
				animation.play("up right")
				
				
		elif Input.is_action_pressed("ui_down"):
			if Input.is_action_just_pressed("attack"):
				_on_attack("attack down right", 45)
			else:
				animation.play("down right")
		else:
			if Input.is_action_just_pressed("attack"):
				_on_attack("attack right", 0)
				
			else:
				animation.play("right")
				
				
			
	elif Input.is_action_pressed("ui_left"):
		animation.flip_h = true
		if !walk_sound.playing:
			walk_sound.play()
		
		if Input.is_action_pressed("ui_up"):
			if Input.is_action_just_pressed("attack"):
				_on_attack("attack up right", 225)
			else:
				animation.play("up right")
		elif Input.is_action_pressed("ui_down"):
			if Input.is_action_just_pressed("attack"):
				_on_attack("attack down right", 135)
			else:
				animation.play("down right")
		else:
			if Input.is_action_just_pressed("attack"):
				_on_attack("attack right", 180)
			else:
				animation.play("right")
	elif Input.is_action_pressed("ui_up"):
		if !walk_sound.playing:
			walk_sound.play()
		if Input.is_action_just_pressed("attack"):
				_on_attack("attack up", 270)
		else:
			animation.play("up")
	elif Input.is_action_pressed("ui_down"):
		
		if !walk_sound.playing:
			walk_sound.play()
		if Input.is_action_just_pressed("attack"):
			_on_attack("attack down", 90)
		else:
			animation.play("down")
	elif Input.is_action_just_pressed("attack"):
		if animation.flip_h == false:
			_on_attack("attack right", 0)
		else:
			_on_attack("attack right", 180)
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
	if attacking == false:
		if input == Vector2.ZERO:
			if velocity.length() > (friction * delta):
				velocity -= velocity.normalized() * (friction * delta)
			else:
				velocity = Vector2.ZERO
		else:
			velocity += (input * accel * delta)
			velocity = velocity.limit_length(max_speed)
	else:
		velocity = Vector2.ZERO
		
	move_and_slide()
	
func _on_attack(attack_type : String, attack_rotation : float):
	attacking = true
	timer.start()
	animation.play(attack_type)
	weapon.visible = true
	weapon.rotation_degrees = attack_rotation
	attack_animation.play("attack")
	attack_sound.play()
	await attack_animation.animation_finished and animation.animation_finished;
	weapon.visible = false

func _on_timer_timeout():
	attacking = false
