extends Label

func _process(delta: float) -> void:
	text = "Bullets: " + str(Player.gun_ammo)
