extends Placeholder
class_name PassiveSlot

@export var slot_index : int = 0: 
	set(value):
		slot_index = value
		
var character_scene 
var root
var main
var texture
var is_empty: bool = true


func _ready():
	main = get_parent().get_parent().get_parent()


func _get_drag_data(at_position):
 
	set_drag_preview(get_preview())
	is_empty = true
	clear_slot(slot_index)
 
	return texture_rect
	
func _drop_data(_pos, data):
	var temp = texture_rect.property
	texture_rect.property = data.property
	data.property = temp
	
	character_scene = get_scn()	
	texture = get_texture()
	#update_slot_display(data)
	is_empty = false
	print(slot_index)
	save_to_game_data(texture)

		
#func update_slot_display(data):
	#print(data)
	#if character_scene:
		#var instance = character_scene.instantiate()
		#$Icon.texture = data.property
		
func save_to_game_data(data):
	# Assuming you have an identifier for each slot, e.g., slot index
	DefenderList.set_passive_slot_data(slot_index, character_scene,data)
	get_parent().get_parent().complete_selection()
	#main.load_hotbar_from_passive_slots(slot_index, data)

func clear_slot(slot_index):
	if (is_empty == true):
		character_scene = null
		var data = null
		DefenderList.set_passive_slot_data(slot_index, character_scene, data)
		#main.load_hotbar_from_passive_slots(slot_index,data)

		


	

	

	
