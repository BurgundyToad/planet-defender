extends Control
var level_1 = preload("res://Level1 Scene.tscn").instantiate()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	pass
func _on_start_button_pressed():
	print("button clicked succesfully")
	get_tree().change_scene_to_file("res://Level1 Scene.tscn")
	hide()
	pass # Replace with function body.
