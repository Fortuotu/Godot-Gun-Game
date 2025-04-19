extends Control

func load_level(num):
	var level = load("res://levels/{}.tscn".format(num))
	level.add_child(CanvasLayer)
	get_parent().add_child(level)

func _on_level_1_pressed() -> void:
	load_level(1)


func _on_level_2_pressed() -> void:
	pass # Replace with function body.


func _on_level_3_pressed() -> void:
	pass # Replace with function body.
