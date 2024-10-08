extends Node2D

@onready var current_scene = get_node('/root/Level_'+str(Global.player_level))
@onready var hot_bar = get_node('/root/Level_'+str(Global.player_level)+'/UI/Hotbar')
@onready var defeat_panel = get_node('/root/Level_'+str(Global.player_level)+'/Panels/DefeatPanel')
@onready var progress_bar = get_node('/root/Level_'+str(Global.player_level)+'/ProgressBar/CanvasLayer')



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _on_body_entered(body):
	if current_scene.enemy_on_stage != null:
		for i in current_scene.enemy_on_stage:
			var enemy_approaching = get_node("/root/Level_"+str(Global.player_level)+"/Enemies/Enemy" + str(i))
			if body == enemy_approaching:
				progress_bar.visible = false
				defeat_panel.visible = true
				hot_bar.visible = false
