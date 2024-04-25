extends Control
class_name Upgrades
signal speedd
signal boost
signal shield
signal Bullet_Speed
signal Auto_Bullet
signal Cash
# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/Boost_Upgrade.hide()
	$Panel/Shield_Upgrade.hide()
	$Panel/Bullet_Speed_Upgrade.hide()
	$Panel/Button.hide()
	$Panel/Button2.hide()
	$Panel/Button3.hide()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
		#$Player_Upgrade_Menu.get_parent().hide()


func _on_speed_upgrade_pressed():
	$Panel/Boost_Upgrade.show()
	$Panel/Ship_Upgrade_Tree_Line.add_point(Vector2(-100,40), 1)
	emit_signal('speedd',speedd)
	


func _on_boost_upgrade_pressed():
	$Panel/Shield_Upgrade.show()
	$Panel/Ship_Upgrade_Tree_Line.add_point(Vector2(-15,-5),2)
	emit_signal('boost',boost)

func _on_shield_upgrade_pressed():
	$Panel/Ship_Upgrade_Tree_Line.add_point(Vector2(-100,-15),3)
	emit_signal('shield',shield)

func _on_automatic_upgrade_pressed():
	$Panel/Bullet_Speed_Upgrade.show()
	$Panel/Weaponry_Upgrade_Tree_Line.add_point(Vector2(430,-450),1)
	emit_signal('Auto_Bullet',Auto_Bullet)


func _on_bullet_speed_upgrade_pressed():
	$Panel/Button.show()
	$Panel/Weaponry_Upgrade_Tree_Line.add_point(Vector2(50,-730),2)
	emit_signal('Bullet_Speed',Bullet_Speed)

func _on_button_pressed():
	$Panel/Weaponry_Upgrade_Tree_Line.add_point(Vector2(460,-900),3)
	


func _on_double_cash_upgrade_pressed():
	$Panel/Button2.show()
	$Panel/Misc_Upgrade_Tree_Line.add_point(Vector2(1600,-450),1)
	

func _on_button_2_pressed():
	$Panel/Button3.show()
	$Panel/Misc_Upgrade_Tree_Line.add_point(Vector2(1250,-730),2)
	

func _on_button_3_pressed():
	$Panel/Misc_Upgrade_Tree_Line.add_point(Vector2(1600,-830),3)


