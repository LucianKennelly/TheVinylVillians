extends TextureProgressBar

@export var player: Player

func _ready():
	position = Vector2(-80, 60)
	if player == null:
		print ("Player is not assigned!")
		return
	player.healthChanged.connect(update)
	update()
	
func _on_player_health_changed():
	if player.max_health != 0:
		value = clamp(player.current_health * 100 / player.max_health, 0, 100)

func update():
	value = player.current_health * 100 / player.max_health
