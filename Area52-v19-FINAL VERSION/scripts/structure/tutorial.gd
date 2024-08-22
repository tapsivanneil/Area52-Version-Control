extends Node2D


var tutorial_position = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range(1, 17):
		var tutorial_image = get_node("/root/Tutorial/Sprite2D/" + str(i))
		if i == tutorial_position:
			tutorial_image.visible = true
		else:
			tutorial_image.visible = false


func _on_next_button_pressed():
	if tutorial_position >= 1 && tutorial_position < 17:
		tutorial_position += 1
	elif tutorial_position == 17:
		tutorial_position = 1


func _on_previous_button_pressed():
	if tutorial_position > 1 && tutorial_position <= 17:
		tutorial_position -= 1
	elif tutorial_position == 1:
		tutorial_position = 17
