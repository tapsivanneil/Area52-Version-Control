extends HSlider

@export
var bus_name: String = "Music"  # Default to 'Music' bus

var bus_index: int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	connect("value_changed", Callable(self, "_on_value_changed"))
	
	# Set the initial value of the slider based on the current bus volume
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))

func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))


