extends CharacterBody2D

@export var speed = 500
var spawnPos : Vector2
var spawnRot : float
@onready var BeamTimer = get_node("BeamTimer")
var direction : float
func _ready() -> void:
	global_position = spawnPos
	global_rotation = spawnRot
	BeamTimer.start(3)
func _physics_process(delta):
	velocity = Vector2(0,-speed).rotated(direction)
	move_and_slide()



func _on_timer_timeout() -> void:
	pass

func _on_beam_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player_movement"):
		print("bullet hit")
		body.take_damage(10)
		queue_free()
