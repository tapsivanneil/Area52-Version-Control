extends Area2D

var speed = 200		#bullet speed
var dmg = 50 		#dmg = damage
var enemy ={}
func _ready():
	for i in range(1, 50):
		enemy[i] = get_node("/root/MainScene/Enemy" + str(i))

func _process(delta):	
	position += transform.x * speed * delta

func _on_body_entered(body):
	queue_free()
	for i in range(1, 50):
		if body == enemy[i]:
			enemy[i].take_dmg(dmg)
			print(enemy[i].health)
		
	if body.has_method("take_damage"):
		body.take_damage()
