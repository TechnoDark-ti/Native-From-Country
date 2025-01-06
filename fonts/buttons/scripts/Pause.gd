extends Control

var scene_path_to_load

func _ready():
	
	$menu.visible = false
	$a.visible = false
	for button in $menu/CenterRow/buttons.get_children():
		button.connect("pressed", Callable(self, "_on_Button_pressed").bind(button.Scene_to_load))

func _on_Button_pressed(Scene_to_load):
	scene_path_to_load = Scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in()
	get_tree().change_scene_to_file(scene_path_to_load)
	
func _process(delta):
	if Input.is_action_pressed("pause"):
		if get_tree().paused == false:
			get_tree().paused = true
			$menu.visible = true
			$a.visible = true
		else:
			get_tree().paused = false
			$menu.visible = false	
			$a.visible = false
#func _on_FadeIn_fade_finished():
	
