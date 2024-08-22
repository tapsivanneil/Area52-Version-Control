extends Node2D

var speed = 0
var player
var dps = 10
var health = 100
var attack_speed = 1
var attacking


func _ready():
	player = get_node("/root/MainScene/Player")
	$Timer.wait_time = attack_speed
	
func _process(delta):
	position.x -= speed


func attack():
	$Timer.start()

func _on_area_2d_body_exited(body):
	pass
	
func _on_timer_timeout():
	speed = 0
	if attacking != null: 
		attacking.health -= dps
		if attacking.health <= 0:
			$Timer.stop()
			
			var child = attacking
			if child.get_name() == "Character":
				#call_deferred("remove_character", attacking)
				print('dead')
				child.die()
				attacking = null
				speed = 1
				
					
			##err: not recognizing the character because get_children means getting the children of character since 'attacking == character'
			#for child in attacking.get_children():
				#print("for loop entered after dead")
				#
				#if child.get_name() == "Character":
					#call_deferred("remove_character", attacking)
					#print('dead')
		else:
			print("CharacterH:", attacking.health)
			
	elif(attacking == null):
		print("none attacking")	
		$Timer.stop()
func remove_character(character):
	var tile_holder = get_parent()
	if tile_holder:
		tile_holder.remove_child(character)
		print("Character removed")