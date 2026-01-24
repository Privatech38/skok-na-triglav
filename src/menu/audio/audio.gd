extends MarginContainer

var config = ConfigFile.new()

@onready var apply_button = $VBoxContainer/HBoxContainer/ApplyButton

@onready var main_volume_slider = $VBoxContainer/MainVolumeContainer/MainVolumeSlider
@onready var sfx_volume_slider = $VBoxContainer/SFXVolumeContainer/SFXVolumeSlider

func _ready() -> void:
	config.load("user://settings.cfg")
	if !config.has_section("audio"):
		config.set_value("audio", "main", 100)
		config.set_value("audio", "sfx", 100)
		config.save("user://settings.cfg")
	
	main_volume_slider.value = config.get_value("audio", "main", 100)
	sfx_volume_slider.value = config.get_value("audio", "sfx", 100)

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://src/menu/options/Options.tscn")

func _on_apply_button_pressed() -> void:
	config.save("user://settings.cfg")
	apply_button.visible = false

func _on_main_volume_slider_drag_ended(value_changed: bool) -> void:
	if !value_changed:
		return
	config.set_value("audio", "main", main_volume_slider.value)
	apply_button.visible = true

func _on_sfx_volume_slider_drag_ended(value_changed: bool) -> void:
	if !value_changed:
		return
	config.set_value("audio", "sfx", sfx_volume_slider.value)
	apply_button.visible = true
