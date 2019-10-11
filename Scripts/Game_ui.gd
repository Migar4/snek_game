extends Control

var pause_menu = preload("res://Pause.tscn")

func _ready():
	pause_mode = Node.PAUSE_MODE_STOP
	change_label()

func _process(delta):
	$MarginContainer/Compass.rect_position.y = Global.viewport_size.y * 2/3
	compass()
	change_label()

func change_label():
	$MarginContainer/TextureRect/Label.text = String(Global.score)
	Global.score_change = false

func compass():
	var sf = (Global.food_pos - Global.snek_pos).normalized()
	var dp = sf.dot(Vector2(1, 0))
	var angle = -acos(dp)
	if Global.snek_pos.y < Global.food_pos.y:
		angle = - angle
	$MarginContainer/Compass/Arrow.set_rotation(angle)


