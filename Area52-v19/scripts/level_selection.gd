extends Node2D

@export var level1 = preload("res://scenes/levels/level_1.tscn")
@export var level2 = preload("res://scenes/levels/level_2.tscn")
@export var level3 = preload("res://scenes/levels/level_3.tscn")
@export var level4 = preload("res://scenes/levels/level_4.tscn")
@export var level5 = preload("res://scenes/levels/level_5.tscn")

func _ready():
	for i in range(Global.opened_level):
		var button_name = "Control/Level" + str(i+1) + "_btn"  
		var button = get_node(button_name)
		button.disabled = false
	
func _on_level_1_btn_pressed():
	Global.player_level = 1
	print(Global.player_level)
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")

func _on_level_2_btn_pressed():
	Global.player_level = 2
	print(Global.player_level)
	get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")

func _on_level_3_btn_pressed():
	Global.player_level = 3
	print(Global.player_level)
	get_tree().change_scene_to_file("res://scenes/levels/level_3.tscn")

func _on_level_4_btn_pressed():
	Global.player_level = 4
	print(Global.player_level)
	get_tree().change_scene_to_file("res://scenes/levels/level_4.tscn")
	
func _on_level_5_btn_pressed():
	Global.player_level = 5	
	print(Global.player_level)
	get_tree().change_scene_to_file("res://scenes/levels/level_5.tscn")
