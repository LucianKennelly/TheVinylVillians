extends Control
@onready var inv: Inv = preload("res://inventory/player_inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inv.update.connect(update_slots)
	update_slots()
	close()
func has_record(record: InvItem):
	for i in range(min(inv.items.size(), slots.size())):
		if slots[i].equals(record):
			print("works")
			return true
		else:
			return false
	
func close():
	visible = false
	is_open = false
func open():
	update_slots()
	self.visible = true
	is_open = true
func update_slots():
	for i in range(min(inv.items.size(), slots.size())):
		slots[i].update(inv.items[i])
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	update_slots()
	if Input.is_action_just_pressed("interact"):
		if is_open:
			close()
		else:
			open()


func _on_inv_ui_slot_mouse_entered() -> void:
	pass # Replace with function body.


func _on_inv_ui_slot_2_mouse_entered() -> void:
	pass # Replace with function body.
