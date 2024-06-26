extends Node2D

@onready var current_scene = get_node('/root/Level_'+str(Global.player_level))
@onready var defeat_panel = get_node('/root/Level_'+str(Global.player_level)+'/Panels/DefeatPanel')

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if current_scene.enemy_on_stage != null:
		for i in current_scene.enemy_on_stage:
			var enemy_approaching = get_node("/root/Level_"+str(Global.player_level)+"/Enemies/Enemy" + str(i))
			if body == enemy_approaching:
				defeat_panel.visible = true
