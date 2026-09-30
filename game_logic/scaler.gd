extends Node
class_name GameSystem 
@onready var hole: Hole = $"../Hole"


@onready var time: Timer = $Timer
@onready var timer: Label = $CanvasLayer/Control/Timer
@onready var score_label: Label = $CanvasLayer/Control/Score
@onready var win_menu: Control = $CanvasLayer/WinMenu
@onready var control: Control = $CanvasLayer/Control

@export var update_label_interval: int = 1
@export var win_score: int = 25
var current_time_passed: float = 0.0
var score : int = 0

func _physics_process(delta: float) -> void:
	current_time_passed += delta
	if current_time_passed >= update_label_interval:
		current_time_passed -= update_label_interval
		timer.text = "%.2f" % time.time_left
		score_label.text = "Score: %d" % score

func check_score() -> void:
	if score == 10:
		hole.increase_size()
		print("size 1")
	if score == 20: 
		hole.increase_size()
		print("size 2")
	if score == win_score:
		win_game()

func _on_collector_body_entered(body: Node3D) -> void:
	if body.is_in_group("fallable"):
		score += body.value_of_object
		check_score()
		body.queue_free()
		

func win_game()-> void:
	time.stop()
	control.visible = false
	win_menu.visible = true
	


func restart_game() -> void:
	score = 0
	get_tree().reload_current_scene()


func _on_timer_timeout() -> void:
	restart_game()
