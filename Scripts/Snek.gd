extends Node2D
signal end
signal food_eat

var viewport_size : Vector2
var head_dims : Vector2
onready var head = get_node("/root/SnekHead")
onready var body = get_node("/root/SnekBody")

var body_size : int
var h_swap : bool = false
var v_swap : bool = false

func _ready():
	viewport_size = get_viewport_rect().size
	$Snek_body.add_body()
	$Snek_body/Container.get_child(0).position = $Snek_body/Container.get_child(0).position + Vector2($Snek_body/Snek_head/KinematicBody2D.position.x - head_dims.x, $Snek_body/Snek_head/KinematicBody2D.position.y)
	head_dims = Vector2($Snek_body/Snek_head/KinematicBody2D/head.texture.get_width()*0.2 , $Snek_body/Snek_head/KinematicBody2D/head.texture.get_height()*0.2)
	body_size = $Snek_body/Container.get_child_count()

func _physics_process(delta):
	#handle_viewport_pos()
	handle_body_pos()
	

func _process(delta):
	pass

func handle_body_pos():
	
	if head.is_dir_up():
		$Snek_body/Container.get_child(0).position = $Snek_body/Container.get_child(0).position.linear_interpolate(Vector2($Snek_body/Snek_head/KinematicBody2D.position.x, $Snek_body/Snek_head/KinematicBody2D.position.y + head_dims.y), 0.2)
	
	if head.is_dir_down():
		$Snek_body/Container.get_child(0).position = $Snek_body/Container.get_child(0).position.linear_interpolate(Vector2($Snek_body/Snek_head/KinematicBody2D.position.x, $Snek_body/Snek_head/KinematicBody2D.position.y - head_dims.y), 0.2)
	
	if head.is_dir_left():
		$Snek_body/Container.get_child(0).position = $Snek_body/Container.get_child(0).position.linear_interpolate(Vector2($Snek_body/Snek_head/KinematicBody2D.position.x + head_dims.x, $Snek_body/Snek_head/KinematicBody2D.position.y), 0.2)
	
	if head.is_dir_right():
		$Snek_body/Container.get_child(0).position = $Snek_body/Container.get_child(0).position.linear_interpolate(Vector2($Snek_body/Snek_head/KinematicBody2D.position.x - head_dims.x, $Snek_body/Snek_head/KinematicBody2D.position.y), 0.2)


func handle_viewport_pos():
	if $Snek_body/Snek_head/KinematicBody2D.position.y > viewport_size.y:
		$Snek_body/Snek_head/KinematicBody2D.position = Vector2($Snek_body/Snek_head/KinematicBody2D.position.x, 0)
		v_swap = true
	if $Snek_body/Snek_head/KinematicBody2D.position.y < 0:
		$Snek_body/Snek_head/KinematicBody2D.position = Vector2($Snek_body/Snek_head/KinematicBody2D.position.x, viewport_size.y)
		v_swap = true
	if $Snek_body/Snek_head/KinematicBody2D.position.x > viewport_size.x:
		$Snek_body/Snek_head/KinematicBody2D.position = Vector2(0, $Snek_body/Snek_head/KinematicBody2D.position.y)
		h_swap = true
	if $Snek_body/Snek_head/KinematicBody2D.position.x < 0:
		$Snek_body/Snek_head/KinematicBody2D.position = Vector2(viewport_size.x, $Snek_body/Snek_head/KinematicBody2D.position.y)
		h_swap = true


func _on_Snek_head_bite():
	emit_signal("end")


func _on_Snek_head_hit_wall():
	emit_signal("end")


func _on_Snek_head_food_eat():
	emit_signal("food_eat")
