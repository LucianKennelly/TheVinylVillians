extends CharacterBody2D
class_name Player
signal healthChanged

var can_move = true
var can_punch = true
var has_bump =true
var speed = 250
var normal_speed = 0.5
signal justpunched
@onready var kanyeclothes: InvItem = load("res://inventory/items/kanye_clothes.tres")
@onready var kanyerecord: InvItem = load("res://inventory/items/kanye_record.tres")
@export var inv: Inv = preload("res://inventory/player_inventory.tres")
var bullet_scene = preload("res://scenes/ultra_beam_left.tscn")
var has_armor = false



#### Player Stats


#set_max_health(1000)
@export var max_health: int = 100
var current_health: int = max_health



########

var nux_mode = false

@onready var character = $AnimatedSprite2D

@onready var punch = $PunchBox

#@onready var punchboxcoord = $PunchBox/PunchHitBox.get_shape().x
signal play
signal recordplayerinsert
signal directionchanged

var num_mode = 0
	
func update_current_mode(mode : bool):
	nux_mode = mode
	if nux_mode == false:
		max_health = 100
		print("normal mode")
	elif nux_mode == true:
		max_health = 9999999
		get_max_health()
		num_mode += 1
		print("nux mode")
		print(num_mode)

func get_max_health():
	print(max_health)
	
func set_max_health(val : int):
	max_health = val

func get_nux_mode():
	print(nux_mode)
	
func get_num_mode():
	print(num_mode)
	
func take_damage(amount: int) -> void:
	current_health -= amount
	healthChanged.emit()
	if current_health <= 0:
		die()
	else:
		print("Health: ", current_health)


func heal(amount: int) -> void:
	current_health += amount
	healthChanged.emit()
	if current_health > max_health:
		current_health = max_health
	print("Player Health: ", current_health)
	
func die() -> void:
	can_move= false
	print("Player is dead!")
	character.play("Death")
	#player_movement().paused = true
	await get_tree().create_timer(4.0).timeout
	get_tree().change_scene_to_file("res://scenes/record_room.tscn")
	#inv.clear()
	#$AnimatedSprite2D.play("Death")
	#queue_free()

func _physics_process(delta):
	#if has_armor:
	#	$Timer.start(1)
	player_movement(delta)
	

func player_movement(delta):
	if inv.has_record(kanyeclothes):
		has_armor = true
		_on_armor_animated_animation_changed()
	
	if can_move:
		#$player.connect("justpunched",justpunched)
		var collision_info = move_and_collide(velocity * delta * normal_speed)
		if Input.is_action_pressed("Up"):
			character.play("Run")
			velocity.y = -speed
			velocity.x = 0
		elif Input.is_action_pressed("Down"):
			character.play("Run")
			velocity.y = speed
			velocity.x = 0
		elif Input.is_action_pressed("Left"):
			character.play("Run")
			velocity.x = -speed
			velocity.y = 0
		elif Input.is_action_pressed("Right"):
			character.play("Run")
			velocity.x = speed
			velocity.y = 0
		elif Input.is_action_pressed("Punch") and can_punch:
			justpunched.emit()
			character.play("Punch")
			#punch.attack()
			velocity.y = 0
			velocity.x = 0
		elif Input.is_action_pressed("Nux"):
			current_health = 99999
			has_armor = true
			
		else:
			character.play("Idle")
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
			#this.scale.x = -1
			get_node("AnimatedSprite2D").flip_h = false
			get_node("ArmorAnimated").flip_h = false
			#punchboxcoord = punchboxcoord*-1
			directionchanged.emit()
			get_node("PunchBox").scale.x = 1
		elif velocity.x < 0:
			get_node("ArmorAnimated").flip_h = true
			#this.scale.x = -1
			character.flip_h = true
			get_node("PunchBox").scale.x = -0.5
			#punchboxcoord = punchboxcoord*-1
			directionchanged.emit()
		move_and_collide(velocity * delta * normal_speed)
	#f#unc justpunched() -> void:
		#if $AnimatedSprite2D.animation == "punch":
		#	can_punch = false
		#else:
		#	can_punch = true



func _ready():
	
	#print("ready")
	$UltraBeamLeft.hide()
	$UltraBeamRight.hide()
	$ArmorAnimated.visible = false
	
	
	$Timer.start(1)


func _on_timer_timeout() -> void:
	if has_armor:
		print("ultra")
		beamRight()
		beamLeft()
	$Timer.start(1)

func beamRight():
	var bullet = $UltraBeamRight
	bullet.global_position = global_position
	bullet.visible = true
	#print(global_position)
	get_tree().get_root().add_child(bullet)
	
func beamLeft():
	var bullet = $UltraBeamLeft
	bullet.global_position = global_position
	bullet.visible = true
	#print(global_position)
	get_tree().get_root().add_child(bullet)
		
	
func collect(item):
	inv.insert(item)
	#inv.insert(kanyeclothes)


func _on_enemy_kanyedeath() -> void:
	#print("here")
	heal(max_health-current_health)
	collect(kanyerecord)


func _on_inv_ui_play() -> void:
	play.emit()


func _on_inv_ui_firstcraft() -> void:
	if inv.has_record(kanyerecord):
		inv.delete(kanyerecord)
		inv.insert(kanyeclothes)
		print("kanye armor equipped")
		#_on_armor_animated_animation_changed()
		#has_armor = true
		recordplayerinsert.emit()
		


#
func _on_armor_animated_animation_changed() -> void:
	character.visible = false
	character = $ArmorAnimated
	character.visible = true
	
