extends Node2D

@export var kanye_scene = "res://kanye_room"

var mode = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var child = get_parent()
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


func _on_scene_transition_2_body_entered(body: Node2D) -> void:
	if body.has_method("player_movement"):
		print("leave record room")
		get_tree().change_scene_to_file("res://scenes/kanye_room.tscn")


func _on_record_inv_ui_play() -> void:
	$Lobby1.stop()
	$KanyeDisk.play()
