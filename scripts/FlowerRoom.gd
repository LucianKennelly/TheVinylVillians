extends Node2D
var flower_enemy_spawn = preload("res://scenes/flower_boss.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Timer start")
	
	$YouAreMySunshine.play()
	$Timer.start(35)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	$YouAreMySunshine.stop()
	$YouAreMySunshineDark.play()
	$TextureRect.texture = preload("res://art/Flower_Room_Run.png")
	var flower_enemy = flower_enemy_spawn.instantiate()
	flower_enemy.position = Vector2(100,50)
	add_child(flower_enemy)
	var flower_enemy2 = flower_enemy_spawn.instantiate()
	flower_enemy2.position = Vector2(926,940)
	add_child(flower_enemy)
	print("timer stop")
	
#func _on_flower_scene_transition_body_entered(body: Node2D) -> void:
	#if body.has_method("player_movement"):
		#print("leave flower room")
		#get_tree().change_scene_to_file("res://scenes/record_room.tscn")


func _on_scene_transition_body_entered(body: Node2D) -> void:
	if body.has_method("player_movement"):
		print("leave maze room")
		get_tree().change_scene_to_file("res://scenes/record_room.tscn")


func _on_player_gameover() -> void:
	get_tree().change_scene_to_file("res://scenes/gameover.tscn")
