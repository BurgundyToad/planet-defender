extends CharacterBody2D
@export var bullet : PackedScene
@export var health = 5
signal hit
func _physics_process(_delta : float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()
	if Input.is_action_pressed("move"):
		var vel : Vector2 = (get_global_mouse_position()- global_position).normalized()*1000
		velocity = vel
		$"Aiming Direction/Animations".play("flying")
		move_and_slide()
func die():
	pass
	#$"Aiming Direction/Animations".play("die")
	#$game_over_timer.start()
func damage():
	emit_signal("hit", hit)
func shoot():
	var b = bullet.instantiate()
	b.speed += sqrt(abs(velocity.x)+abs(velocity.y))*50
	get_parent().add_child(b)
	b.transform = $"Aiming Direction/Animations/Muzzle".global_transform


func _on_game_over_timer_timeout():
	hide()
