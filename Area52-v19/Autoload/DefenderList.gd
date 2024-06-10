extends Node


var passive_slot_data = []  # This will store PackedScene references for passive slots
var passive_slot_texture = []

func set_passive_slot_data(index: int, scene: PackedScene, text: CompressedTexture2D):
	if index >= passive_slot_data.size():
		passive_slot_data.resize(index + 1)
		passive_slot_texture.resize(index + 1)
	passive_slot_data[index] = scene
	passive_slot_texture[index] = text
	

func get_passive_slot_data(index: int) -> PackedScene:
	if index < passive_slot_data.size():
		return passive_slot_data[index]
		
	return null

func get_passive_slot_texture(index: int) -> CompressedTexture2D:
	if index < passive_slot_texture.size():
		return passive_slot_texture[index]
		
	return null

func count_null_values():
	var count = 0
	for item in passive_slot_data:
		if item == null:
			count += 1
	return count



