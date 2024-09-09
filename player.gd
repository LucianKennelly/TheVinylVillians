extends CharacterBody2D
var can_move = true
var has_bump =true
var speed = 250
var normal_speed = 0.5
signal bump
func _physics_process(delta):
	player_movement(delta)
func player_movement(delta):
	var collision_info = move_and_collide(velocity * delta * normal_speed)
	if Input.is_action_pressed("Up"):
		$AnimatedSprite2D.play("Run")
		velocity.y = -speed
		velocity.x = 0
	elif Input.is_action_pressed("Down"):
		$AnimatedSprite2D.play("Run")
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("Left"):
		$AnimatedSprite2D.play("Run")
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("Right"):
		$AnimatedSprite2D.play("Run")
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("Punch"):
		$AnimatedSprite2D.play("Punch")
		velocity.y = 0
		velocity.x = 0
	else:
		$AnimatedSprite2D.play("Idle")
		velocity.y = 0
		velocity.x = 0
	#velocity = velocity.normalized()
	#if collision_info:
		#velocity.y = 0
		#velocity.x = 0
		#if collision_info.get_collider() is CollisionShape2D:
			#emit_signal("bump")
			#has_bump = false
	if velocity.x > 0:
		get_node("AnimatedSprite2D").flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
		
	move_and_collide(velocity * delta * normal_speed)
