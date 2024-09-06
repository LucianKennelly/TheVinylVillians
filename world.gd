extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$player/AnimatedSprite2D.position = Vector2(500, 500)
	$player/AnimatedSprite2D.play("Idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
