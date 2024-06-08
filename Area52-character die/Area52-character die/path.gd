extends Area2D

var enemy = {}
var player
var tile

func _ready():
	
	for i in range(1, 50):
		enemy[i] = get_node("/root/MainScene/Enemy" + str(i))
	
	player = get_node("/root/MainScene/Player")
	tile = get_node("/root/MainScene/Tile1")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	for i in range(1, 50):
		if body == enemy[i]:
			pass
