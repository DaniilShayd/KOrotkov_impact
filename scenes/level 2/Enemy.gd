extends CharacterBody2D
class_name StudentEnemy
@onready var animation = $AnimatedSprite2D

var health = 3


func _process(delta):
	if health <= 0:
		queue_free()
		
func  _physics_process(delta):
	if velocity.x > 0:
		if velocity.y > 0:
			if velocity.y > 150:
				animation.play("down")
			else:
				animation.play("right down")
				animation.flip_h = false
		elif velocity.y < 0:
			if velocity.y < -150:
				animation.play("up")
			else:
				animation.play("right up")
				animation.flip_h = false
	if velocity.x < 0:
		if velocity.y > 0:
			if velocity.y > 150:
				animation.play("down")
			else:
				animation.play("right down")
				animation.flip_h = true
		elif velocity.y < 0:
			if velocity.y < -150:
				animation.play("up")
			else:
				animation.play("right up")
				animation.flip_h = true
		
	
	move_and_slide()

func on_death():
	queue_free()
