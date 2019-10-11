extends Node2D

var sound : bool
var prev : String
var gui_pos : Vector2
var viewport_size
var score : int
var score_change : bool
var speed : int
var food_pos : Vector2
var snek_pos : Vector2
var spawn_size : Vector2
var start_spawn : Vector2

func _ready():
	randomize()
	viewport_size = get_viewport_rect().size
	spawn_size = Vector2(50 + (randi() % 500), 50 + (randi() % 800))
	start_spawn = Vector2(50 + (randi() % 10), 50 + (randi() % 20))
	gui_pos.x = -viewport_size.x / 2
	gui_pos.y = -viewport_size.y / 2
	sound = true
	score_change = false
	speed = 800

func _process(delta):
	pass
