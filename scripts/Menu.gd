extends Control
var nux_mode = false

func _on_play_pressed() -> void:
	set_mode()
	get_tree().change_scene_to_file("res://scenes/record_room.tscn")
	pass # Replace with function body.


func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Controls.tscn")

	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_nux_mode_pressed() -> void:
	nux_mode = true
	set_mode()
	get_tree().change_scene_to_file("res://scenes/record_room.tscn")

func set_mode():
	var player = $RecordRoom.get_node("player")
	player.update_current_mode(nux_mode)
