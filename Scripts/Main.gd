extends Node2D

var end_scene = preload("res://End.tscn")
onready var global = get_node("/root/Global")

func _ready():
	pause_mode = Node.PAUSE_MODE_STOP
	init_var()
	$Snek/Snek_body/Snek_head/KinematicBody2D.position = Vector2(Global.spawn_size.x / 2, Global.spawn_size.y / 2)
	$Food_spawn.change_food()

func _process(delta):
	Global.spawn_size.x = int($End.position.x - 50)
	Global.spawn_size.y = int($End.position.y - 50)
	Global.start_spawn.x = int($Start.position.x + 50)
	Global.start_spawn.y = int($Start.position.y + 50)
	
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()

func init_var():
	Global.score = 0

func _on_Snek_end():
	get_tree().change_scene_to(end_scene)


func _on_Snek_food_eat():
	
	if global.sound:
		$AudioStreamPlayer2D.play()
	
	$Food_spawn.change_food()
	$Snek/Snek_body.add_body()
	Global.score += 1
	Global.score_change = true
