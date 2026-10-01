extends CanvasLayer

var bus_music = AudioServer.get_bus_index("Music")
var bus_sfx = AudioServer.get_bus_index("SFX")

func _on_resume_pressed() -> void:
	visible = false


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_music, value)

func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_sfx, value)
