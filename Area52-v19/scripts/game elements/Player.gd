extends CharacterBody2D

const SPEED = 200.0
var inside_dropable = false
var current_tile_position

var can_deploy: bool = true

#@onready var current_level = get_node("/root/Level_"+str(Global.player_level))
var character_scene = preload("res://scenes/defender/pistoleer.tscn")
var scene_instance  # Variable to store the reference to the scene instance
var is_looking_left = false
var moving 

@onready var Hotbar_Timer = get_node("/root/Level_"+str(Global.player_level)+"/Hotbar_Timer")
@onready var current_scene = get_node("/root/Level_"+str(Global.player_level))


func _physics_process(delta):
	current_scene.update_timer_label_text()
	
	if Input.is_action_pressed("left"):
		position.x -= SPEED * delta
		moving = true
		if not is_looking_left:
			is_looking_left = true
			$PlayerSprite.flip_h = true  # Flip horizontally
			walk()
	elif Input.is_action_pressed("right"):
		position.x += SPEED * delta
		moving = true
		if is_looking_left:
			is_looking_left = false
			$PlayerSprite.flip_h = false  # Reset flip
			walk()
	elif Input.is_action_pressed("up"):
		position.y -= SPEED * delta
		moving = true
		walk()
	elif Input.is_action_pressed("down"):
		position.y += SPEED * delta
		moving = true
		walk()
	else:
		$PlayerSprite/AnimationPlayer.play("idle")
	
	if Input.is_action_just_pressed("drop"):
		#print(can_deploy)
		if current_tile_position != null:
			if can_deploy == true && current_tile_position.occupied == false:
				#can_deploy = false		
				if current_tile_position != null:
					current_tile_position.occupied = true
					scene_instance = character_scene.instantiate()  # Create a new instance each time "drop" is pressed
					current_tile_position.add_child(scene_instance)  # Add as child of the main scene
					scene_instance.global_position = current_tile_position.global_position   # Replace x and y with desired coordinates
					Hotbar_Timer.start()
					can_deploy = false
			else:
				print('reloading')
		else:
			print('not in a tile')


	elif Input.is_action_just_pressed("remove"):
		if current_tile_position != null:
			current_tile_position.occupied = false
			for child in current_tile_position.get_children():
				if child.name == "Character":
					current_tile_position.remove_child(child)
	move_and_slide()

# to get the chosen character to be dropped
func setDefender(defender):
	character_scene = defender
	#print(defender)	
	#var scene_instance = character_scene.instantiate()
#
	## Check if the instance has a method named "get_reload_time"
	#if scene_instance.has_method("get_reload_time"):
		## Access the reload time variable through the method
		#var reload_time = scene_instance.get_reload_time()
		#print("Reload time of the character scene:", reload_time)
	#else:
		#print("Character scene does not have a 'get_reload_time' method")
	
func set_timer(defender):
	Hotbar_Timer.wait_time = defender.get_reload_time()
	

func walk():
	$PlayerSprite/AnimationPlayer.play("walking")
