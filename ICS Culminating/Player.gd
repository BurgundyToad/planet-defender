extends Area2D
signal hit
@export var speed = 25
var screen_size
var velocity = Vector2.ZERO
var current_speed = 0
var boosting = false
var norm_velocity = velocity
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Boosting code. It works but doesn't do too much rn
	#if Input.is_action_pressed("Space"):
		#speed = 50
		#boosting = true
	#elif boosting:
		#speed = 25
		#boosting = false
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
		pass
	elif Input.is_action_pressed("ui_right"):
		velocity.x += speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	else:
		if velocity.x > 0:
			velocity.x = max(velocity.x-15,0)
		elif velocity.x < 0:
			velocity.x = min(velocity.x+15,0)
	if velocity.x > (1000):
		velocity.x = 1000
	if velocity.x < (-1000):
		velocity.x = -1000
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		pass
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= speed
	elif Input.is_action_pressed("ui_down"):
		velocity.y += speed
	else:
		if velocity.y > 0:
			velocity.y = max(velocity.y-15,0)
		if velocity.y < 0:
			velocity.y = min(velocity.y+15,0)
	if velocity.y > (1000):
		velocity.y = 1000
	if velocity.y < (-1000):
		velocity.y = -1000
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
