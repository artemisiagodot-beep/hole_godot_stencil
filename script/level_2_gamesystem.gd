# extension of game_system for level2 need
extends GameSystem 

@export var level_2: Node3D
@export var pillars_to_collect : int = 5
@onready var counter: Label = $CanvasLayer/Control/Counter
var game_won: bool = false

func _ready() -> void:
	task.text = "Your task is collect " + str(pillars_to_collect)+ " pillars before time run out." 
	counter.text = "Pillars to collect: " +str(pillars_to_collect)



func _on_collector_body_entered(body: Node3D) -> void:
	if body.is_in_group("pillar"):
		pillars_to_collect -= 1
		counter.text = "Pillars to collect: " +str(pillars_to_collect)
		if pillars_to_collect <= 0 and not game_won:
			game_won = true
			win_game()
			level_2.stop_level()
			await get_tree().create_timer(3.0).timeout
			get_tree().call_deferred("change_scene_to_file", "uid://bqslavymdgbfo")
			
	if body.is_in_group("fallable"):
		score += body.value_of_object
		xp_bar_calc()
		check_score()
		#body.queue_free()
