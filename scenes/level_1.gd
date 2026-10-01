extends Node3D
@onready var _2d_canvas: CanvasLayer = $"2DCanvas"

var level_paused = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if level_paused:
			unpause_the_level()
		else:
			pause_the_level()

func pause_the_level() -> void:
	level_paused = true
	_2d_canvas.visible = true
	get_tree().paused = true

func unpause_the_level() -> void:
	level_paused = false
	_2d_canvas.visible = false
	get_tree().paused = false

func stop_level() -> void:
	get_tree().paused = true
