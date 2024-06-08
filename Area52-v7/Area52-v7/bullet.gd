extends Area2D

var speed = 200		#bullet speed
var dmg = 10 		#dmg = damage
var enemy ={}
var distance_traveled = 0
var max_distance = 800 
@onready var main_scene = get_node('/root/MainScene')
@onready var barrier = get_node('/root/MainScene/Barrier')
@onready var player = get_node('/root/MainScene/Player')


func _ready():
	
	for i in range(1, 50):
		if i not in main_scene.deployed_enemy:
			if get_node("/root/MainScene/Enemy" + str(i)) != null:
				enemy[i] = get_node("/root/MainScene/Enemy" + str(i))


func _process(delta):
	position += transform.x * speed * delta 

func _on_body_entered(body):
	
	if body == player:
		pass
	
	elif body == barrier:
		queue_free()
	
	#if main_scene.enemy_on_stage != null:
	for i in main_scene.enemy_on_stage:
		if get_node("/root/MainScene/Enemy" + str(i)) != null:
			var enemy_target = get_node("/root/MainScene/Enemy" + str(i))
			if body == enemy_target:
				queue_free()

			if body.has_method("take_dmg"):
				if body.health > 0:
					body.take_dmg(dmg, body)
				else:
					var enemy_name = str(body.get_name())

					if body.deployed_enemy_tag in main_scene.enemy_on_stage:
						print('enemy' + str(body.deployed_enemy_tag) + ' removed')
						main_scene.enemy_on_stage.erase(body.deployed_enemy_tag)
						#print(main_scene.enemy_on_stage)
		

