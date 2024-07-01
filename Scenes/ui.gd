class_name UI extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_mines(mines):
	var display_text = "[font_size=30]"
	for mine: Mine in mines:
		var output_string = "{mine_name}: {progress}% \n"
		display_text += output_string.format({
			"mine_name": mine.name,
			"progress": "%0.1f" % (mine.progress_percent * 100)
		})
	
	$MineDisplay.text = display_text

func update_furnaces(furnaces):
	var display_text = "[font_size=30]"
	for furnace: Furnace in furnaces:
		var output_string = "{furnace_name}: {progress}% \n"
		display_text += output_string.format({
			"furnace_name": furnace.name,
			"progress": "%0.1f" % (furnace.progress_percent * 100)
		})
	
	$FurnaceDisplay.text = display_text

func update_manufactories(manufactories):
	var display_text = "[font_size=30]"
	for manufactory: Manufactory in manufactories:
		var output_string = "{manufactory_name}: {progress}% \n"
		display_text += output_string.format({
			"manufactory_name": manufactory.name,
			"progress": "%0.1f" % (manufactory.progress_percent * 100)
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


