extends Area2D

const REPLENISH_COUNTDOWN = 5.0 

func replenish():
	Player.gun_ammo = Player.GUN_INITIAL_AMMO
	
	disable_node(self)
	$Timer.start(REPLENISH_COUNTDOWN)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		replenish()

func disable_node(node: Node):
	node.set_process(false)
	node.set_physics_process(false)
	node.visible = false  

func enable_node(node: Node):
	node.set_process(true)
	node.set_physics_process(true)
	node.visible = true

func _on_timer_timeout() -> void:
	enable_node(self)
