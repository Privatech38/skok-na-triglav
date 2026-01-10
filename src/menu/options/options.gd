extends MarginContainer

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://src/menu/main/Menu.tscn")

func _on_audio_pressed() -> void:
	get_tree().change_scene_to_file("res://src/menu/audio/Audio.tscn")
