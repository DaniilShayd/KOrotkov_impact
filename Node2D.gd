extends CharacterBody2D 
 
@onready var player = $"../KOrotkov player"

 
var direction : Vector2 
var DEF = 0 
 
func _ready():
	set_physics_process(false)
 
func _process(_delta):
	direction = player.position - position
 
 
func _physics_process(delta):
	velocity = direction.normalized() * 40
	move_and_collide(velocity * delta)

