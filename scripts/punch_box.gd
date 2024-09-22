extends Area2D
#onready var anim = $Animat\
var punch = false
func _ready() -> void:
	pass
# Called when the node enters the scene tree for the first time.
func attack():
	$player/AnimatedSprite2D.play("Punch")
	


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("handle_hit") and punch:
		print("hit")
		body.handle_hit()
		punch = false
	#elif body.has_method("recover"):
	#	body.recover()


func _on_player_justpunched() -> void:
	punch = true
