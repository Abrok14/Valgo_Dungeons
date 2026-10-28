extends Control

@onready var continue_button: Button = $VBoxContainer/Continue
@onready var save_button: Button = $VBoxContainer/Save
@onready var exit_button: Button = $VBoxContainer/Exit
@onready var color_rect: ColorRect = $"../ColorRect"

func _ready() -> void:
	if continue_button:
		continue_button.pressed.connect(_on_continue_pressed)
	if save_button:
		save_button.pressed.connect(_on_save_pressed)
	if exit_button:
		exit_button.pressed.connect(_on_exit_pressed)

func _on_continue_pressed() -> void:
	get_tree().paused = false
	hide()
	if color_rect:
		color_rect.hide()

func _on_save_pressed() -> void:
	print("Ukladám hru...")

func _on_exit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://user_interface/Menu/menu.tscn")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://user_interface/Menu/Options.tscn")
