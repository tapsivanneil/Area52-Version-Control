extends Area2D

var enemy = {}
var health = 100
var tile_holder
var attacking
var bullet_scene = PackedScene
var attack_speed = 300
var damage = 10
var casting_time = 1

@onready var main_scene = get_node('/root/Level_1')

var path

func _ready():
	$Sprite2D/AnimationPlayer.play("idle")
	#path = preload("res://path.tscn")
	
	$Timer.wait_time = attack_speed

#func _process(delta):
	#pass
	

func _on_body_entered(body):
	
	for i in main_scene.enemy_on_stage:
		var enemy_target = get_node('/root/Level_1/Enemy'+str(i))
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
	queue_free()

func stop_attack():
	$Timer.stop()

func attack():
	#$Timer.start()
	call_deferred("_do_attack")

func _do_attack():
	bullet_scene = preload("res://scenes/projectiles/machine_gun_bullet.tscn")
	var bullet_instance = bullet_scene.instantiate()
	get_tree().root.add_child(bullet_instance)
	bullet_instance.transform = $Shooting_area.global_transform
	#print("attacking")

	
