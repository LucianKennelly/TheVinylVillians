extends Node2D

const lines: Array[String] = [
	"[E]"
]
@onready var Record_Player: InteractionArea = $Record_Player/interaction_area
@onready var interact_sound = preload("res://WeirdSong(forlobby).mp3")
@onready var playersprite = $player/AnimatedSprite2D
@onready var Kanye = $Enemy/Path2D/PathFollow2D/Kanye/KanyeAnimate
# Called when the node enters the scene tree for the first time.
func _ready():
	$player.position = Vector2(500, 500)
	$player/AnimatedSprite2D.play("Idle")
	Kanye.play("default")
	$AudioStreamPlayer2D.play
	#Record_Player.interact = Callable(self, "_on_interact")
	#$Kanye.position = Vector2(500, -500)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$NextScene.connect("nextscene",changecamera)
func changecamera() -> void:
	print("here")
	$Camera2D.y = -500

func _on_interact():
	Record_Player.start_dialog(global_position, lines, interact_sound)
