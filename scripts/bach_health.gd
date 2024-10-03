extends TextureProgressBar

@export var bach: Bach

func _ready():
	#position = Vector2(440, -380)
	if bach == null:
		print ("Kanye is not assigned!")
		return
	bach.healthChanged.connect(update)
	update()
	
func _on_kanye_health_changed():
	if bach.max_health != 0:
		value = clamp(bach.current_health * 500 / bach.max_health, 0, 500)

func update():
	value = bach.current_health * 500 / bach.max_health
