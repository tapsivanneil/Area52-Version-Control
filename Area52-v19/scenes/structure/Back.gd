extends Button

@export var target_scene: String = "res://scenes/structure/main_menu.tscn"

func _ready() -> void:
	connect("pressed",Callable(self,"_on_pressed"))

func _on_pressed() -> void:
	get_tree().change_scene_to_file(target_scene)
