extends Area2D

var player
var tiles = {}
var occupied = false
var enemy = {}

var tolerance = 50
@onready var color_rect = $ColorRect


func _ready():
	color_rect.modulate.a = 0.1
	
	for i in range(1, 50):
		enemy[i] = get_node("/root/Level_1/Enemy" + str(i))
	
	player = get_node("/root/Level_1/Player")
	
	for i in range(1, 45):  
		var tile_name = "Tile" + str(i)
		tiles[i] = get_node("/root/Level_1/" + tile_name) 

#func _process(delta):
	#pass
	#for child in get_children():
		#if child.get_name() == "Character":
			#if(child.health == 0):
				#print('Character is dead')
	
func _on_body_entered(body):
	if body == player:
		player.inside_dropable = true
		#for child in get_children():
			#print(child)
	
	for i in range(1, 45):
		var tile_pos = tiles[i].global_position
		if (player.global_position.x  <= tile_pos.x + tolerance &&
			player.global_position.x  >= tile_pos.x - tolerance &&
			player.global_position.y  <= tile_pos.y + tolerance &&
			player.global_position.y  >= tile_pos.y - tolerance):
			#print('Player is near Tile ' + str(i))
			player.current_tile_position = tiles[i]
	
	#for i in range(1, 50):
		#if body == enemy[i]:
			#print(enemy[i])

				
func _on_body_exited(body):
	if body == player:
		player.inside_dropable = false

func attack():
	for child in get_children():
		if child.get_name() == "Character":
			$Timer.wait_time = child.casting_time
			child.attack()

func stop_attack():
	for child in get_children():
		if child.get_name() == "Character":
			child.stop_attack()



func _on_timer_timeout():
	attack()
