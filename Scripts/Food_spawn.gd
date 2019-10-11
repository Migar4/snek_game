extends Node2D

var food = preload("res://Food.tscn")
var hor : int
var ver : int
var shor : int
var sver : int

func _ready():
	hor = Global.spawn_size.x
	ver = Global.spawn_size.y
	shor = Global.start_spawn.x
	sver = Global.start_spawn.y

func change_food():
	if $control.get_child_count() > 0:
		$control.get_child(0).queue_free()
	call_deferred("_deferred_add_child")


func _deferred_add_child():
	var ins = food.instance()
	if hor != 0 and ver != 0:
		ins.position = Vector2(shor + (randi() % hor), sver + (randi() % ver))
	Global.food_pos = ins.position
	$control.add_child(ins)

func _process(delta):
	pass