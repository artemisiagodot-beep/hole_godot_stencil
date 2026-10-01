extends Node
class_name GameSystem

@onready var hole: Hole = $"../Hole"
@onready var time: Timer = $Timer

@onready var timer: Label = $CanvasLayer/Control/Timer
@onready var win_menu: Control = $CanvasLayer/WinMenu
@onready var control: Control = $CanvasLayer/Control
@onready var start_menu: Control = $CanvasLayer/StartMenu
@onready var task: Label = $CanvasLayer/StartMenu/Task
@export var update_label_interval: int = 1

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



func win_game()-> void:
	time.stop()
	control.visible = false
	win_menu.visible = true

func restart_game() -> void:
	get_tree().reload_current_scene()

func _on_timer_timeout() -> void:
	restart_game()
