extends MarginContainer

func _ready() -> void:
	var config = ConfigFile.new()
	if config.load("user://settings.cfg") != OK:
		config.save("user://settings.cfg")

func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://src/map/beggining.tscn")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://src/menu/options/Options.tscn")
