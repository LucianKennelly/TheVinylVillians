extends Node2D

@export var player: Player
# Called when the node enters the scene tree for the first time.


# Called every frame. 'dextends Node
@export var item: InvItem
@onready var path : PathFollow2D = $Enemy/Path2D/PathFollow2D
@export var speed = 100
signal kanyedeath
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	player.has_sword = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#path.progress += speed*delta

func _on_exit_body_entered(body: Node2D) -> void:
	if body.has_method("player_movement"):
			print("leave bach room")
			get_tree().change_scene_to_file("res://scenes/record_room.tscn")
