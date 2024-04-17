extends Control

@export var Upgrade_Menu : Tower
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	Upgrade_Menu.connect("interacted", _on_interated)
	Upgrade_Menu.connect("moved_away", _on_moved_away)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_interated(interated):
	if(interated):
		show()
func _on_moved_away(moved_away):
	if(moved_away):
		hide()
