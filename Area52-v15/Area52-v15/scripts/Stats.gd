extends TextureRect
 
@export var scene: PackedScene = null
 
@export var ATK = 0:
	set(value):
		ATK = value
		%debug.text = str(ATK)
 
		#if get_parent() is PassiveSlot or get_parent() is ActiveSlot:
			#get_parent().get_parent().calculate()
 
		#if get_parent() is ActiveSlot and value == 0:
			#owner.get_parent().owner.find_child("player").set_speed(value)
 
 
@onready var property: Dictionary = {"TEXTURE": texture,
									 "ATK": ATK,
									 "SCENE": scene}:
	set(value):
		property = value
 
		texture = property["TEXTURE"]
		ATK = property["ATK"]
		scene = property["SCENE"]
