extends Area2D

var speed = 500

var shoot = false


#var direction := Vector2.ZERO


func _physics_process(delta):
	position += Vector2.LEFT * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("handle_hit"):
		print("beam hit")
		body.handle_hit()


func _on_player_shoot() -> void:
	pass

