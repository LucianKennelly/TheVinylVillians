extends Area2D
var entered = false

func _on_body_entered(body: Node2D) -> void:
	entered = true
	



func _on_body_exited(body: Node2D) -> void:
	entered = false
	
#func _process(delta: float) -> void:
	#if entered == true:
		#get_tree().change_scene("res://record_room.tscn")
