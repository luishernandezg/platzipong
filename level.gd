extends Node2D

var playerScore = 0
var opponentScore = 0

func _process(delta: float) -> void:
	$ScorePlayer.text = str(playerScore)
	$ScoreOpponent.text = str(opponentScore)

func _restart_game():
	$Ball.is_moving = false
	$Ball.direction = Vector2.ZERO
	$Ball.position = Vector2(960,540)
	$Ball.reset_ball()


func _on_point_zone_player_body_entered(body: Node2D) -> void:
	if body is Ball:
		opponentScore += 1
		_restart_game()


func _on_point_zone_oponent_body_entered(body: Node2D) -> void:
	if body is Ball:
		playerScore += 1
		_restart_game()
