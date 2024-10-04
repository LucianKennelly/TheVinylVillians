extends Node
@export var item: InvItem
@onready var path : PathFollow2D = $Path2D/PathFollow2D
@export var speed = 100
@onready var inv = preload("res://inventory/player_inventory.tres")
@onready var record_inv = preload("res://inventory/record_player_inventory.tres")
@onready var bachrecord = preload("res://inventory/items/bachrecord.tres")
signal kanyedeath
signal bachdeath
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path.progress += speed*delta


func _on_kanye_kanyedeath() -> void:
	kanyedeath.emit()


func _on_bach_bachdeath() -> void:
	if not inv.has_record(bachrecord) and not record_inv.has_record(bachrecord):
		inv.insert(bachrecord)
