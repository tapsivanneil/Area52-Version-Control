extends Node

@export var sfx_path: String = "res://assets/music/menu-button-89141.mp3"
@export var bus_name: String = "System"

var sfx_stream: AudioStream
var sfx_player: AudioStreamPlayer

func _ready() -> void:
	sfx_stream = load(sfx_path)
	sfx_player = AudioStreamPlayer.new()
	sfx_player.stream = sfx_stream
	
	# Set the bus for the AudioStreamPlayer
	sfx_player.bus = bus_name
		
	add_child(sfx_player)

	# Connect to all buttons in the scene
	connect_buttons(get_tree().root)
	
	# Ensure we catch new buttons added at runtime
	get_tree().connect("node_added", Callable(self, "_on_node_added"))

func play_button_sound() -> void:
	#print("play")
	if sfx_player.is_playing():
		sfx_player.stop()  # Stop the player if it's currently playing the sound
	sfx_player.play()

func connect_buttons(node: Node) -> void:
	if node is Button:
		if not node.is_connected("pressed", Callable(self, "_on_button_pressed")):
			node.connect("pressed", Callable(self, "_on_button_pressed"))

	for child in node.get_children():
		if child is Node:
			connect_buttons(child)

func _on_button_pressed() -> void:
	play_button_sound()

func _on_node_added(node: Node) -> void:
	connect_buttons(node)
