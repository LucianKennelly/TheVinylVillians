extends CharacterBody2D
#@export var inv: Inv =  preload("res://inventory/player_inventory.tres")
@export var item: InvItem = preload("res://inventory/items/record.tres")
var player = null
const SPEED = 600
const JUMP_VELOCITY = -400.0
@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
@onready var kanye = $KanyeAnimate
@onready var speed = 100
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
func recover():
	kanye.play("Idle")
func handle_hit():
	if kanye.animation == "Idle":
		kanye.play("Damaged")
	#print("enemy was hit!")


func collect(item):
	pass
	#inv.insert(item)
func _on_area_2d_body_entered(body: Node2D) -> void:
	print("working")
	if body.has_method("player_movement"):
		player = body
		player.collect(item)
