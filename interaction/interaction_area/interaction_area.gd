extends Area2D
class_name InteractionArea
@export var kanye_scene = "res://kanye_room"
@export var action_name : String = "interact"
@export var record_inventory : Inv = preload("res://inventory/record_player_inventory.tres")
# Called when the node enters the scene tree for the first time.
var interact: Callable = func():
	pass

	


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("player_movement"):
		#InteractionManager.register_area(self)
		if Input.is_action_pressed("Play"):
			record_inventory.open()
			

func _on_body_exited(body: Node2D) -> void:
	pass
	#if body.has_method("player_movement"):
		#InteractionManager.unresgister_area(self)
