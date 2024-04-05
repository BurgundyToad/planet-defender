extends RigidBody2D
@export var Bullet : PackedScene
var health:int = 100
signal mob_fire_bullet(bullet) 
# Called when the node enters the scene tree for the first time.
func _ready():
	var end_of_gun = $AnimatedSprite2D/Muzzle
	var ai = $AI
	 
	$AnimatedSprite2D.play()
	pass

func handle_hit():
	health -= 20
	print("enemy hit!", health)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _unhandled_input(event):	
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot(): 
	var b = Bullet.instantiate()
	add_child(b)
	b.global_transform = $AnimatedSprite2D/Muzzle.global_transform
	var target = get_global_mouse_position()
	var direction_to_mouse = b.global_position.direction_to(target).normalized()
	b.set_direction(direction_to_mouse)
	emit_signal("mob_fire_bullet", b)
	
