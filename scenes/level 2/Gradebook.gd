extends Area2D

@onready var player : CharacterBody2D
@onready var animated_sprite = $Sprite2D

 
var acceleration: Vector2 = Vector2.ZERO 
var velocity: Vector2 = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().find_child("KOrotkov player")
func _physics_process(delta):
	acceleration = (player.position - position).normalized() * 700
 
	velocity += acceleration * delta
	rotation = velocity.angle()
 
	velocity = velocity.limit_length(500)
 
	position += velocity * delta
 
 
func _on_body_entered(body):
	queue_free()
