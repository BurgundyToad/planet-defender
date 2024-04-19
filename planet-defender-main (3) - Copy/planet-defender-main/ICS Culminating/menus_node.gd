extends Node2D

func _process(_delta):
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	$BackGround/Main_Menu.show()


func _on_start_pressed():
	$"BackGround/Level Select".show()
	$BackGround/Main_Menu.hide()


func _on_back_pressed():
	$"BackGround/Level Select".hide()
	$BackGround/Main_Menu.show()


func _on_level_1_pressed():
	$"BackGround".hide()
	get_parent().get_node("Level 1").show()


func _on_level_2_pressed():
	$'BackGround'.hide()
	get_parent().get_node("Level 2").show()


func _on_pause_menu_level_left(Level_left):
	$"BackGround".show()


func _on_pause_menu_restarted():
	get_parent().get_node("Level 1").show()
