extends CharacterBody2D
class_name Kanye
signal healthChanged

# Health-related variables
@export var max_health: int = 100
var current_health: int = max_health
signal kanyedeath
#@export var inv: Inv =  preload("res://inventory/player_inventory.tres")
var player = null
@export var kanye_record = preload("res://inventory/items/record.tres")
const SPEED = 600
const JUMP_VELOCITY = -400.0

@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
@onready var kanye = $KanyeAnimate
@onready var speed = 100

func _ready():
	pass
	#test_health_system()

func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	#$Path2D/PathFollow2D/Kanye/KanyeAnimate.play("Idle")
	# Add the gravity.
	#var positive = 1
	#var pos = randf()
	#if pos < 0.5:
	#	positive = 10
	#else:
	#	positive = -10
	#velocity.x = delta * SPEED * positive
	#velocity.y = delta * SPEED * positive

	move_and_slide()
	
# Health System
func take_damage(amount: int) -> void:
	current_health -= amount
	healthChanged.emit()
	if current_health <= 0:
		die()
	else:
		kanye.play("Damaged")
		print("Health: ", current_health)
		
func heal(amount: int) -> void:
	current_health += amount
	healthChanged.emit()
	if current_health > max_health:
		current_health = max_health
	print("Health: ", current_health)
	
func die() -> void:
	print("Kanye is dead!")
	kanye.play("Death")
	await get_tree().create_timer(1.0).timeout
	kanyedeath.emit()
	queue_free()

# Test damage and healing
func test_health_system() -> void:
	print("Testing Health System")
	take_damage(20)
	await get_tree().create_timer(1.0).timeout
	heal(10)
	await get_tree().create_timer(1.0).timeout
	take_damage(85)
	await get_tree().create_timer(1.0).timeout
	take_damage(5)
	
func recover():
	kanye.play("Idle")
	
func handle_hit():
	if kanye.animation == "Idle":
		kanye.play("Damaged")
	print("Kanye Health: ",current_health)
	take_damage(10)
	await get_tree().create_timer(1.0).timeout
	recover()
	#print("enemy was hit!")

func handle_nuxhit():
	if kanye.animation == "Idle":
		kanye.play("Damaged")
	print("Kanye Health: ",current_health)
	take_damage(100)
	await get_tree().create_timer(1.0).timeout
	recover()
func collect(item):
	pass
	#inv.insert(item)
  
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player_movement"):
		player =body
		player.take_damage(10)
