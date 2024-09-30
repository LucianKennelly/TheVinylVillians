extends TextureProgressBar


# Called when the node enters the scene tree for the first time.

@export var daftpunk : DaftPunk

func _ready():
	#position = Vector2(440, -380)
	if daftpunk == null:
		print ("Daft Punk is not assigned!")
		return
	daftpunk.healthChanged.connect(update)
	update()

func update():
	value = daftpunk.current_health * 500 / daftpunk.max_health


func _on_daft_punk_health_changed() -> void:
	if daftpunk.max_health != 0:
		value = clamp(daftpunk.current_health * 500 / daftpunk.max_health, 0, 500)
