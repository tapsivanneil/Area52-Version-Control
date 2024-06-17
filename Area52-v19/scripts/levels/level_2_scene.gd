extends Node2D

var attacker_instance
var num_of_spawns = 20
var default_num_of_spawns = 20
var spawn_timer

var enemy = {}
var tile = {}

var deployed_enemy = []
var enemy_on_stage = []
var random_number 

var timer_label = Label
var time = Timer

var selection = preload("res://Character_selection.tscn")
var selection_instance

var total_kills = 0;

@onready var player = get_node("/root/Level_"+str(Global.player_level)+"/Player")

func _ready():

	timer_label = $Hotbar_Timer/Label
	time = $Hotbar_Timer

	var current_level = Global.player_level
	$UI/Hotbar.visible = false
	# Instance the selection scene
	selection_instance = selection.instantiate()
	add_child(selection_instance)

	# Connect the signal from the selection scene
	selection_instance.connect("selection_done", Callable(self, "_on_selection_done"))


	for i in range(1, 50):
		enemy[i] = get_node("/root/Level_"+str(current_level)+"/Enemies/Enemy" + str(i))
	
	for i in range(1, 45):
		tile[i] = get_node("/root/Level_"+str(current_level)+"/Tiles/Tile" + str(i))
	
	
	$Character_attack_timer.wait_time = 1
	$Character_attack_timer.start()
	
	$Timer.wait_time = 3.0

func _process(delta):
	update_timer_label_text()
	
func _on_selection_done():
	# Remove the selection scene
	selection_instance.queue_free() 
	$UI/Hotbar.load_hotbar_from_passive_slots()
	$UI/Hotbar.visible = true
	
	print("loaded")

func _on_timer_timeout():

	if num_of_spawns >0:
		random_number = randi_range ( 1, 50)
	
		while random_number in deployed_enemy:
			random_number = randi_range ( 1, 50)
			

		var move_enemy = get_node("Enemies/Enemy" + str(random_number))
		
		deployed_enemy.append(random_number)
		enemy_on_stage.append(random_number)
		
		deploy_attackers(move_enemy)
		
		move_enemy.deployed_enemy_tag = random_number
		num_of_spawns -= 1
		#print(enemy_on_stage)
		

func deploy_attackers(move_enemy):
	move_enemy.speed = move_enemy.moving_speed
	

func _on_character_attack_timer_timeout():
	
	for j in range(1, 45):
		tile[j].stop_attack()
	
	if enemy_on_stage != null:
		for enemy_check in enemy_on_stage:
			if(enemy_check > 0 && enemy_check < 11):
				for j in range(1, 45, 5):
					#pass
					tile[j].attack()
					#print('Tile Attacking: ' + str(tile[j].name))
			elif(enemy_check > 10 && enemy_check < 21):
				for j in range(2, 45, 5):
					#pass
					tile[j].attack()
					#print('Tile Attacking: ' + str(tile[j].name))
			elif(enemy_check > 20 && enemy_check < 31):
				for j in range(3, 45, 5):
					#pass
					tile[j].attack()
					#print('Tile Attacking: ' + str(tile[j].name))
			elif(enemy_check > 30 && enemy_check < 41):
				for j in range(4, 45, 5):
					#pass
					tile[j].attack()
					#print('Tile Attacking: ' + str(tile[j].name))
			elif(enemy_check > 40 && enemy_check < 51):
				for j in range(5, 45, 5):
					#pass
					tile[j].attack()
					#print('Tile Attacking: ' + str(tile[j].name))


func _on_hotbar_timer_timeout():
	player.can_deploy = true
	time.stop()


func update_timer_label_text():
	if time.time_left > 0:
		timer_label.text = str(ceil(time.time_left))
	else:
		timer_label.text = 'Ready'
	
func _on_pause_button_pressed():
	$Panels/PausePanel.visible = true

	time.paused = true
	$Character_attack_timer.stop()
	$UI/Hotbar.visible = false
	$PauseButton.visible = false
	
	for j in range(1, 45):
		tile[j].stop_attack()

	for enemy_check in enemy_on_stage:
		var stop_enemy = get_node("Enemies/Enemy" + str(enemy_check))
		stop_enemy.speed = 0
