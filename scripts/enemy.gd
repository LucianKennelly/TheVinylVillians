extends Node
@export var item: InvItem
@onready var path : PathFollow2D = $Path2D/PathFollow2D
@export var speed = 100
signal kanyedeath
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path.progress += speed*delta


func _on_kanye_kanyedeath() -> void:
	kanyedeath.emit()
