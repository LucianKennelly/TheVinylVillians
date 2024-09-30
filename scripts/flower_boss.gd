extends CharacterBody2D

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var target_to_chase: CharacterBody2D = $"../player"


const SPEED = 150.0



func _physics_process(delta: float) -> void:
	navigation_agent.target_position = target_to_chase.global_position
	velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * SPEED
	move_and_slide()

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if body.has_method("player_movement"):
		var player =body
		player.take_damage(100)
