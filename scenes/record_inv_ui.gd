
extends Control
@export var record_inv: Inv = preload("res://inventory/record_player_inventory.tres")
@export var kanye_record: InvItem = load("res://inventory/items/kanye_record.tres")
# Called when the node enters the scene tree for the first time.
@onready var record: InvItem = preload("res://inventory/items/record.tres")
#@onready var inv: Inv = preload("res://inventory/player_inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
signal play
signal firstcraft

var is_open = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	record_inv.update.connect(update_slots)
	update_slots()
	close()
	
func close():
	visible = false
	is_open = false
func open():
	update_slots()
	self.visible = true
	is_open = true
func update_slots():
	for i in range(min(record_inv.items.size(), slots.size())):
		slots[i].update(record_inv.items[i])
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	update_slots()
	if Input.is_action_just_pressed("interact"):
		if is_open:
			close()
		else:
			open()


func _on_inv_ui_slot_mouse_entered() -> void:
	if record_inv.has_record(kanye_record):
		play.emit()
	if Input.is_action_pressed("Play"): #and has_record(kanye_record):
		print("craft kanye armor")
		firstcraft.emit()

func _on_player_recordplayerinsert() -> void:
	#print("inserted")
	#record_inv.insert(kanye_record)
	#update_slots()
	pass
