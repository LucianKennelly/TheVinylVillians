extends Control

var is_open = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close()
func close():
	visible = false
	is_open = false
func open():
	self.visible = true
	is_open = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if is_open:
			close()
		else:
			open()
