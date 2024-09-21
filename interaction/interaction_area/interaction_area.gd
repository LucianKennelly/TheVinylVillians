extends Area2D
class_name InteractionArea
@export var kanye_scene = "res://kanye_room"
@export var action_name : String = "interact"
@export var player_inventory : Inv = preload("res://inventory/player_inventory.tres")
@export var record_inventory : Inv = preload("res://inventory/record_player_inventory.tres")
@export var kanye_record : InvItem = preload("res://inventory/items/kanye_record.tres")
# Called when the node enters the scene tree for the first time.
var interact: Callable = func():
	pass

	


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("player_movement"):
		#InteractionManager.register_area(self)
		#if Input.is_action_pressed("Play"):
		record_inventory.open()
			

func _on_body_exited(body: Node2D) -> void:
	if body.has_method("player_movement"):
		#InteractionManager.register_area(self)
		#if Input.is_action_pressed("Play"):
		record_inventory.close()


func _on_player_recordplayerinsert() -> void:
	#if player_inventory.has_record(kanye_record):
		print("here")
		record_inventory.insert(kanye_record)
	#record_inventory.update_slots()
