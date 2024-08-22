extends Area2D

var enemy = {}
var health = 100
var tile_holder
var attacking
var bullet_scene = PackedScene
var attack_speed = 1


var path

func _ready():
	
	path = preload("res://path.tscn")
	
	for i in range(1, 50):
		enemy[i] = get_node("/root/MainScene/Enemy" + str(i))
		
	$Timer.wait_time = attack_speed

func _process(delta):
	pass
	

func _on_body_entered(body):
	
	for i in range(1, 50):
		if body == enemy[i]:
			attacking = enemy[i]
			#print(attacking)
			#enemy[i].speed = 0
			
			tile_holder = get_parent()
		
			if tile_holder:
				#print("Tile holder exists:", tile_holder.get_name())
				for child in tile_holder.get_children():
					if child.get_name() == "Character":
						
						# nagrereference ng kung sino inaatake ng enemy
						enemy[i].attacking = child
						enemy[i].attack()
						#print("target: ", enemy[i].attacking)
						#print("Character found:", child.get_name())
						while attacking.health > 0:
							attacking.attack()
							
							#tentative attacking damage to prevent infinite loop
							#attacking.health -= 10
							#print("EnemyH: ", attacking.health)
							#print("MyH: ", enemy[i].attacking.health)
							
							#kapag napatay ng enemy yung character dapat matatanggal yung character
							#if (enemy[i].attacking.health == 0):
								#print("character died" )
								#for child_to_rem in attacking.get_children():
									#if child_to_rem.get_name() == "Character":
										#call_deferred("remove_character", child_to_rem)
										#print('dead')
									#enemy[i].speed = 1						
			else:
				print("Tile holder is null!")
		
		
func remove_character(character):
	var tile_holder = get_parent()
	if tile_holder:
		tile_holder.remove_child(character)
		print("Character removed")
		
func die():
	queue_free()

func attack():
	$Timer.start()
	call_deferred("_do_attack")

func _do_attack():
	var bullet_scene = preload("res://Bullet.tscn")
	var bullet_instance = bullet_scene.instantiate()
	get_tree().root.add_child(bullet_instance)
	bullet_instance.transform = $Shooting_area.global_transform
	#print("attacking")
	
func _on_timer_timeout():
	attack()
	
