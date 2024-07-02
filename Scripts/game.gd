extends Node2D

# Config paths
var mine_config_path = "res://Data/Game/mines.json"
var furnaces_config_path = "res://Data/Game/furnaces.json"
var factory_config_path = "res://Data/Game/factories.json"

# Scene references
@onready var ui: UI = %UI

var mines: Array[Mine] = []

var furnaces: Array[Furnace] = []

var factories: Array[Factory] = []

@onready var inventory: Inventory = Inventory.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	_load_config()
	_load_save()
	_setup_ui()

func _load_config():
	inventory.load_items()
	mines.append_array(_load_building_resources(mine_config_path, Mine))
	furnaces.append_array(_load_building_resources(furnaces_config_path, Furnace, true))
	factories.append_array(_load_building_resources(factory_config_path, Factory, true))

func _load_building_resources(building_config_path, building_class, has_input=false):
	var building_resources = []
	var building_config = JSON.parse_string(
		FileAccess.get_file_as_string(building_config_path))
	for building_id in building_config:
		var building = building_class.new()
		building.id = building_id
		building.name = building_config[building_id]['Name']
		building.base_process_time =\
		 building_config[building_id]['BaseProcessTime']
		building.output.assign(
			building_config[building_id]['Output'])
		if has_input:
			var input = []
			for item_input in building_config[building_id]['Input']:
				var item_input_resource = ItemInput.new()
				item_input_resource.item_id = item_input['ItemID']
				item_input_resource.amount = item_input['Amount']
				input.append(item_input_resource)
			building.input.assign(input)
		building_resources.append(building)
	return building_resources

func _setup_ui():
	ui.create_mine_displays(mines)


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
			for item_id: String in mine_output:
				inventory.add_item(item_id)

func _process_furnaces(delta):
	for furnace in furnaces:
		var furnace_output = furnace.process(delta, inventory)
		if furnace_output:
			for item_id: String in furnace_output:
				inventory.add_item(item_id)

func _process_manufactories(delta):
	for factory in factories:
		var factory_output = factory.process(delta, inventory)
		if factory_output:
			for item in factory_output:
				inventory.add_item(item)

func _update_ui():
	ui.update_inventory(inventory)

func _get_item_resource_from_string(item_name):
	pass
