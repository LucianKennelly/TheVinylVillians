extends Node2D

const lines: Array[String] = [
	"[E]"
]
@onready var Record_Player: InteractionArea = $Record_Player/interaction_area
@onready var interact_sound = preload("res://soundtrack/WeirdSong(forlobby).mp3")
@onready var playersprite = $player/AnimatedSprite2D
@onready var Kanye = $Enemy/Path2D/PathFollow2D/Kanye/KanyeAnimate
@onready var pause_menu = $Pause

var is_paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$player.position = Vector2(500, 500)
	$player/AnimatedSprite2D.play("Idle")
	Kanye.play("default")
	$Lobby1.play
	print("print")
	
	#Record_Player.interact = Callable(self, "_on_interact")
	#$Kanye.position = Vector2(500, -500)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print("print")
	$NextScene.connect("nextscene",changecamera)
	pause_menu.testY()
	
	
func changecamera() -> void:
	print("here")
	$Camera2D.y = -500

func _on_interact():
	Record_Player.start_dialog(global_position, lines, interact_sound)


func _on_player_playerdeath() -> void:
	pass
	#await get_tree().create_timer(5.0).timeout
	#get_tree().paused= true
