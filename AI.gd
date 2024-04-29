class_name Player
extends Node2D


signal state_changed(new_state)

enum State{
	PATROL,
	ENGAGE
}
# Called when the node enters the scene tree for the first time.
func _ready():
	var player_detection_zone = $PlayerDetectionZone
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match current_state:
		State.PATROL:
			pass
		State.ENGAGE:
			pass
	
	
var current_state: int = State.PATROL: set = set_state
var player: Player = null


func set_state(new_state: int):
	if new_state == current_state:
		return
		
	current_state = new_state
	emit_signal("state_changed", current_state)


