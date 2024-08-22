extends Node2D

@export var level1 = preload("res://scenes/levels/level_1.tscn")
@export var level2 = preload("res://scenes/levels/level_2.tscn")
@export var level3 = preload("res://scenes/levels/level_3.tscn")
@export var level4 = preload("res://scenes/levels/level_4.tscn")
@export var level5 = preload("res://scenes/levels/level_5.tscn")

func _ready():
	pass

func _on_level_1_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")

func _on_level_2_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")

func _on_level_3_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_3.tscn")

func _on_level_4_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_4.tscn")
	
func _on_level_5_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_5.tscn")
