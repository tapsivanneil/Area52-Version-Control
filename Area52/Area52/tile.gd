extends Area2D

var player
var enemy
var tiles = {}
var occupied = false

var tolerance = 50

func _ready():
	player = get_node("/root/MainScene/Player")
	for i in range(1, 45):  
		var tile_name = "Tile" + str(i)
		tiles[i] = get_node("/root/MainScene/" + tile_name) 
	
func _on_body_entered(body):
	if body == player:
		player.inside_dropable = true
	
	for i in range(1, 45):
		var tile_pos = tiles[i].global_position
		if (player.global_position.x  <= tile_pos.x + tolerance &&
			player.global_position.x  >= tile_pos.x - tolerance &&
			player.global_position.y  <= tile_pos.y + tolerance &&
			player.global_position.y  >= tile_pos.y - tolerance):
			#print('Player is near Tile ' + str(i))
			player.current_tile_position = tiles[i]

				
func _on_body_exited(body):
	if body == player:
		player.inside_dropable = false
	
