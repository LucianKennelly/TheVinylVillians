extends Node2D
signal daftpunkdeath

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Stronger.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_scene_transition_body_entered(body: Node2D) -> void:
	if body.has_method("player_movement"):
		print("leave daft punk room")
		get_tree().change_scene_to_file("res://scenes/record_room.tscn")
