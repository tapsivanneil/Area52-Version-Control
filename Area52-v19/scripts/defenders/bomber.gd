extends Area2D

var enemy = {}
var health = 300
var tile_holder
var attacking
var bullet_scene = PackedScene
var attack_speed = 400
var damage = 10
var casting_time = 1
var reload_time = 5

@onready var main_scene = get_node('/root/Level_'+str(Global.player_level))
@onready var bomb_shot = $bomb_shot

var path

func _ready():
	#path = preload("res://path.tscn")
	$Sprite2D/AnimatedSprite2D.play("idle")
	$Timer.wait_time = attack_speed

#func _process(delta):
	#pass
	

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
	$Sprite2D/AnimatedSprite2D.play("death")
	queue_free()

func stop_attack():
	$Sprite2D/AnimatedSprite2D.play("idle")
	$Timer.stop()

func attack():
	#$Timer.start()
	$Sprite2D/AnimatedSprite2D.play("attack")
	call_deferred("_do_attack")

func _do_attack():
	bullet_scene = preload("res://scenes/projectiles/bomb.tscn")
	var bullet_instance = bullet_scene.instantiate()
	bomb_shot.play()
	get_tree().root.add_child(bullet_instance)
	bullet_instance.transform = $Shooting_area.global_transform
	#print("attacking")

func get_reload_time():
	return reload_time
