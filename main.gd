extends Node

var is_paused = false

func _process(_delta: float) -> void:
	if Input.is_action_pressed("pause"):
		toggle_pause()
		get_viewport().set_input_as_handled()

func toggle_pause():
	is_paused = !is_paused
	get_tree().paused = is_paused
	$CanvasLayer/PauseMenu.visible = is_paused
