extends Control

var is_paused = false

func _ready() -> void:
	visible = is_paused

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		toggle_pause()
		get_viewport().set_input_as_handled()

func toggle_pause():
	get_viewport().set_input_as_handled()
	
	is_paused = !is_paused
	get_tree().paused = is_paused
	visible = is_paused

func _on_continue_button_down() -> void:
	toggle_pause()

func _on_quit_button_down() -> void:
	get_tree().quit()
