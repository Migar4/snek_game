extends Control

onready var options_menu = preload("res://Options.tscn")
onready var main_scene = load("res://Main.tscn")

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	$MarginContainer/CenterContainer/End_Menu_Cont/TextureRect/Label.text = String(Global.score)


func _on_Restart_pressed():
	get_tree().change_scene_to(main_scene)


func _on_Options_pressed():
	Global.prev = "End"
	get_tree().change_scene_to(options_menu)


func _on_Quit_pressed():
	get_tree().quit()
