extends Control

onready var global = get_node("/root/Global")

func _ready():
	if global.sound:
		$MarginContainer/CenterContainer/VBoxContainer/TextureButton.texture_normal = preload("res://Assets/audioOn.png")
		$MarginContainer/CenterContainer/VBoxContainer/TextureButton.texture_pressed = preload("res://Assets/audioOff.png")
	else:
		$MarginContainer/CenterContainer/VBoxContainer/TextureButton.texture_normal = preload("res://Assets/audioOff.png")
		$MarginContainer/CenterContainer/VBoxContainer/TextureButton.texture_pressed = preload("res://Assets/audioOn.png")


func _on_TextureButton_pressed():
	if global.sound:
		global.sound = false
		$MarginContainer/CenterContainer/VBoxContainer/TextureButton.texture_normal = preload("res://Assets/audioOff.png")
		$MarginContainer/CenterContainer/VBoxContainer/TextureButton.texture_pressed = preload("res://Assets/audioOn.png")
	else:
		global.sound = true
		$MarginContainer/CenterContainer/VBoxContainer/TextureButton.texture_normal = preload("res://Assets/audioOn.png")
		$MarginContainer/CenterContainer/VBoxContainer/TextureButton.texture_pressed = preload("res://Assets/audioOff.png")


func _on_Back_pressed():
	
	if Global.prev == "Start":
		get_tree().change_scene("res://Start.tscn")
	
	if Global.prev == "End":
		get_tree().change_scene("res://End.tscn")
	
	if Global.prev == "Pause":
		get_tree().change_scene("res://Pause.tscn")
