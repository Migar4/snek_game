extends Control

signal options_pressed

onready var options_menu = preload("res://Options.tscn")

func _ready():
	pass


func _on_Restart_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Main.tscn")


func _on_Continue_pressed():
	get_tree().paused = false
	$MarginContainer/CenterContainer/Pause_Menu/Options/Popup.hide()


func _on_Options_pressed():
	Global.prev = "Pause"
	emit_signal("options_pressed")
	$MarginContainer/CenterContainer/Pause_Menu/Options/Popup.rect_position = Global.snek_head_pos

func _on_Quit_pressed():
	get_tree().quit()
