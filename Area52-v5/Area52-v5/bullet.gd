extends Area2D

var speed = 200		#bullet speed
var dmg = 10 		#dmg = damage
var enemy ={}

var barrier


func _ready():
	
	barrier =  get_node("/root/MainScene/Barrier")
	
	for i in range(1, 50):
		if get_node("/root/MainScene/Enemy" + str(i)) != null:
			enemy[i] = get_node("/root/MainScene/Enemy" + str(i))

func _process(delta):	
	position += transform.x * speed * delta

func _on_body_entered(body):
	
	queue_free()
	
	if body.has_method("take_dmg"):
		body.take_dmg(dmg, body)
	
