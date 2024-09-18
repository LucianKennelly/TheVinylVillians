extends Area2D
class_name InteractionArea
@export var kanye_scene = "res://kanye_room"
@export var action_name : String = "interact"
# Called when the node enters the scene tree for the first time.
var interact: Callable = func():
	pass

	


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("player_movement"):
		InteractionManager.register_area(self)
		print("leave kanye room")
		get_tree().change_scene_to_file("res://scenes/record_room.tscn")

func _on_body_exited(body: Node2D) -> void:
	InteractionManager.unresgister_area(self)
