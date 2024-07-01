extends Node2D

# Scene references
@onready var ui: UI = %UI

var mines: Array[Mine] = [
	preload("res://Resources/Instances/Buildings/Mines/CopperMine.tres")
]

var furnaces: Array[Furnace] = [
	preload("res://Resources/Instances/Buildings/Furnaces/CopperFurnace.tres")
]

var manufactories: Array[Building] = [
	preload("res://Resources/Instances/Buildings/Manufactory/BasicCableFactory.tres")
]

var inventory: Inventory = Inventory.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	_load_save()

func _load_save():
	for mine in mines:
		mine.activate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_process_mines(delta)
	_process_furnaces(delta)
	_process_manufactories(delta)
	_update_ui()

# Progress forward each mine
func _process_mines(delta):
	for mine in mines:
		var mine_output = mine.process(delta, inventory)
		if mine_output:
			for item: Item in mine_output:
				inventory.add_item(item)

func _process_furnaces(delta):
	for furnace in furnaces:
		var furnace_output = furnace.process(delta, inventory)
		if furnace_output:
			for item: Item in furnace_output:
				inventory.add_item(item)

func _process_manufactories(delta):
	for manufactory in manufactories:
		var manufactory_output = manufactory.process(delta, inventory)
		if manufactory_output:
			for item in manufactory_output:
				inventory.add_item(item)

func _update_ui():
	ui.update_mines(mines)
	ui.update_furnaces(furnaces)
	ui.update_manufactories(manufactories)
	ui.update_inventory(inventory)

