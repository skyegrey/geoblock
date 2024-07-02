class_name UI extends Control

# Prefab references
var building_display_scene = preload("res://Scenes/building_display.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_mine_displays(mines):
	var mines_display = %MinesDisplay
	for mine: Mine in mines:
		var building_display = building_display_scene.instantiate()
		building_display.building = mine
		mines_display.add_building(building_display)

func update_furnaces(furnaces):
	var display_text = "[font_size=30]"
	for furnace: Furnace in furnaces:
		var output_string = "{furnace_name}: {progress}% \n"
		display_text += output_string.format({
			"furnace_name": furnace.name,
			"progress": "%0.1f" % (furnace.progress_percent * 100)
		})
	
	$FurnaceDisplay.text = display_text

func update_factories(factories):
	var display_text = "[font_size=30]"
	for factory: Factory in factories:
		var output_string = "{factory_name}: {progress}% \n"
		display_text += output_string.format({
			"factory_name": factory.name,
			"progress": "%0.1f" % (factory.progress_percent * 100)
		})
	
	$ManufactoryDisplay.text = display_text

func update_inventory(inventory):
	var display_text = "[font_size=30]"
	for item_id in inventory.items:
		var item: Item = inventory.items[item_id]
		var output_string = "{item_name}: {amount_owned} \n"
		display_text += output_string.format({
			"item_name": item.name,
			"amount_owned": item.amount_owned
		})
	
	$InventoryDisplay.text = display_text


