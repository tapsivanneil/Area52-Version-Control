extends Node2D

@export var level1: PackedScene
@export var level2: PackedScene
@export var level3: PackedScene
@export var level4: PackedScene
@export var level5: PackedScene

func _ready():
	pass

func _on_level_1_btn_pressed():
	get_tree().change_scene_to_packed(level1)

func _on_level_2_btn_pressed():
	get_tree().change_scene_to_packed(level2)

func _on_level_3_btn_pressed():
	get_tree().change_scene_to_packed(level3)

func _on_level_4_btn_pressed():
	get_tree().change_scene_to_packed(level4)
	
func _on_level_5_btn_pressed():
	get_tree().change_scene_to_packed(level5)
