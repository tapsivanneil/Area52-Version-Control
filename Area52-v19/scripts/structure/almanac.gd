extends Node2D


var characterLabel


func _ready():
	characterLabel = $Label
	
func _process(delta):
	pass


func _on_bomber_mouse_entered():
		defender_changeLabelDescription('Bomber', 120, 10, 8, 400)


func _on_defender_mouse_entered():
	defender_changeLabelDescription('Defender', 300, 0, 10, 0)


func _on_flamethrower_mouse_entered():
	defender_changeLabelDescription('Flamethrower', 120, 10, 8, 400)


func _on_machinegunner_mouse_entered():
	defender_changeLabelDescription('Machine Gunner', 150, 15, 9, 700)


func _on_pistoleer_mouse_entered():
	defender_changeLabelDescription('Pistoleer', 100, 10, 7, 300)


func _on_railgunner_mouse_entered():
	defender_changeLabelDescription('Rail Gunner', 80, 20, 12, 1000)


func _on_sniper_mouse_entered():
	defender_changeLabelDescription('Sniper', 80, 15, 10, 1000)


func _on_mutatedalien_mouse_entered():
	attacker_changeLabelDescription('Mutated', 1000, 50, 15)


func _on_crawler_mouse_entered():
	attacker_changeLabelDescription('Crawler', 250, 15, 30)


func _on_dungbeetle_mouse_entered():
	attacker_changeLabelDescription('Dung Beetle', 100, 10, 20)


func _on_grimer_mouse_entered():
	attacker_changeLabelDescription('Grimer', 300, 15, 20)


func _on_swarm_mouse_entered():
	attacker_changeLabelDescription('Swarm', 300, 15, 20)


func _on_alieny_mouse_entered():
	attacker_changeLabelDescription('Alien Y', 300, 15, 20)
	
	
func attacker_changeLabelDescription(character_name, character_health, character_damage, character_movement_speed):
	characterLabel.text = 'Name: ' + str(character_name) + '\nHealth: ' + str(character_health) + '\nDamage: ' + str(character_damage) + '\nMovement Speed: ' + str(character_movement_speed)

func defender_changeLabelDescription(character_name, character_health, character_damage, character_reload_time, character_attack_speed):
	characterLabel.text = 'Name: ' + str(character_name) + '\nHealth: ' + str(character_health) + '\nDamage: ' + str(character_damage) + '\nAttack Speed: ' + str(character_damage) + '\nReload Time: ' + str(character_reload_time)
