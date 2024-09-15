extends StaticBody2D

@onready var interaction_area = $"interaction_area"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "donothing")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func donothing():
	pass
