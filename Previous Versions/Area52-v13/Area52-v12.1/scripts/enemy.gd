extends Node2D

var speed = 0
var moving_speed = 0.3
var dps = 15
var health = 200
var deployed_enemy_tag
var attack_speed = 2
var attacking

@onready var player = get_node("/root/Level_1/Player")
@onready var bullet = preload("res://scenes/bullet.tscn")
@onready var main_scene = get_node("/root/Level_1")

@onready var animated_sprite = $AnimatedSprite

func _ready():

	$Timer.wait_time = attack_speed
	animated_sprite.play('Walk')
	
func _process(delta):
	position.x -= speed
	


func attack():
	$Timer.start()

	
func _on_timer_timeout():
	speed = 0
	if attacking != null: 
		attacking.health -= dps
		print(attacking.health)
		if attacking.health <= 0:
			$Timer.stop()
			
			var child = attacking
			if child.get_name() == "Character":
				#call_deferred("remove_character", attacking)
				print('dead')
				child.queue_free()
				
				attacking = null
				speed = moving_speed
				
		else:
			#print("CharacterH:", attacking.health)
			pass
	elif(attacking == null):
		print("none attacking")	
		$Timer.stop()
		speed = moving_speed

func take_dmg(dmg, enemy):
	health -= dmg
	print(health)
	if health == 0:
		main_scene.enemy_on_stage.erase(enemy)
		print(main_scene.enemy_on_stage)
		queue_free()

		
#func _on_area_2d_body_entered(body):
	#if body.get_name() == 'Bullet' or body == bullet:
		#self.queue_free() 
