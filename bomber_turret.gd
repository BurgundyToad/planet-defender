extends Area2D
# Called when the node enters the scene tree for the first time.
@export var Bomb : PackedScene
var target
var found_mob = false
var cc
var mob_pos = Vector2.ZERO
var level = 1
var bscale = 1
var tspeed = 5
var btower 
func _ready():

	print(is_inside_tree())
	$shoot_timer.start()
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func aim():
	cc = get_parent().get_child_count()
	found_mob = false
	mob_pos = Vector2.ZERO
	for i in range(0,cc):
		target = get_parent().get_child(i)
		if target.is_in_group("mobs") and found_mob == false:
			found_mob = true
			mob_pos = self.position-target.position
	look_at(mob_pos)
func shoot():
	print('yeah')
	var b = Bomb.instantiate()
	get_parent().add_child(b)
	b.transform = $sprite/turret_muzzle.global_transform
	b.rotation = atan2(-mob_pos.y,-mob_pos.x)
	b.scale = Vector2(bscale,bscale)
func upgrade():
	btower = get_parent().get_child(1)
	if btower.tower == "bomber_1":
		level = 1
	if btower.tower == "bomber_2":
		level = 2
		bscale = 1.1
		tspeed = 4
	if btower.tower == "bomber_3":
		level = 3
		bscale = 1.2
		tspeed = 3
	$shoot_timer.wait_time = tspeed
func _on_shoot_timer_timeout():
	pass
	aim()
	upgrade()
	if found_mob == true:
		shoot()
