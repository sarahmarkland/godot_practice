extends Node2D

# Grid Variables
@export var width: int
@export var height: int
@export var x_start: int
@export var y_start: int
@export var offset: int

var possible_pieces = [
	preload("res://Scenes/yellow_piece.tscn"),
	preload("res://Scenes/blue_piece.tscn"),
	preload("res://Scenes/pink_piece.tscn"),
	preload("res://Scenes/orange_piece.tscn"),
	preload("res://Scenes/green_piece.tscn"),
	preload("res://Scenes/light_green_piece.tscn")
]

var all_pieces = []

# Called when the node enters the scene tree for the first time.
func _ready():
	all_pieces = make_2d_array()
	spawn_pieces()

func make_2d_array():
	var array = []
	for i in width:
		array.append([])
		for j in height:
			array[i].append(null)
	return array

func spawn_pieces():
	for i in width:
		for j in height:
			#choose a random number and store it
			var rand = randi_range(0, possible_pieces.size()-1)
			#instance that piece from the array
			var piece = possible_pieces[rand].instantiate()
			add_child(piece)
			piece.position = grid_to_pixel(i, j)

func grid_to_pixel(column, row):
	var new_x = x_start + offset * column
	var new_y = y_start + -offset * row
	return Vector2(new_x, new_y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
