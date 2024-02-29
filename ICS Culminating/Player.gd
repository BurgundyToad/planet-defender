extends Area2D
signal hit
@export var speed = 800
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed = 800
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("Space"):
		speed = 1600
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.play()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "side"
		$AnimatedSprite2D.flip_v = false
		
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = 'up'
		$AnimatedSprite2D.flip_h = false
		
		$AnimatedSprite2D.flip_v = velocity.y > 0

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
