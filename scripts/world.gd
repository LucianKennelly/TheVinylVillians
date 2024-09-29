extends Node2D

const lines: Array[String] = [
	"[E]"
]
@export var kanye_scene = "res://kanye_room"
@onready var Record_Player: InteractionArea = $Record_Player/interaction_area
@onready var interact_sound = preload("res://soundtrack/WeirdSong(forlobby).mp3")
@onready var player = $Menu/NinePatchRect/GridContainer/RecordRoom/player
@onready var playersprite = $Menu/NinePatchRect/player/RecordRoom/AnimatedSprite2D
@onready var Kanye = $KanyeRoom/Enemy/Path2D/PathFollow2D/Kanye/KanyeAnimate
@onready var Lobby1 = $Lobby1
@onready var pause_menu = $Pause

# Called when the node enters the scene tree for the first time.
func _ready():
	print("print")
	get_tree().change_scene_to_file("res://scenes/Menu.tscn")
	#player.position = Vector2(500, 500)
	#playersprite.play("Idle")
#	Kanye.play("default")
	Lobby1.play
	
	#Record_Player.interact = Callable(self, "_on_interact")
	#$Kanye.position = Vector2(500, -500)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#$NextScene.connect("nextscene",changecamera)
	
	pass
func changecamera() -> void:
	print("here")
	$Camera2D.y = -500

func _on_interact():
	Record_Player.start_dialog(global_position, lines, interact_sound)


func _on_scene_transition_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file(kanye_scene)
	print("glitch")
