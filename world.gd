extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$player.position = Vector2(500, 500)
	$player/AnimatedSprite2D.play("Idle")
	$Kanye/AnimatedSprite2D.play("default")
	$Kanye.position = Vector2(500, -500)
	$NextScene.connect("nextscene",changecamera)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$NextScene.connect("nextscene",changecamera)
func changecamera() -> void:
	print("here")
	$Camera2D.y = -500
