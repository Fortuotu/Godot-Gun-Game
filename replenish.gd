extends Area2D

func replenish():
	Player.gun_ammo = Player.GUN_INITIAL_AMMO
	disable_node(self, 5.0)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		replenish()

func disable_node(node: Node, duration: float):
	node.set_process(false)
	node.set_physics_process(false)
	node.visible = false  
	await get_tree().create_timer(duration).timeout
	node.set_process(true)
	node.set_physics_process(true)
	node.visible = true
