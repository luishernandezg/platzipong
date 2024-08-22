extends CharacterBody2D
class_name Ball

var speed = 0
var direction = Vector2.ZERO
var is_moving = false
@onready var timer: Timer = get_parent().find_child("RestartTimer")

func _ready():
	randomize()
	reset_ball()
	
	
func reset_ball():
	timer.stop()
	speed = 600
	direction.x =[-1,1][randi() % 2]
	direction.y = [-0.8, 0.8][randi() % 2]
	is_moving = true
	
func _physics_process(delta):
	if is_moving:
		var collide = move_and_collide(speed * direction * delta);
		if collide:
			$AudioCollision.play()
			direction = direction.bounce(collide.get_normal());


func _on_restart_timer_timeout() -> void:
	reset_ball()
