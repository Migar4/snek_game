extends Node

var body_array : Array

func _ready():
	pass

func add_item(body):
	body_array.push_back(body)

func get_count():
	return body_array.size()

func _deffered_add_child(body_instance):
	add_child(body_instance)