extends Node2D

var attacker_instance
var attacker_scene = preload("res://enemy.tscn")
var num_of_spawns = 10
var spawn_timer

var enemy = {}
var tile = {}

var deployed_enemy = []
var enemy_on_stage = []
var random_number 

func _ready():
	
	for i in range(1, 50):
		enemy[i] = get_node("/root/MainScene/Enemy" + str(i))
	
	for i in range(1, 45):
		tile[i] = get_node("/root/MainScene/Tile" + str(i))
	
	
	$Character_attack_timer.wait_time = 1
	$Character_attack_timer.start()
	
	$Timer.wait_time = 3.0
	$Timer.start()

#func _process(delta):
	#pass

func _on_timer_timeout():

	if num_of_spawns >0:
		random_number = randi_range ( 1, 50)
	
		while random_number in deployed_enemy:
			random_number = randi_range ( 1, 50)
			
		
		var move_enemy = get_node("Enemy" + str(random_number))
		
		deployed_enemy.append(random_number)
		enemy_on_stage.append(random_number)
		
		deploy_attackers(move_enemy)
		
		move_enemy.deployed_enemy_tag = random_number
		num_of_spawns -= 1
		print(enemy_on_stage)
		

func deploy_attackers(enemy):
	enemy.speed = 0.2
	

func _on_character_attack_timer_timeout():
	
	for j in range(1, 45):
		tile[j].stop_attack()
	
	if enemy_on_stage != null:
		for enemy in enemy_on_stage:
			if(enemy > 0 && enemy < 11):
				for i in range(1, 10):
					for j in range(1, 45, 5):
						#pass
						tile[j].attack()
						#print('Tile Attacking: ' + str(tile[j].name))
			elif(enemy > 10 && enemy < 21):
				for i in range(11, 20):
					for j in range(2, 45, 5):
						#pass
						tile[j].attack()
						#print('Tile Attacking: ' + str(tile[j].name))
			elif(enemy > 20 && enemy < 31):
				for i in range(21, 30):
					for j in range(3, 45, 5):
						#pass
						tile[j].attack()
						#print('Tile Attacking: ' + str(tile[j].name))
			elif(enemy > 30 && enemy < 41):
				for i in range(31, 40):
					for j in range(4, 45, 5):
						#pass
						tile[j].attack()
						#print('Tile Attacking: ' + str(tile[j].name))
			elif(enemy > 40 && enemy < 51):
				for i in range(41, 50):
					for j in range(5, 45, 5):
						#pass
						tile[j].attack()
						#print('Tile Attacking: ' + str(tile[j].name))
