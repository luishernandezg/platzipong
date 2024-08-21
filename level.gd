extends Node2D


func _restart_game():
	$Ball.is_moving = false
	$Ball.direction = Vector2.ZERO
	$Ball.position = Vector2(960,540)
	$Ball.reset_ball()


func _on_point_zone_player_body_entered(body: Node2D) -> void:
	_restart_game()


func _on_point_zone_oponent_body_entered(body: Node2D) -> void:
	_restart_game()
