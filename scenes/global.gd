extends Node

var _player: Player = null

func register_player(player: Player) -> void:
	_player = player

func deregister_player() -> void:
	_player = null

func get_player() -> Player:
	return _player

var _level: Level

func set_level(level: Level) -> void:
	_level = level

func get_level() -> Level:
	return _level
