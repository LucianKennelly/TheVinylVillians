extends Control



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/record_room.tscn")
	pass # Replace with function body.


func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Controls.tscn")

	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
