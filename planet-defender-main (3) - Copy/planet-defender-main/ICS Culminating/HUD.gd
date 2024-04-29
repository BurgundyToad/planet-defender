extends Control

signal game_over
# Called when the node enters the scene tree for the first time.
func _ready():
	$"Health Bar".show_percentage=false
	$"Health Bar".fill_mode=(0)
	$"Shield Bar".show_percentage=false
	$"Health Bar".value=100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_mouse_moved_player_hit(_hit):
	if $"Shield Bar".value>0:
		$"Shield Bar".value-=5
	else:
		$"Health Bar".value-=5
	if $'Health Bar'.value == 0:
		emit_signal('game_over',game_over)


func _on_player_upgrade_menu_shield(_shield):
	$"Shield Bar".value=100
