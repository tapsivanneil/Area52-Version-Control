extends Node2D

@onready var panel = get_node('/root/Level_'+str(Global.player_level)+'/Panels/PausePanel')
@onready var current_scene = get_node('/root/Level_'+str(Global.player_level))

@onready var reload_timer = get_node('/root/Level_'+str(Global.player_level)+'/Hotbar_Timer')
@onready var character_attack_timer = get_node('/root/Level_'+str(Global.player_level)+'/Character_attack_timer')

@onready var hot_bar = get_node('/root/Level_'+str(Global.player_level)+'/UI/Hotbar')
@onready var pause_button = get_node('/root/Level_'+str(Global.player_level)+'/PauseButton')




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_home_button_pressed():
	get_tree().change_scene_to_file("res://scenes/structure/main_menu.tscn")


func _on_replay_button_pressed():
	DefenderList.passive_slot_data = []  
	DefenderList.passive_slot_texture = []
	get_tree().change_scene_to_file("res://scenes/levels/Level_"+str(Global.player_level)+".tscn")
	
func _on_level_selection_button_pressed():
	get_tree().change_scene_to_file("res://scenes/structure/level_selection.tscn")


func _on_close_button_pressed():
	panel.visible = false
	reload_timer.paused = false
	character_attack_timer.start()
	
	pause_button.visible = true
	hot_bar.visible = true
	
	for enemy_check in current_scene.enemy_on_stage:
		var stop_enemy = get_node("/root/Level_"+str(Global.player_level)+"/Enemies/Enemy" + str(enemy_check))
		stop_enemy.speed = stop_enemy.moving_speed

	
	
	
	
	
