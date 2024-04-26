extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Health Bar".show_percentage=false
	$"Health Bar".fill_mode=(0)
	$"Shield Bar".show_percentage=false
	$"Health Bar".value=100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_mouse_moved_player_hit(hit):
	$"Health Bar".value-=5
