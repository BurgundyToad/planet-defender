extends Area2D

class_name Tower
signal interacted
var interaction_range = false
signal moved_away
		
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
