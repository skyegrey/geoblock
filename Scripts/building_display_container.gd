class_name BuildingDisplayContainer extends Control

var displayed_buildings: int = 0
var horizontal_offset: int = 490
var vertical_offset: int = 80


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_building(building):
	var result_position = Vector2(5, 5)
	if not displayed_buildings % 2 == 0:
		result_position.x += horizontal_offset
	
	var row_count = floor(displayed_buildings / 2)
	result_position.y += row_count * vertical_offset
	
	building.position = result_position
	add_child(building)
	displayed_buildings += 1
	
