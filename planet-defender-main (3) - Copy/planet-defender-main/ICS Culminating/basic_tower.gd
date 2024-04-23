extends Area2D
class_name Tower
signal interacted
var interaction_range = false
@export var Basic_Tower : UpgradeMenu
@export var shooter_turret : PackedScene
signal moved_away
var tower_exists = false
func _ready():
	$Interact_Sign.hide()
	$Label.hide()
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		if interaction_range:
			emit_signal("interacted", interacted)
func _on_interaction_range_body_entered(body):
	if body.is_in_group("player"): 
		$Interact_Sign.show()
		$Label.show()
		interaction_range = true
func _on_interaction_range_body_exited(body):
	if body.is_in_group("player"): 
		$Interact_Sign.hide()
		$Label.hide()
		interaction_range = false
		emit_signal("moved_away", moved_away)
func on_shooter_1_pressed():
	if not tower_exists:
		tower_exists = true
		var st = shooter_turret.instantiate()
		owner.add_child(st)
		st.transform = $AnimatedSprite2D/turret_location.global_transform
