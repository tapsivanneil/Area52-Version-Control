extends Node2D


@onready var hotbar_buttons = [
 	$UI/hotbar/slot,
	$UI/hotbar/slot2,
	$UI/hotbar/slot3,
	$UI/hotbar/slot4,
	$UI/hotbar/slot5,	
	# Add references to all your hotbar buttons
]

#func _ready():
	#load_hotbar_from_passive_slots()
	#print("readied")

func load_hotbar_from_passive_slots():
	for i in range(hotbar_buttons.size()):
		var scene = DefenderList.get_passive_slot_data(i)
		if scene:
			hotbar_buttons[i].defender = scene
			#hotbar_buttons[slot_index].icon = data


		
