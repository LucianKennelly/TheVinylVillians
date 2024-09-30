extends CharacterBody2D
class_name Player
signal healthChanged
var has_sword = false
var can_move = true
var can_punch = true
var has_bump =true
var speed = 250
var normal_speed = 0.5
signal justpunched
@export var max_health: int = 100
var current_health: int = max_health
@onready var kanyeclothes: InvItem = load("res://inventory/items/kanye_clothes.tres")
@onready var kanyerecord: InvItem = load("res://inventory/items/kanye_record.tres")
@export var inv: Inv = preload("res://inventory/player_inventory.tres")
@export var recrod_inv: Inv = preload("res://inventory/record_player_inventory.tres")
@export var punkrecord: InvItem = load("res://inventory/items/punk_record.tres")
@export var punksword: InvItem = load("res://inventory/items/punk_sword.tres")
var bullet_scene = preload("res://scenes/ultra_beam_left.tscn")
var has_armor = false
@onready var character2 = $ArmorAnimated
@onready var playerscene = preload("res://scenes/player.tscn")
@onready var character = $AnimatedSprite2D
@export var can_daft = false
@onready var punch = $PunchBox
var UltraBeamLeft
var UltraBeamRight
var timer
#@onready var punchboxcoord = $PunchBox/PunchHitBox.get_shape().x
signal play2
signal play
signal recordplayerinsert
signal directionchanged
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
			if has_sword:
				character.play("Sword")
			else:
				character.play("Punch")
			#punch.attack()
			velocity.y = 0
			velocity.x = 0
			
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
	UltraBeamLeft = get_node("UltraBeamLeft")
	UltraBeamRight = get_node("UltraBeamRight")
	timer = get_node("Timer")
	character2 = get_node("ArmorAnimated")
	character2.visible =false
	#
	#timer.visible = false
	timer.start(1)


func _on_timer_timeout() -> void:
	if has_armor:
		#rint("ultra")
		beamRight()
		beamLeft()
	get_node("Timer").start(1)

func beamRight():
	var bullet = get_node("UltraBeamRight")
	bullet.global_position = global_position
	bullet.visible = true
	#print(global_position)
	get_tree().get_root().add_child(bullet)
	
func beamLeft():
	var bullet = get_node("UltraBeamLeft")
	bullet.global_position = global_position
	bullet.visible = true
	#print(global_position)
	get_tree().get_root().add_child(bullet)
		
	
func collect(item):
	inv.insert(item)
	#inv.insert(kanyeclothes)



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("handle_hit"):
		body.take_damage(10)


func _on_enemy_kanyedeath() -> void:
	#print("here")
	heal(max_health-current_health)
	collect(kanyerecord)
	can_daft = true


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
	character = get_node("ArmorAnimated")
	character.visible = true
	


func _on_daft_punk_daftpunkdeath() -> void:
	#print("here")
	heal(max_health-current_health)
	collect(punkrecord)


func _on_record_inv_ui_secondcraft() -> void:
	if inv.has_record(punkrecord):
		inv.delete(punkrecord)
		inv.insert(punksword)
		print("punk armor equipped")
		
		#_on_armor_animated_animation_changed()
		#has_armor = true
		recordplayerinsert.emit()


func _on_inv_ui_slot_2_mouse_entered() -> void:
	if inv.has_record(punkrecord):
		play2.emit()


func _on_inv_ui_play_2() -> void:
	play2.emit()


func _on_inv_ui_secondcraft() -> void:
	inv.delete(punkrecord)
	inv.insert(punksword)
	has_sword = true
	print("punk sword crafted")
