extends Node
class_name GameSystem

@onready var hole: Hole = $"../Hole"
@onready var time: Timer = $Timer

@onready var timer: Label = $CanvasLayer/Control/Timer
@onready var win_menu: Control = $CanvasLayer/WinMenu
@onready var control: Control = $CanvasLayer/Control
@onready var start_menu: Control = $CanvasLayer/StartMenu
@onready var task: Label = $CanvasLayer/StartMenu/Task
@export var size: Label
@export var xp_bar: ProgressBar
@export var update_label_interval: int = 1

@export var size_2_treshold: int = 5
@export var size_3_treshold: int = 10
@export var size_4_treshold: int = 15
@export var size_5_treshold: int = 20
@export var size_6_treshold: int = 25
@export var size_7_treshold: int = 30
@export var size_8_treshold: int = 40
@export var size_9_treshold: int = 50
@export var size_10_treshold: int = 60
@export var size_11_treshold: int = 70
@export var size_12_treshold: int = 80
@export var size_13_treshold: int = 90
@export var size_14_treshold: int = 100
@export var size_15_treshold: int = 110

var current_treshold: int = size_2_treshold
var score : int = 0
var hole_size: int = 1
var current_time_passed: float = 0.0
var player_moved : bool = false:
	set(value):
		if value and not player_moved:
			time.start()
			start_menu.visible = false
		player_moved = value


func _physics_process(delta: float) -> void:
	if player_moved == true:
		current_time_passed += delta
		if current_time_passed >= update_label_interval:
			current_time_passed -= update_label_interval
			timer.text = "%.2f" % time.time_left
	else:
		pass

func check_score() -> void:
	if score == size_2_treshold:
		update_score()
		current_treshold = size_3_treshold
	if score == size_3_treshold:
		update_score()
		current_treshold = size_4_treshold
	if score == size_4_treshold:
		update_score()
		current_treshold = size_5_treshold
	if score == size_5_treshold:
		update_score()
		current_treshold = size_6_treshold
	if score == size_6_treshold:
		update_score()
		current_treshold = size_7_treshold
	if score == size_7_treshold:
		update_score()
		current_treshold = size_8_treshold
	if score == size_8_treshold:
		update_score()
		current_treshold = size_9_treshold
	if score == size_9_treshold:
		update_score()
		current_treshold = size_10_treshold
	if score == size_10_treshold:
		update_score()
		current_treshold = size_11_treshold
	if score == size_11_treshold:
		update_score()
		current_treshold = size_12_treshold
	if score == size_12_treshold:
		update_score()
		current_treshold = size_13_treshold
	if score == size_13_treshold:
		update_score()
		current_treshold = size_14_treshold
	if score == size_14_treshold:
		update_score()
		current_treshold = size_15_treshold

func update_score() -> void:
	size_set_hole()
	hole.increase_size()


func win_game()-> void:
	time.stop()
	control.visible = false
	win_menu.visible = true

func restart_game() -> void:
	get_tree().reload_current_scene()

func _on_timer_timeout() -> void:
	restart_game()
	
func size_set_hole() -> void:
	hole_size += 1
	size.text = "Size: " +str(hole_size)

func xp_bar_calc() -> void:
	xp_bar.max_value = current_treshold
	xp_bar.value = score
