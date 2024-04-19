extends Area2D

class_name Tower
signal interacted
var interaction_range = false
@export var Basic_Tower : UpgradeMenu
signal moved_away
var horrific_solution = 0
func _ready():
	$Interact_Sign.hide()
	$Label.hide()
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		if interaction_range:
			emit_signal("interacted", interacted)
func _on_interaction_range_area_entered(area):
	if area.is_in_group("player"): 
		$Interact_Sign.show()
		$Label.show()
		interaction_range = true
func _on_interaction_range_area_exited(area):
	if area.is_in_group("player"): 
		$Interact_Sign.hide()
		$Label.hide()
		interaction_range = false
		emit_signal("moved_away", moved_away)
func on_shooter_1_pressed(shooter_1_pressed):
	if horrific_solution == 0:
		horrific_solution+=1
	else:
		print("test wotked")
