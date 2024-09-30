extends CharacterBody2D
class_name DaftPunk

signal healthChanged

# Health-related variables
@export var max_health: int = 500
var current_health: int = max_health
signal daftpunkdeath
#@export var inv: Inv =  preload("res://inventory/player_inventory.tres")
var player : Player
@export var kanye_record = preload("res://inventory/items/record.tres")
const SPEED = 600
const JUMP_VELOCITY = -400.0
@onready var main = get_tree().get_root().get_node("PunkRoom")
@onready var projectile = load("res://scenes/beam.tscn")
@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
@onready var kanye
@onready var speed = 100
@onready var beamscene = preload("res://scenes/beam.tscn")
func _ready():
	$Timer.start(1)
	#test_health_system()

func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	rotation_degrees += 50*delta

	move_and_slide()
	
# Health System
func take_damage(amount: int) -> void:
	current_health -= amount
	healthChanged.emit()
	if current_health <= 0:
		die()
	else:
		#kanye.play("Damaged")
		print("Health: ", current_health)
		
func heal(amount: int) -> void:
	current_health += amount
	healthChanged.emit()
	if current_health > max_health:
		current_health = max_health
	print("Health: ", current_health)
	
func die() -> void:
	print("Daft Punk is dead!")
	$AnimatedSprite2D.play("death")
	await get_tree().create_timer(10.0).timeout
	daftpunkdeath.emit()
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
	#if kanye.animation == "Idle":
	#	kanye.play("Damaged")
	print("Daft Punk Health: ",current_health)
	take_damage(10)
	#await get_tree().create_timer(1.0).timeout
	#recover()
	#print("enemy was hit!")

func collect(item):
	pass
	#inv.insert(item)
  
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player_movement"):
		player =body
		player.take_damage(10)

func beam():
		var bullet = beamscene.instantiate()
		bullet.direction = rotation
		bullet.spawnPos = global_position
		bullet.spawnRot = rotation
		bullet.visible = true
		main.add_child.call_deferred(bullet)
func _on_timer_timeout() -> void:
	beam()
	$Timer.start(0.25)


func _on_beam_body_entered(body: Node2D) -> void:
	print("here")
	if body.has_method("player_movement"):
		print("found player")
		player =body
		player.take_damage(10)
