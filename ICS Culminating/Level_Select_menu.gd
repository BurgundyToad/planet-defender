extends CanvasLayer
#var main_menu = preload("res://main_menu.tscn").instantiate()
var level_1 = preload("res://Level1 Scene.tscn").instantiate()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
	hide()
	pass # Replace with function body.


func _on_level_1_button_pressed():
	get_tree().change_scene_to_file("res://Level1 Scene.tscn")
	pass # Replace with function body.
