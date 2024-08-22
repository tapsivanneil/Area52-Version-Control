extends Area2D

var enemy = {}
var player
var tile = {}

func _ready():
	
	for i in range(1, 50):
		enemy[i] = get_node("/root/MainScene/Enemy" + str(i))
	
	player = get_node("/root/MainScene/Player")
	
	for i in range(1, 45):
		tile[i] = get_node("/root/MainScene/Tile" + str(i))
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


#func _on_body_entered(body):
	#for i in range(1, 10):
		#if body == enemy[i]:
			#print('Enemy in First Line')
			#for j in range(1, 45, 5):
				#pass
				##tile[j].attack()
				##print('Tile Attacking: ' + str(tile[j].name))
#
	#for i in range(11, 20):
		#if body == enemy[i]:
			#print('Enemy in Second Line')
			#for j in range(2, 45, 5):
				#pass
				##tile[j].attack()
				##print('Tile Attacking: ' + str(tile[j].name))
	#for i in range(21, 30):
		#if body == enemy[i]:
			#print('Enemy in Third Line')
			#for j in range(3, 45, 5):
				#pass
				##tile[j].attack()
				##print('Tile Attacking: ' + str(tile[j].name))
	#for i in range(31, 40):
		#if body == enemy[i]:
			#print('Enemy in Fourth Line')
			#for j in range(4, 45, 5):
				#pass
				##tile[j].attack()
				##print('Tile Attacking: ' + str(tile[j].name))
	#for i in range(41, 50):
		#if body == enemy[i]:
			#print('Enemy in Fifth Line')
			#for j in range(5, 45, 5):
				#pass
				##tile[j].attack()
				##print('Tile Attacking: ' + str(tile[j].name))

	#pass
