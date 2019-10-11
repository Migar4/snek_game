extends KinematicBody2D

var up : bool = false
var down : bool = false
var left : bool = false
var right : bool = true

onready var head = $head

var collisioin_object : KinematicCollision2D

var Velocity : Vector2 = Vector2()

func _process(delta):
	handle_input()

func _physics_process(delta):
	
	if up:
		Velocity = Vector2(0, -1) * Global.speed
		if head:
			rotation = deg2rad(270)
	if down:
		Velocity = Vector2(0, 1) * Global.speed
		if head:
			rotation = deg2rad(90)
	if left:
		Velocity = Vector2(-1, 0) * Global.speed
		if head:
			rotation = deg2rad(180)
	if right:
		Velocity = Vector2(1, 0) * Global.speed
		if head:
			rotation = deg2rad(0)
	
	collisioin_object = move_and_collide(Velocity * delta)
	Global.snek_pos = position

func get_coll_object():
	return collisioin_object

func handle_input():
	if Input.is_action_just_pressed("up") and not down:
		up = true
		down = false
		left = false
		right = false
	if Input.is_action_just_pressed("down") and not up:
		up = false
		down = true
		left = false
		right = false
	if Input.is_action_just_pressed("left") and not right:
		up = false
		down = false
		left = true
		right = false
	if Input.is_action_just_pressed("right") and not left:
		up = false
		down = false
		left = false
		right = true

func is_dir_up():
	return up

func is_dir_down():
	return down

func is_dir_left():
	return left

func is_dir_right():
	return right

func get_dims():
	var dim : Vector2 = Vector2()
	return dim
