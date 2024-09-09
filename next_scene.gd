extends StaticBody2D

signal nextScene;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", maketrue)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func maketrue() -> void:
	emit_signal("nextScene")
