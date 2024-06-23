extends Area2D

var enemy = {}
var health = 1000
var tile_holder
var attacking
var bullet_scene = PackedScene
var attack_speed = 0
var damage = 0
var reload_time = 10

@onready var main_scene = get_node('/root/Level_'+str(Global.player_level))

var path

func _ready():
	$Sprite2D/AnimatedSprite2D.play("idle")
	$animation_delay.wait_time = 0.8

func _on_body_entered(body):
	
	for i in main_scene.enemy_on_stage:
		var enemy_target = get_node('/root/Level_'+str(Global.player_level)+'/Enemies/Enemy'+str(i))
		if body == enemy_target:
			attacking = enemy_target
			#print(attacking)
			enemy_target.speed = 0
			
			tile_holder = get_parent()
		
			if tile_holder:
				#print("Tile holder exists:", tile_holder.get_name())
				for child in tile_holder.get_children():
					if child.get_name() == "Character":
						
						# nagrereference ng kung sino inaatake ng enemy
						enemy_target.attacking = child
						enemy_target.attack()

			else:
				print("Tile holder is null!")
		
		
func die():
	$animation_delay.start()
	$Sprite2D/AnimatedSprite2D.play("death")

func stop_attack():
	$Sprite2D/AnimatedSprite2D.play("idle")
	$Timer.stop()

func attack():
	#$Sprite2D/AnimatedSprite2D.play("attack")
	call_deferred("_do_attack")

func _do_attack():
	pass

func get_reload_time():
	return reload_time

func _on_animation_delay_timeout():
	queue_free()
	$animation_delay.stop()
