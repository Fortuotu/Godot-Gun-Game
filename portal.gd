extends Area2D

@onready var anim_player = $AnimationPlayer

func _ready() -> void:
	anim_player.play("portal")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_position($Destination.global_position)
