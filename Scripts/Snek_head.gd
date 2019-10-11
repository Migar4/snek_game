extends Node2D
signal hit_wall
signal bite
signal food_eat

var snek_body = preload("res://Scripts/Snek_body_vars.gd")
func _ready():
	pass

func _process(delta):
	$Game_ui.rect_position = $KinematicBody2D.position + Global.gui_pos

func _on_Area2D_body_entered(body):
	
	if body.is_class("TileMap"):
		emit_signal("hit_wall")
	
	if body is preload("res://Scripts/Snek_body_KB.gd"):
		emit_signal("bite")
	
	if body is preload("res://Scripts/Food.gd"):
		emit_signal("food_eat")

