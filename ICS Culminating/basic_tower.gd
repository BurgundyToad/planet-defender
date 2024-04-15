extends Area2D

class_name Tower
signal in_tower_interaction_range(interaction_range : bool)
var interaction_range = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Interact_Sign.hide()
	$Label.hide()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		if interaction_range:
			print("INTERACTED")


func _on_interaction_range_area_entered(area):
	if area.is_in_group("player"): 
		$Interact_Sign.show()
		$Label.show()
		print("Range Entered")
		interaction_range = true

func _on_interaction_range_area_exited(area):
	if area.is_in_group("player"): 
		$Interact_Sign.hide()
		$Label.hide()
		print("Range Exited")
		interaction_range = false
