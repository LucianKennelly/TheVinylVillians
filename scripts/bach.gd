extends CharacterBody2D
class_name Bach

const SPEED = 4000.0
const JUMP_VELOCITY = -400.0
@export var max_health: int = 500
signal healthChanged
var current_health: int = max_health
@onready var target_to_chase: CharacterBody2D = $"../player"
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var bachrecord : InvItem = preload("res://inventory/items/bachrecord.tres")
@onready var inv: Inv = preload("res://inventory/player_inventory.tres")
@onready var record_inv : Inv = preload("res://inventory/record_player_inventory.tres")
signal bachdeath
func _physics_process(delta: float) -> void:
	#navigation_agent.target_position = target_to_chase.global_position
	#velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * SPEED
	move_and_slide()
func take_damage(amount: int) -> void:
	current_health -= amount
	healthChanged.emit()
	if current_health <= 0:
		die()
func heal(amount: int) -> void:
	current_health += amount
	healthChanged.emit()
	if current_health > max_health:
		current_health = max_health
	print("Health: ", current_health)
	
func die() -> void:
	print("Bach is dead!")
	if inv.has_record(bachrecord) or record_inv.has_record(bachrecord):
		pass
	else:
		inv.insert(bachrecord)
	#bachdeath.emit()
	await get_tree().create_timer(1.0).timeout
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
func handle_hit():
	print("Bach Health: ",current_health)
	take_damage(10)
	#await get_tree().create_timer(1.0).timeout
	#print("enemy was hit!")

func handle_nuxhit():
	print("Bach Health: ",current_health)
	take_damage(100)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player_movement"):
	#	player = body
		body.take_damage(10)
