extends VBoxContainer

@export var sceneToLoad: PackedScene

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass



func _on_play_button_pressed():
	get_tree().change_scene_to_packed(sceneToLoad)


func _on_quit_button_pressed():
	get_tree().quit()
