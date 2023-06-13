extends Node

func _ready():
	$Label.visible = false

func _process(delta):
	if Input.is_action_pressed("pause"):
		if get_tree().paused == false:
			get_tree().paused = true
			$Label.visible = true
		else:
			get_tree().paused = false
			$Label.visible = false