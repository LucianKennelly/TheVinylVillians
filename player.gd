extends CharacterBody2D


var speed = 250

func _physics_process(delta):
	player_movement(delta)
func player_movement(delta):
	if Input.is_action_pressed("Up"):
		velocity.y = -speed
		velocity.x = 0
	elif Input.is_action_pressed("Down"):
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("Left"):
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("Right"):
		velocity.x = speed
		velocity.y = 0
	else:
		velocity.y = 0
		velocity.x = 0
	#velocity = velocity.normalized()
	move_and_slide()
