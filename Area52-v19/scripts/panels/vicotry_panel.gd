extends Node2D

@onready var panel = get_node('/root/Level_'+str(Global.player_level)+'/Panels/VictoryPanel')



# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("victory")
	
	if Global.player_level == 5:
		$NextLevelButton.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_home_button_pressed():
	get_tree().change_scene_to_file("res://scenes/structure/main_menu.tscn")


func _on_replay_button_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/Level_"+str(Global.player_level)+".tscn")


func _on_level_selection_button_pressed():
	get_tree().change_scene_to_file("res://scenes/structure/level_selection.tscn")


func _on_close_button_pressed():
	panel.visible = false


func _on_next_level_button_pressed():
		Global.player_level += 1
		get_tree().change_scene_to_file("res://scenes/levels/Level_"+str(Global.player_level)+".tscn")
