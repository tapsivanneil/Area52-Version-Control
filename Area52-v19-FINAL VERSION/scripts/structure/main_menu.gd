extends Control

@onready var animation_timer = $animation_timer
@onready var animation = $Sprite2D/AnimatedSprite2D

func _ready():
	animation_timer.wait_time = 5
	animation_timer.start()

func _on_animation_timer_timeout():
	animation.play('animation')
