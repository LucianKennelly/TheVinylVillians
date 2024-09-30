extends Node
@export var item: InvItem
@onready var path : PathFollow2D = $Path2D/PathFollow2D
@export var speed = 200
signal daftpunkdeath
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if path != null:
	#	path.progress += speed*delta
	pass


func _on_timer_timeout() -> void:
	pass # Replace with function body.
