extends Control

onready var main_scene = preload("res://Main.tscn")
onready var options_menu = preload("res://Options.tscn")

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS


func _on_Start_pressed():
	get_tree().change_scene_to(main_scene)


func _on_Options_pressed():
	Global.prev = "Start"
	get_tree().change_scene_to(options_menu)


func _on_Quit_pressed():
	get_tree().quit()
