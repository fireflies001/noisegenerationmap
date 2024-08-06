extends CharacterBody2D


const SPEED = 300
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
var click_position = Vector2()



func _physics_process(delta):
	print(get_global_mouse_position())
	var next_path_pos := nav_agent.get_next_path_position()
	var dir := global_position.direction_to(next_path_pos)
	velocity = dir * SPEED
	move_and_slide()
	


func _on_timer_timeout():
	nav_agent.target_position = get_global_mouse_position()
