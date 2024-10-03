extends Control
@onready var record: InvItem = preload("res://inventory/items/kanye_record.tres")
@onready var punkrecord: InvItem = preload("res://inventory/items/punkrecord.tres")
@onready var record_inv: Inv = preload("res://inventory/record_player_inventory.tres")
@onready var bachrecord: InvItem = preload("res://inventory/items/bachrecord.tres")
@onready var inv: Inv = preload("res://inventory/player_inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
signal play
signal play3
signal play2
signal firstcraft
signal secondcraft
var insert = false
var is_open = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inv.update.connect(update_slots)
	update_slots()
	close()
func has_record(record: InvItem):
	for i in slots:
		if i == record:
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
	
	if Input.is_action_pressed("Play"):
		insert = true

func _on_inv_ui_slot_mouse_entered() -> void:
	#inv.update_slots()
	#record_inv.update_slots()
	if inv.has_record(record):
		#print("play")
		play.emit()
		if insert:
			print("craft kanye armor")
			firstcraft.emit()
		insert = false
	


func _on_interaction_area_body_entered(body: Node2D) -> void:
	if Input.is_action_pressed("Play"):
		#open()
		pass # Replace with function body.


func _on_interaction_area_body_exited(body: Node2D) -> void:
	if Input.is_action_pressed("Play"):
		#close()
		pass # Replace with function body.


func _on_inv_ui_slot_2_mouse_entered() -> void:
	#print("",inv.has_record(punkrecord))
	#print("",inv.has_record(punkrecord))
	if inv.has_record(punkrecord): #or record_inv.has_record(punkrecord):
		print("play")
		play2.emit()
		if insert:
			print("craft punk sword")
			secondcraft.emit()
		insert = false


func _on_inv_ui_slot_3_mouse_entered() -> void:
	if inv.has_record(bachrecord):
		play3.emit()
