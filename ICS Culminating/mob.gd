extends RigidBody2D
@export var Bullet : PackedScene
@export var speed = 250
var player_position
var target_position

@onready var player = get_parent().get_node("Player")
signal mob_fire_bullet(bullet) 

func _ready():
	$AnimatedSprite2D.play()

func _physics_process(_delta):
	player_position = player.position
	target_position = (player_position - position).normalized()
		
	if position.distance_to(player_position) > 3:

		linear_velocity = target_position * speed
		gravity_scale = 0
		look_at(player_position)
	else:
		
		linear_velocity = Vector2.ZERO
		look_at(player_position)
		gravity_scale = 0


			


func shoot(): 
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $AnimatedSprite2D/Muzzle.global_transform
	var direction = (player_position - position).normalized()
	var direction_to_mouse = direction
	b.set_direction(direction_to_mouse)
	emit_signal("mob_fire_bullet", b)

func _unhandled_input(event):
	if Input.is_action_just_pressed("shoot"):
		shoot()
