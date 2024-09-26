extends Control

func _ready():
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur_animation")	
	
func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur_animation")
	

func testY():
	print("y has been pressed")
	if Input.is_action_just_pressed("Pause") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("Pause") and get_tree().paused:
		resume()
		
func _process(delta):
	print("process ==== running")
	testY()
	

func _on_resume_pressed() -> void:
	resume()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()
