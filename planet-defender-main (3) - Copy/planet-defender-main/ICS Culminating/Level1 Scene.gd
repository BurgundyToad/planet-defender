extends Node2D
@export var mob_scene: PackedScene
@export var tower : Tower
var amount_mobs = 3
var wave = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	print("level 1 loaded")
	$MobTimer.start()
	$WaveTimer.start()
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _input(event: InputEvent):
	if event.is_action_pressed('upgrade'):
		$CanvasLayer2.visible = !$CanvasLayer2.visible


func _on_mob_timer_timeout():
	if amount_mobs > 0: 
		$wave.hide()
		var mob = mob_scene.instantiate()
		var mob_spawn_location = $MobPath/MobSpawnLocation
		mob_spawn_location.progress_ratio = randf()
		var direction = mob_spawn_location.rotation + PI/2
		
		mob.position = mob_spawn_location.position
		direction += randf_range(-PI/4, PI/4)
		mob.rotation = direction
		
		add_child(mob)
		amount_mobs -= 1
		
	pass # Replace with function body.


func _on_wave_timer_timeout():
	$wave.show()
	await get_tree().create_timer(2.0).timeout
	
	if wave > 0:
		amount_mobs = 3
	wave -= 1
	pass # Replace with function body.
