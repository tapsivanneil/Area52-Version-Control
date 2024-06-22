extends Control

var completed: bool = false

# Signal to notify the main scene when selection is done
signal selection_done

@onready var main_scene_timer = get_node('/root/Level_'+str(Global.player_level)+'/Timer')

func _ready():

	main_scene_timer.stop()
	
	# Connect the button signals to a function
	$StartButton.disabled = true
	$StartButton.connect("pressed", Callable(self, "on_start_button_pressed()"))

func complete_selection():
	if DefenderList.count_null_values() == 0 && DefenderList.passive_slot_data.size() >= 5:
		#print("true")
		completed = true
		$StartButton.disabled = false
		#visible = !visible
		#$"../Hotbar".load_hotbar_from_passive_slots()
	else:
		$StartButton.disabled = true
	return completed
	

func _on_start_button_pressed():
	main_scene_timer.start()
	emit_signal("selection_done")

