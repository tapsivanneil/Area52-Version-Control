extends HBoxContainer
 
@onready var slots = get_children()
signal index(i: int)

 
var current_index : int:
	set(value):
		current_index = value
		reset_focus()
		set_focus()
		
@onready var hotbar_buttons = [
							$Slot,
							$Slot2,
							$Slot3,
							$Slot4,
							$Slot5 
									
	# Add references to all your hotbar buttons
]

#func _ready():
	#load_hotbar_from_passive_slots()
	#print("readied")

func load_hotbar_from_passive_slots():

	for i in range(hotbar_buttons.size()):
		var scene = DefenderList.get_passive_slot_data(i)
		var texture = DefenderList.get_passive_slot_texture(i)
		if scene:
			hotbar_buttons[i].defender = scene
			hotbar_buttons[i].icon = texture
			#print(scene)
			#hotbar_buttons[slot_index].icon = data
 
func _ready():
	current_index = 0
	
 
func reset_focus():
	for slot in slots:
		slot.set_process_input(false)
 
func set_focus():
	get_child(current_index).grab_focus()
	get_child(current_index).set_process_input(true)
	index.emit(current_index)
 
func _input(event):
	if event.is_action_pressed("next"):
		if current_index == get_child_count() - 1:
			current_index = 0
		else:
			current_index += 1

 
#func add_item(stats, skill):
	#for slot in slots:
		#if slot.stats == null:
			#slot.stats = stats
			#slot.skill = skill
			#return
