class_name LaserShooter extends StaticBody2D

var lasers_active: bool = false

@export var laser_interval: float = 3.0
@export var laser_duration: float = 1.0

@export var north_laser: bool = false
@export var south_laser: bool = false
@export var east_laser: bool = false
@export var west_laser: bool = false

@export var rotation_speed = 0.0
@onready var rotation_speed_rads = deg_to_rad(rotation_speed)

@onready var is_enabled: Array[bool] = [north_laser, south_laser, east_laser, west_laser]

func _configure_laser(laser: Laser):
	laser.target_position *= 1000

func _update_laser_state(laser: Laser):
	if lasers_active:
		laser.start_ray()
	else:
		laser.stop_ray()

func _ready() -> void:
	_do_on_enabled_lasers(_configure_laser)
	
	$Timer.start(laser_interval)

func _physics_process(delta: float) -> void:
	rotate(rotation_speed_rads * delta)

func _on_timer_timeout() -> void:
	if lasers_active:
		$Timer.start(laser_interval)
	else:
		$Timer.start(laser_duration)
	
	lasers_active = !lasers_active
	
	_do_on_enabled_lasers(_update_laser_state)

func _do_on_enabled_lasers(callback: Callable):
	var lasers = $Lasers.get_children()
	
	for i in range(len(lasers)):
		if !is_enabled[i]:
			continue
		
		callback.call(lasers[i])
