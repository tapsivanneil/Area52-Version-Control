extends Area2D


var enemy ={}
@onready var main_scene = get_node('/root/Level_'+str(Global.player_level))
@onready var barrier = get_node('/root/Level_'+str(Global.player_level)+'/Barrier')
@onready var player = get_node('/root/Level_'+str(Global.player_level)+'/Player')

@onready var character = get_node('/root/Level_'+str(Global.player_level)+'/Defender_List/bomber')

var speed 


func _ready():
	#pass
	speed = character.attack_speed
	#print(character.attack_speed)
	
	#pass
	#for i in range(1, 50):
		#if i not in main_scene.deployed_enemy:
			#if get_node("/root/MainScene/Enemy" + str(i)) != null:
				#enemy[i] = get_node("/root/MainScene/Enemy" + str(i))


func _process(delta):
	position += transform.x * speed * delta 

func _on_body_entered(body):
	
	if body == player:
		pass
	
	elif body == barrier:
		queue_free()
	
	if main_scene != null:
			if main_scene.enemy_on_stage != null:
				for i in main_scene.enemy_on_stage:
					#if get_node("/root/MainScene/Enemy" + str(i)) != null:
						var enemy_target = get_node("/root/Level_"+str(Global.player_level)+"/Enemies/Enemy" + str(i))
						if body == enemy_target:
							if(enemy_target.health > 0):
								enemy_target.take_dmg(character.damage, i)
								queue_free()
					#print(enemy_target)
					#print(enemy_target.health)
					#enemy_target.heatlh -= dmg
					#print(enemy_target.heatlh)
				

		

