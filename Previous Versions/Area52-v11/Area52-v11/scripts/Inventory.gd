extends GridContainer

var defender_data 
func _ready():
	for i in 6:
		defender_list(str(i))
	#defender_list()
	
func defender_list(ID = "0"):

	var defender_texture = load("res://assets/defenders/" + DefenderData.get_texture(ID))
	var defender_ATK = DefenderData.get_ATK(ID)
	var defender_scn = load("res://scenes/" + DefenderData.get_scn(ID))
	print(ID)
 
	defender_data = {"TEXTURE": defender_texture,
					 "SCENE": defender_scn,
					 "ATK": defender_ATK
					 }
					
#func add_item(ID = "0"):
	#var item_texture = load("res://assets/curated/" + ItemData.get_texture(ID))
	#var item_slot_type = ItemData.get_slot_type(ID)
	#var item_ATK = ItemData.get_ATK(ID)
 #
	#var item_data = {"TEXTURE": defender_texture,
					 #"ATK": defender_ATK,
					 #}
 
	var index = 0
	for i in get_children():
		if i.filled == false:
			index = i.get_index()
			break
	get_child(index).set_property(defender_data)
