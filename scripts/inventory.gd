extends Resource

class_name Inv
signal update

@export var items: Array[InvItem]
func insert(item: InvItem):
	var counter = 0
	for i in items:
		if i == null:
			items[counter] = item
			print("insert")
			break
		counter += 1
	update.emit()
func delete(item: InvItem):
	var counter = 0
	for i in items:
		if i == item:
			items[counter] = null
		counter += 1

func has_record(record: InvItem):
	var truth = false
	for i in items:
		if i != null:
			if i == record:
				truth = true
	return truth
