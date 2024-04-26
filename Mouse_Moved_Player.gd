extends CharacterBody2D
@export var bullet : PackedScene
@export var health = 5

func _physics_process(delta : float) -> void:
	if Input.is_action_just_pressed("Space"):
		shoot()
	if Input.is_action_pressed("move"):
		var vel : Vector2 = (get_global_mouse_position()- global_position).normalized()*1000
		velocity = vel
		$"Aiming Direction/Animations".play("flying")
		move_and_slide()
func die():
	$"Aiming Direction/Animations".play("die")
	$game_over_timer.start()
func hit():
	health -= 1
	if health == 0:
		die()
	$TextEdit.set_text(str(health))
func shoot():
	if owner != null:
		var b = bullet.instantiate()
		b.speed += sqrt(abs(velocity.x)+abs(velocity.y))*50
		owner.add_child(b)
		b.transform = $"Aiming Direction/Animations/Muzzle".global_transform


func _on_game_over_timer_timeout():
	hide()
