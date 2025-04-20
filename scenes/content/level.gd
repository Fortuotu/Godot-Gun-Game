extends Node2D

var pause_menu_scene = preload("res://scenes/UI/pause_menu.tscn") 

func _ready():
	_load_ui_layer()

func _load_ui_layer():
	var canvas_layer = CanvasLayer.new()
	canvas_layer.add_child(pause_menu_scene.instantiate())
	add_child(canvas_layer)
