extends Node2D

@onready var pause_menu: Control = $CanvasLayer/PauseMenu
@onready var color_rect: ColorRect = $CanvasLayer/ColorRect

func _ready() -> void:
	if pause_menu:
		pause_menu.hide()
	if color_rect:
		color_rect.hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()

func toggle_pause() -> void:
	var is_paused: bool = !get_tree().paused
	get_tree().paused = is_paused
	
	if pause_menu:
		pause_menu.visible = is_paused
	if color_rect:
		color_rect.visible = is_paused
