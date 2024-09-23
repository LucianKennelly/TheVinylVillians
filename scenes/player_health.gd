extends TextureProgressBar

@export var player: Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#position = Vector2(500, 300)
	if player == null:
		print("Player is not assigned!")
		return 
	player.healthChanged.connect(update)
	update()

func update():
	value = player.current_health * 100 / player.max_health


func _on_player_health_changed() -> void:
	if player.max_health != 0:
		value = clamp(player.current_health * 100 / player.max_health, 0, 100)
