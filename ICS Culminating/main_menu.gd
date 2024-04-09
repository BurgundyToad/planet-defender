extends CanvasLayer
#var level_1 = preload("res://Level1 Scene.tscn").instantiate()

func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	pass
func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Level_Select_menu.tscn")
	hide()
	pass # Replace with function body.
