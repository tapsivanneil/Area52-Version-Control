extends Node2D

var speed = 0
var moving_speed = 0.2
var dps = 100
var health = 120
var deployed_enemy_tag
var attack_speed = 1
var attacking

var self_reference

@onready var player = get_node("/root/Level_"+str(Global.player_level)+"/Player")
@onready var victory_panel = get_node('/root/Level_'+str(Global.player_level)+'/Panels/VictoryPanel')
@onready var animated_sprite = $AnimatedSprite
@onready var hot_bar = get_node("/root/Level_"+str(Global.player_level)+"/UI/Hotbar")
@onready var main_scene = get_node("/root/Level_"+str(Global.player_level))
@onready var beetle = $AnimatedSprite
@onready var progress_bar = get_node("/root/Level_"+str(Global.player_level)+"/ProgressBar")
@onready var progress_bar_vis = get_node("/root/Level_"+str(Global.player_level)+"/ProgressBar/CanvasLayer")


func _ready():
	$animation_delay.wait_time = 0.8
	$Timer.wait_time = attack_speed
	animated_sprite.play('Walk')
	
func _process(delta):
	position.x -= speed


func attack():
	$Timer.start()
	beetle.play("Attack")
	
func _on_timer_timeout():
	speed = 0
	if attacking != null: 
		attacking.health -= dps
		if attacking.health <= 0:
			var child = attacking
			if child.get_name() == "Character":
				attacking = null
				child.die()
				speed = moving_speed
				
	elif(attacking == null):
		animated_sprite.play('Walk')
		$Timer.stop()
		speed = moving_speed

func take_dmg(dmg, enemy):
	health -= dmg
	self_reference = enemy
	if health <= 0:
		animated_sprite.play('Death')
		$animation_delay.start()
		
func after_death_animation(enemy):
	main_scene.total_kills += 1
	print(main_scene.total_kills)
	print(main_scene.default_num_of_spawns)		
	if main_scene.total_kills >= main_scene.default_num_of_spawns:
		if Global.player_level == 5:
			get_tree().change_scene_to_file("res://scenes/structure/ending.tscn")
		else:
			progress_bar_vis.visible = false
			victory_panel.visible = true
			hot_bar.visible = false
			Global.opened_level += 1
	main_scene.enemy_on_stage.erase(enemy)
	progress_bar.update_kills_progress_bar()
	queue_free()

func _on_animation_delay_timeout():
	after_death_animation(self_reference)
	$animation_delay.stop()

func _on_area_2d_body_entered(body):
	if body == player:
		pass
