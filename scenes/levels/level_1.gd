extends Node3D
@onready var _2d_canvas: CanvasLayer = $"2DCanvas"
@export var game_system: GameSystem
@export var hole: Hole


var level_paused = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if game_system.start_menu.visible == true:
			game_system.player_moved = true
			hole.freeze = false
			hole.unfreeze.monitoring = true
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
