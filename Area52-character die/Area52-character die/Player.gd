extends CharacterBody2D

const SPEED = 400.0
var inside_dropable = false
var current_tile_position
var character_scene = preload("res://character.tscn")
var scene_instance  # Variable to store the reference to the scene instance

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		position.x -= SPEED * delta
	elif Input.is_action_pressed("ui_right"):
		position.x += SPEED * delta
	elif Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
	elif Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
	elif Input.is_action_just_pressed("drop"):
		current_tile_position.occupied = true
		scene_instance = character_scene.instantiate()  # Create a new instance each time "drop" is pressed
		current_tile_position.add_child(scene_instance)  # Add as child of the main scene
		scene_instance.global_position = current_tile_position.global_position   # Replace x and y with desired coordinates

	elif Input.is_action_just_pressed("remove"):
		current_tile_position.occupied = false
		print(current_tile_position.get_children())
		for child in current_tile_position.get_children():
			if child.get_name() == "Character":
				current_tile_position.remove_child(child)
				print(current_tile_position.get_children())
				
	move_and_slide()
