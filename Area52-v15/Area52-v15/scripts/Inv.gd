extends Control

var completed: bool = false

# Signal to notify the main scene when selection is done
signal selection_done

func _ready():
	# Connect the button signals to a function
	$StartButton.disabled = true
	$StartButton.connect("pressed", Callable(self, "on_start_button_pressed()"))

func complete_selection():
	if DefenderList.passive_slot_data.size() == 5:
		completed = true
		$StartButton.disabled = false
		#visible = !visible
		#$"../Hotbar".load_hotbar_from_passive_slots()
	return completed
	

func _on_start_button_pressed():
	print("start")
	emit_signal("selection_done")

