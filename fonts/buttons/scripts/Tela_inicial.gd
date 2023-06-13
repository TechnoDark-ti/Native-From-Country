extends Control

var scene_path_to_load

func _ready():
	$menu/CenterRow/buttons/jogar.grab_focus()
	for button in $menu/CenterRow/buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.Scene_to_load])

func _on_Button_pressed(Scene_to_load):
	scene_path_to_load = Scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in()
	
func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)
