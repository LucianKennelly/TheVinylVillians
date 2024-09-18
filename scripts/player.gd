extends CharacterBody2D
var can_move = true
var can_punch = true
var has_bump =true
var speed = 250
var normal_speed = 0.5
signal justpunched
@export var max_health: int = 100
var current_health: int = max_health
@onready var kanyerecord: InvItem = load("res://inventory/items/record.tres")
@export var inv: Inv = preload("res://inventory/player_inventory.tres")
@onready var punch = $PunchBox
signal play
func take_damage(amount: int) -> void:
	current_health -= amount
	if current_health <= 0:
		die()
	else:
		print("Health: ", current_health)

func heal(amount: int) -> void:
	current_health += amount
	if current_health > max_health:
		current_health = max_health
	print("Player Health: ", current_health)
	
func die() -> void:
	can_move= false
	print("Player is dead!")
	$AnimatedSprite2D.play("Death")
	#player_movement().paused = true
	await get_tree().create_timer(4.0).timeout
	get_tree().change_scene_to_file("res://scenes/record_room.tscn")
	#inv.clear()
	#$AnimatedSprite2D.play("Death")
	#queue_free()

func _physics_process(delta):
	player_movement(delta)
func player_movement(delta):
	if can_move:
		#$player.connect("justpunched",justpunched)
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
		elif Input.is_action_pressed("Punch") and can_punch:
			justpunched.emit()
			$AnimatedSprite2D.play("Punch")
			#punch.attack()
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
			get_node("PunchBox").scale.x = -1.5
			get_node("PlayerHitBox").scale.x = 1
		elif velocity.x < 0:
			$AnimatedSprite2D.flip_h = true
			get_node("PunchBox").scale.x = 0.5
			get_node("PlayerHitBox").scale.x = -1
		move_and_collide(velocity * delta * normal_speed)
	#f#unc justpunched() -> void:
		#if $AnimatedSprite2D.animation == "punch":
		#	can_punch = false
		#else:
		#	can_punch = true

func _ready():
	pass
func collect(item):
	inv.insert(item)




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("handle_hit"):
		take_damage(10)


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.has_method("handle_hit"):
		print("hit")
		take_damage(10)


func _on_enemy_kanyedeath() -> void:
	print("here")
	heal(max_health-current_health)
	collect(kanyerecord)


func _on_inv_ui_play() -> void:
	play.emit()
