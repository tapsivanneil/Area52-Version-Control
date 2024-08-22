extends Node2D

@onready var current_scene = get_node('/root/Level_'+str(Global.player_level))

@onready var Kills_ProgressBar = $CanvasLayer/Kills_ProgressBar
@onready var Spawns_ProgressBar = $CanvasLayer/Spawns_ProgressBar

var num_of_killed_spawns
var num_of_spawned_attackers
var max_num_of_spawns

func _ready():
	num_of_killed_spawns = 0
	num_of_spawned_attackers = 0
	max_num_of_spawns = current_scene.default_num_of_spawns
	Kills_ProgressBar.max_value = max_num_of_spawns
	Spawns_ProgressBar.max_value = max_num_of_spawns
	
func update_kills_progress_bar():
	num_of_killed_spawns += 1
	Kills_ProgressBar.value =  num_of_killed_spawns 
	print(Kills_ProgressBar.value)

func update_spawns_progress_bar():
	num_of_spawned_attackers += 1
	Spawns_ProgressBar.value =  num_of_spawned_attackers 
	print(Spawns_ProgressBar.value)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
