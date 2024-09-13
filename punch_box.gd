extends Area2D
#onready var anim = $Animat

signal justpunched
# Called when the node enters the scene tree for the first time.
func attack():
	$player/AnimatedSprite2D.play("Punch")
	


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("handle_hit"):#and $player/AnimatedSprite2D.play("Punch") == true:
		justpunched
		body.handle_hit()
	elif body.has_method("recover"):
		body.recover()
