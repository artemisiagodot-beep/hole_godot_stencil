extends Control

@onready var start_button: Button = $VBoxContainer/StartButton
@onready var exit_button: Button = $VBoxContainer/ExitButton
@onready var color_rect: ColorRect = $ColorRect
var time_add: float = 0.0
var update_time: float = 1.0

func _physics_process(delta: float) -> void:
	time_add += delta
	if time_add >= update_time:
		time_add -= update_time
		color_rect.color = Color.from_hsv(randf_range(0.01,1.0),randf_range(0.01,1.0),randf_range(0.01,1.0), 1.0)

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://map.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
