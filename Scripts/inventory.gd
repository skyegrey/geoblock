class_name Inventory

var items = {}

func load_items():
	var items_config_path = "res://Data/Game/items.json"
	var items_config = JSON.parse_string(FileAccess.get_file_as_string(items_config_path))
	for item_id in items_config:
		var item_resource = Item.new()
		item_resource.id = item_id
		item_resource.name = items_config[item_id]["Name"]
		items[item_id] = item_resource

func add_item(item_id: String):
	items[item_id].amount_owned += 1

func check_can_consume(item_inputs: Array[ItemInput]):
	for item_input: ItemInput in item_inputs:
		if items[item_input.item_id].amount_owned < item_input.amount:
			return false
	return true

func consume(item_inputs: Array[ItemInput]):
	for item_input: ItemInput in item_inputs:
		items[item_input.item_id].amount_owned -= item_input.amount
