# extension of game_system for level2 need
extends GameSystem 

@export var level_2: Node3D
@export var pillars_to_collect : int = 5
@onready var counter: Label = $CanvasLayer/Control/Counter
var game_won: bool = false

func _ready() -> void:
	task.text = "Your task is collect " + str(pillars_to_collect)+ " pillars before time run out." 
	counter.text = "Pillars to collect: " +str(pillars_to_collect)

func check_score() -> void:
	if score == 2:
		hole.increase_size()
	if score == 5: 
		hole.increase_size()
	if score == 10: 
		hole.increase_size()
	if score == 15: 
		hole.increase_size()
	if score == 20: 
		hole.increase_size()
	if score == 25: 
		hole.increase_size()
	if score == 30: 
		hole.increase_size()
	if score == 40: 
		hole.increase_size()
	if score == 50: 
		hole.increase_size()

func _on_collector_body_entered(body: Node3D) -> void:
	if body.is_in_group("pillar"):
		pillars_to_collect -= 1
		counter.text = "Pillars to collect: " +str(pillars_to_collect)
		if pillars_to_collect <= 0 and not game_won:
			game_won = true
			win_game()
			level_2.stop_level()
			
	if body.is_in_group("fallable"):
		score += body.value_of_object
		check_score()
		body.queue_free()
