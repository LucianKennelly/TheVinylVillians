extends CharacterBody2D


const SPEED = 600
const JUMP_VELOCITY = -400.0
@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
@onready var speed = 100
func _process(delta: float) -> void:
	path_follow.progress += speed*delta
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
	$Path2D/PathFollow2D/KanyeAnimate.play("Idle")
func handle_hit():
	if $Path2D/PathFollow2D/KanyeAnimate.animation == "Idle":
		$Path2D/PathFollow2D/KanyeAnimate.play("Damaged")
	#print("enemy was hit!")
