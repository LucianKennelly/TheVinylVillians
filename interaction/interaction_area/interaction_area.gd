extends Area2D
class_name InteractionArea
@export var action_name : String = "interact"
# Called when the node enters the scene tree for the first time.
var interact: Callable = func():
	pass

	


func _on_body_entered(body: Node2D) -> void:
	InteractionManager.register_area(self)

func _on_body_exited(body: Node2D) -> void:
	InteractionManager.unresgister_area(self)
