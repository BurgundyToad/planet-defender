extends RigidBody2D
@export var Bullet : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	var end_of_gun = $Muzzle
	var ai = $AI
	$AnimatedSprite2D.play()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _unhandled_input(event):	
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot(): 
	var b = Bullet.instantiate()
	add_child(b)
	b.transform = $AnimatedSprite2D/Muzzle.global_transform
	var target = get_global_mouse_position()
	var direction_to_mouse = b.global_position.direction_to(target).normalized()
	b.set_direction(direction_to_mouse)
	
