# extension of game_system for level1 need
extends GameSystem

@onready var counter: Label = $CanvasLayer/Control/Counter
@export var balls_to_collect = 25
@export var level_1: Node3D


var score : int = 0
var game_won: bool = false

func _ready() -> void:
	task.text = "Collect " + str(balls_to_collect)+ " balls before time run out." 
	counter.text = "Left to collect: " +str(balls_to_collect)

func check_score() -> void:
	if score == 5:
		update_score()
	if score == 10: 
		update_score()
	if score == 17: 
		update_score()


func _on_collector_body_entered(body: Node3D) -> void:
	if body.is_in_group("ball"):
		balls_to_collect -= 1
		counter.text = "Left to collect: " +str(balls_to_collect)
		if balls_to_collect <= 0 and not game_won:
			game_won = true
			win_game()
			level_1.stop_level()
			await get_tree().create_timer(3.0).timeout
			get_tree().call_deferred("change_scene_to_file", "uid://c030bssualgeh")
	if body.is_in_group("fallable"):
		score += body.value_of_object
		check_score()
		body.queue_free()

func update_score() -> void:
	size_set_hole()
	hole.increase_size()
