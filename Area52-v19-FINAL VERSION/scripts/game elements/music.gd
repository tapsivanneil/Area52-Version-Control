extends AudioStreamPlayer

var instance: AudioStreamPlayer = null

func _ready() -> void:
	if instance == null:
		instance = self
		#set_autoload()
		if not is_playing():
			play()
	else:
		queue_free()

#func set_autoload():
	#get_tree().get_root().add_child(self)
	#self.owner = get_tree().get_root()
