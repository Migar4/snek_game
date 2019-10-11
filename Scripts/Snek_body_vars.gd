extends Node2D

var up : bool
var down : bool
var left : bool
var right : bool

func _ready():
	pass

func move(velocity : Vector2):
	$KinematicBody2D.move_and_collide(velocity)

func change_pos(pos : Vector2):
	$KinematicBody2D.position = pos

func get_pos_x():
	return $KinematicBody2D.position.x

func get_pos_y():
	return $KinematicBody2D.position.y