extends PanelContainer
class_name Placeholder
 
@onready var texture_rect = $TextureRect
 
#@export var defender : PackedScene = null: 
	#set(value):
		#defender = value
#@export_enum("NONE:0","HEAD:1","BODY:2","LEG:3", "ACTIVE:4") var slot_type : int
 
var filled : bool = false
 
func _get_drag_data(at_position):
 
	set_drag_preview(get_preview())
 
	return texture_rect
 
func _can_drop_data(_pos, data):
	return data is TextureRect and PackedScene
 
func _drop_data(_pos, data):
	
	var temp = texture_rect.property
	texture_rect.property = data.property
	data.property = temp

#to see the item you are dragging 
func get_preview():
	var preview_texture = TextureRect.new()
 
	preview_texture.texture = texture_rect.texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(30,30)
 
	var preview = Control.new()
	preview.add_child(preview_texture)
 
	return preview
 
func get_ATK():
	return texture_rect.ATK

func get_scn():
	return texture_rect.scene

func get_texture():
	return texture_rect.texture
 
func set_property(data):
	texture_rect.property = data
	
	if data["TEXTURE"] == null:
		filled = false
	else:
		filled = true
	

	
	
