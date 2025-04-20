extends Node2D

var pause_menu_scene = preload("res://scenes/UI/pause_menu.tscn") 
var bullets_label_scene = preload("res://scenes/UI/bullet_overlay.tscn")

func _ready():
	_load_ui_layer()

func _load_ui_layer():
	var canvas_layer = CanvasLayer.new()
	canvas_layer.add_child(bullets_label_scene.instantiate())
	canvas_layer.add_child(pause_menu_scene.instantiate())
	add_child(canvas_layer)
