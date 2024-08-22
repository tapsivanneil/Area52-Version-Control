extends Node2D

var attacker_instance
var attacker_scene = preload("res://enemy.tscn")

var num_of_spawns = 10

var spawn_timer

func _ready():
	
	$Timer.wait_time = 3.0
	$Timer.start()

func _process(delta):
	pass

func _on_timer_timeout():
	var random_number = randi_range ( 1, 50)
	var move_enemy = get_node("Enemy" + str(random_number))
	
	if num_of_spawns >0:
		deploy_attackers(move_enemy)
		num_of_spawns -= 1
	

func deploy_attackers(enemy):
	enemy.speed = 1



	
