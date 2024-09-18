extends Resource

class_name Inv
signal update

@export var items: Array[InvItem]
func insert(item: InvItem):
	#var itemslots = items.filter(func(slot): return slot.item == item)
	#if !itemslots.is_empty():
	items[0] = item
	#else:
		#ar emptyslots = slots.filter(func(slot): return slot.item == null)
		#if !emptyslots.is_empty():
		#mptyslots[0].item = item
	update.emit()
