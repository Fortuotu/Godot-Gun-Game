class_name Laser extends RayCast2D

@onready var activated_ray_size: float = $Line2D.width

func _manage_cast_particle_effects():
	$CollisionParticles.global_position = global_position
	$CastParticles.global_rotation = global_rotation

func _manage_collision_particle_effects():
	if (!is_colliding()):
		$CollisionParticles.emitting = false
		return
	else:
		$CollisionParticles.emitting = true
	
	var normal = get_collision_normal()
	
	$CollisionParticles.global_position = get_collision_point()
	$CollisionParticles.global_rotation = normal.angle()

func _manage_beam_particle_effects():
	$BeamParticles.position = target_position * 0.5
	$BeamParticles.emission_rect_extents.y = target_position.length() * 0.5

func _check_player_collision():
	if is_colliding():
		var body = get_collider()
		if body.is_in_group("player"):
			Global.get_level().respawn_player()

func _ready() -> void:
	stop_ray()

func _physics_process(delta: float) -> void:
	var hit_position = get_collision_point() if is_colliding() else Vector2.ZERO
	
	_manage_cast_particle_effects()
	_manage_collision_particle_effects()
	_manage_beam_particle_effects()
	
	_check_player_collision()
	
	$Line2D.points[1] = to_local(hit_position)

func start_ray():
	create_tween().tween_property($Line2D, "width", activated_ray_size, 0.1)
	set_physics_process(true)
	
	$CastParticles.emitting = true
	$BeamParticles.emitting = true

func stop_ray():
	create_tween().tween_property($Line2D, "width", 0.0, 0.1)
	set_physics_process(false)
	
	$CastParticles.emitting = false
	$CollisionParticles.emitting = false
	$BeamParticles.emitting = false
