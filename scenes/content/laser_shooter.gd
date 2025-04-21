class_name LaserShooter extends StaticBody2D

var laser_active: bool = false

@export var LASER_INTERVAL = 0.5
@export var LASER_DURATION = 1.0

func _configure_laser():
	$Laser.target_position *= 1000

func _ready() -> void:
	_configure_laser()
	
	$Timer.start(LASER_INTERVAL)

func _on_timer_timeout() -> void:
	if laser_active:
		$Laser.stop_ray()
		$Timer.start(LASER_INTERVAL)
	else:
		$Laser.start_ray()
		$Timer.start(LASER_DURATION)
	
	laser_active = !laser_active
