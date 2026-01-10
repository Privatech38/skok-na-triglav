extends Button

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://src/map/beggining.tscn")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://src/menu/options/Options.tscn")
