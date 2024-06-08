extends VBoxContainer

var play_button_scene = preload("res://scenes/structure/level_selection.tscn")


func _ready():
	pass # Replace with function body.

func _process(delta):
	pass



func _on_play_button_pressed():
	get_tree().change_scene_to_packed(play_button_scene)


func _on_quit_button_pressed():
	get_tree().quit()
