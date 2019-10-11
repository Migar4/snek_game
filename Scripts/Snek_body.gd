extends Node2D

const snek_body = preload("res://Snek_body.tscn")
var body_instance
var body_size : int = 0

var distance : int
var head_dims : Vector2
var viewport_size : Vector2

func _ready():
	head_dims = Vector2(200, 200) * 0.2
	viewport_size = get_viewport_rect().size

func _physics_process(delta):
	follow()

func add_body():
	body_instance = snek_body.instance()
	if body_size == 0:
		body_instance.up = $Snek_head/KinematicBody2D.is_dir_up()
		body_instance.down = $Snek_head/KinematicBody2D.is_dir_down()
		body_instance.left = $Snek_head/KinematicBody2D.is_dir_left()
		body_instance.right = $Snek_head/KinematicBody2D.is_dir_right()
	$Container.add_child(body_instance)
	get_next_pos()
	body_size += 1


func get_next_pos():
	if body_size == 0:
		if body_instance.up:
			distance = int(head_dims.y)
			$Container.get_child(body_size).position.y = $Snek_head/KinematicBody2D.position.y + distance
			$Container.get_child(body_size).position.x = $Snek_head/KinematicBody2D.position.x
		if body_instance.down:
			distance = int(head_dims.y)
			$Container.get_child(body_size).position.y = $Snek_head/KinematicBody2D.position.y - distance
			$Container.get_child(body_size).position.x = $Snek_head/KinematicBody2D.position.x
		if body_instance.left:
			distance = int(head_dims.x)
			$Container.get_child(body_size).position.y = $Snek_head/KinematicBody2D.position.y
			$Container.get_child(body_size).position.x = $Snek_head/KinematicBody2D.position.x + distance
		if body_instance.right:
			distance = int(head_dims.x)
			$Container.get_child(body_size).position.y = $Snek_head/KinematicBody2D.position.y
			$Container.get_child(body_size).position.x = $Snek_head/KinematicBody2D.position.x - distance
	else:
		body_instance.up = $Snek_head/KinematicBody2D.is_dir_up()
		body_instance.down = $Snek_head/KinematicBody2D.is_dir_down()
		body_instance.left = $Snek_head/KinematicBody2D.is_dir_left()
		body_instance.right = $Snek_head/KinematicBody2D.is_dir_right()
		
		if $Container.get_child(body_size).up:
			distance = int(head_dims.y)
			$Container.get_child(body_size).position.y = $Container.get_child(body_size - 1).position.y + distance
			$Container.get_child(body_size).position.x = $Container.get_child(body_size - 1).position.x
		
		if $Container.get_child(body_size).down:
			distance = int(head_dims.y)
			$Container.get_child(body_size).position.y = $Container.get_child(body_size - 1).position.y - distance
			$Container.get_child(body_size).position.x = $Container.get_child(body_size - 1).position.x
		
		if $Container.get_child(body_size).left:
			distance = int(head_dims.y)
			$Container.get_child(body_size).position.y = $Container.get_child(body_size - 1).position.y 
			$Container.get_child(body_size).position.x = $Container.get_child(body_size - 1).position.x + distance
		
		if $Container.get_child(body_size).right:
			distance = int(head_dims.y)
			$Container.get_child(body_size).position.y = $Container.get_child(body_size - 1).position.y 
			$Container.get_child(body_size).position.x = $Container.get_child(body_size - 1).position.x - distance

func follow():
	for i in range(1, body_size):
		$Container.get_child(i).position = $Container.get_child(i).position.linear_interpolate($Container.get_child(i - 1).position, 0.07)

func get_body_size():
	return body_size

