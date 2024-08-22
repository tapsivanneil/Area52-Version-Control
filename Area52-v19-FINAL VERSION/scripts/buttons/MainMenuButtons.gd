extends HBoxContainer

var play_button_scene = preload("res://scenes/structure/level_selection.tscn")
var option_scene = preload("res://scenes/structure/option.tscn")

func _ready():
	$"../Sprite2D/AnimatedSprite2D".play("animation")
	pass # Replace with function body.

#func _process(delta):
	#pass



func _on_play_button_pressed():
	if Global.viewed_tutorial == false:
		Global.viewed_tutorial = true
		get_tree().change_scene_to_file("res://scenes/structure/backstory.tscn")
	else:
		get_tree().change_scene_to_packed(play_button_scene)


func _on_quit_button_pressed():
	get_tree().quit()
	
func _on_options_button_pressed():
	get_tree().change_scene_to_packed(option_scene)
