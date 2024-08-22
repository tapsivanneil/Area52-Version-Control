extends Node2D

var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos: Vector2

func _process(delta):
	if draggable:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			#print('Mouse button pressed')
			initialPos = global_position
			global_position = get_global_mouse_position() - offset
			global.is_dragging = true
			
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
			#print('Mouse button released')
			global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_in_group('dropable'):
				print('hello')
				tween.tween_property(self, "position", initialPos, 0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "global_position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
				
func _on_area_2d_mouse_entered():
	if not global.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	if not global.is_dragging:
		draggable = false
		scale = Vector2(1, 1)

func _on_area_2d_body_entered(body: StaticBody2D):
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		body_ref = body
		
func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = false
		body.modulate = Color(Color.REBECCA_PURPLE, 0.7)
		body_ref = body
