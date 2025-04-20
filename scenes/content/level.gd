class_name Level extends Node

@export var player_spawn: Node2D
var player: Player = null

var pause_menu_scene = preload("res://scenes/UI/pause_menu.tscn") 
var bullets_label_scene = preload("res://scenes/UI/bullet_overlay.tscn")

func _enter_tree() -> void:
	Global.set_level(self)

func _ready():
	player = Player.create(player_spawn.global_position)
	add_child(player)
	
	_load_ui_layer()

func _load_ui_layer():
	var canvas_layer = CanvasLayer.new()
	canvas_layer.add_child(bullets_label_scene.instantiate())
	canvas_layer.add_child(pause_menu_scene.instantiate())
	add_child(canvas_layer)

func respawn_player():
	player.global_position = player_spawn.global_position
	player.gun_ammo = Player.GUN_INITIAL_AMMO
	player.velocity = Vector2(0, 0)
