extends Button
 
@onready var player = get_tree().current_scene.find_child("Player")
@onready var icon_texture 
 
@export var defender : PackedScene = null: 
	set(value):
		defender = value

#@export var stats : Item = null:
	#set(value):
		#stats = value
 #
		#if value != null:
			#icon = value.icon
		#else:
			#icon = null
 
func _ready():
	set_process_input(false)
	use_item()
 	
func _input(event):
	if event.is_action_pressed("use"):
		use_item()
 
func use_item():
	if defender != null:
		var defender_instance = defender.instantiate()  # Instance the packed scene
		player.setDefender(defender)  # Pass the instance to player node
		player.set_timer(defender_instance)
		
	#pass
	#if stats == null:
		#return
	#player.play_FX(skill)
 
 
func _on_pressed():
	use_item()
	get_parent().current_index = get_index()
	#player.find_child("Weapons")._on_index(get_index())
