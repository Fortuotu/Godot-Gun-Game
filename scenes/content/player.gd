class_name Player extends CharacterBody2D

@export var speed = 400
@export var gravity = 980

@onready var gun_dist = global_position.distance_to($Gun.global_position)
var gun_force = 780.0
const GUN_INITIAL_AMMO = 2
static var gun_ammo = GUN_INITIAL_AMMO

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		_shoot()
		get_viewport().set_input_as_handled()

func _physics_process(delta):
	velocity.y += gravity * delta
	
	velocity *= 0.99
	
	_make_gun_rotation()
	move_and_slide()
	
	if (is_on_floor() && gun_ammo != GUN_INITIAL_AMMO):
		gun_ammo = GUN_INITIAL_AMMO

func _make_gun_rotation():
	var angle_vec = (get_global_mouse_position() - global_position).normalized()
	
	$Gun.position = angle_vec * gun_dist
	$Gun.rotation = angle_vec.angle()
	
	if ($Gun.position.x < 0):
		$Gun.scale = Vector2(1.0, -1.0)
	else:
		$Gun.scale = Vector2(1.0, 1.0)

func _shoot():
	if gun_ammo == 0:
		return
	
	var angle_vec = (get_global_mouse_position() - global_position).normalized()
	velocity = -angle_vec * gun_force
	
	gun_ammo -= 1
