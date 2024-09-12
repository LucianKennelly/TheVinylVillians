extends Node2D

@onready var Kanye = $Enemy/Path2D/PathFollow2D/Kanye/KanyeAnimate
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$player.position = Vector2(500, 500)
	$player/AnimatedSprite2D.play("Idle")
	Kanye.play("default")
	$AudioStreamPlayer2D.play
	#$Kanye.position = Vector2(500, -500)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$NextScene.connect("nextscene",changecamera)
func changecamera() -> void:
	print("here")
	$Camera2D.y = -500
