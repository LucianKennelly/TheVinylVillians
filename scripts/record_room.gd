extends Node2D
@onready var record_inv = preload("res://inventory/record_player_inventory.tres")
@onready var punkrecord = preload("res://inventory/items/punk_record.tres")
#@export var player : Player
@export var kanye_scene = "res://kanye_room"
var can_punk
var can_maze
var can_bach
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	can_punk = false
	can_maze = false
	#record_inv = load("res://inventory/record_player_inventory.tres")
	#punkrecord = load("res://inventory/items/punk_record.tres")
	$Lobby1.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		#if Input.is_action_just_pressed("Pause"):
		# change to pause
		#get_tree().change_scene_to_file("res://Scenes/controls.tscn")
	pass


func _on_scene_transition_body_entered(body: Node2D) -> void:
	if body.has_method("player_movement"):
		print("leave record room")
		get_tree().change_scene_to_file("res://scenes/kanye_room.tscn")
		


func _on_player_play() -> void:
	#print("here")
	#$Lobby1.stop()
	$UltralightBeam.play()
	$Lobby1.stop()
	$Stronger.stop()
	can_punk = true


func _on_scene_transition_2_body_entered(body: Node2D) -> void:
	if body.has_method("player_movement"):
		print("leave record room")
		get_tree().change_scene_to_file("res://scenes/kanye_room.tscn")


func _on_record_inv_ui_play() -> void:
	#print("play")
	$Lobby1.stop()
	$Bach.stop()
	$Stronger.stop()
	$UltralightBeam.play()
	can_punk = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player_movement"):
		if can_punk:
			print("leave record room")
			get_tree().change_scene_to_file("res://scenes/punk_room.tscn")


func _on_player_play_2() -> void:
	#if record_inv.has_record(punkrecord):
		#print("here")
		$Lobby1.stop()
		$Bach.stop()
		$UltralightBeam.stop()
		$Stronger.play()
		can_bach = true


func _on_record_inv_ui_secondplay() -> void:
	#if record_inv.has_record(punkrecord):
		$Lobby1.stop()
		$Bach.stop()
		$UltralightBeam.stop()
		$Stronger.play()
		can_bach = true

	


func _on_flower_room_body_entered(body: Node2D) -> void:
	if body.has_method("player_movement"):
		if can_maze:
			print("leave record room")
			get_tree().change_scene_to_file("res://scenes/FlowerRoom.tscn")


func _on_inv_ui_slot_3_mouse_entered() -> void:
	pass

func _on_bach_room_body_entered(body: Node2D) -> void:
	print("here")
	if body.has_method("player_movement"):
		if can_bach:
			print("leave record room")
			get_tree().change_scene_to_file("res://scenes/bach_room.tscn")


func _on_player_play_3() -> void:
	$Lobby1.stop()
	$UltralightBeam.stop()
	$Stronger.stop()
	$Bach.play()
	can_maze = true

	pass # Replace with function body.
