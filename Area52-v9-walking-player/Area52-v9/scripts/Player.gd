extends CharacterBody2D

const SPEED = 200.0
var inside_dropable = false
var current_tile_position
var character_scene = preload("res://scenes/character.tscn")
var scene_instance  # Variable to store the reference to the scene instance
var is_looking_left = false
var moving 

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		position.x -= SPEED * delta
		moving = true
		if not is_looking_left:
			is_looking_left = true
			$PlayerSprite.flip_h = true  # Flip horizontally
			walk()
	elif Input.is_action_pressed("ui_right"):
		position.x += SPEED * delta
		moving = true
		if is_looking_left:
			is_looking_left = false
			$PlayerSprite.flip_h = false  # Reset flip
			walk()
	elif Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
		moving = true
		walk()
	elif Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
		moving = true
		walk()
	
	if not moving:
		$PlayerSprite/AnimationPlayer.play("idle")
		move_and_slide()
	
	if Input.is_action_just_pressed("drop"):
		if current_tile_position != null:
			current_tile_position.occupied = true
			scene_instance = character_scene.instantiate()  # Create a new instance each time "drop" is pressed
			current_tile_position.add_child(scene_instance)  # Add as child of the main scene
			scene_instance.global_position = current_tile_position.global_position   # Replace x and y with desired coordinates

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

func walk():
	$PlayerSprite/AnimationPlayer.play("walking")
