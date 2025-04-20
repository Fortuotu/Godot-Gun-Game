extends Node2D

@export var player_spawn: Node2D
var player: Player = null

var pause_menu_scene = preload("res://scenes/UI/pause_menu.tscn") 
var bullets_label_scene = preload("res://scenes/UI/bullet_overlay.tscn")

func _ready():
	_load_ui_layer()

func _load_ui_layer():
	var canvas_layer = CanvasLayer.new()
	canvas_layer.add_child(bullets_label_scene.instantiate())
	canvas_layer.add_child(pause_menu_scene.instantiate())
	add_child(canvas_layer)

func _respawn_player():
	if player != null:
		get_parent().remove_child(player)
	
	var player = Player.create(player_spawn.global_position)
	
