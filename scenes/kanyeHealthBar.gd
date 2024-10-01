extends TextureProgressBar

@export var kanye: Kanye

func _ready():
	position = Vector2(440, -380)
	if kanye == null:
		print ("Kanye is not assigned!")
		return
	kanye.healthChanged.connect(update)
	update()
	
func _on_kanye_health_changed():
	if kanye.max_health != 0:
		value = clamp(kanye.current_health * 100 / kanye.max_health, 0, 100)

func update():
	value = kanye.current_health * 100 / kanye.max_health
