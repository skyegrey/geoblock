class_name Inventory

var items = {
	"CopperOre": preload("res://Resources/Instances/Items/Ores/CopperOre.tres"),
	"CopperBar": preload("res://Resources/Instances/Items/Bars/CopperBar.tres"),
	"BasicCable": preload("res://Resources/Instances/Items/Parts/BasicCable.tres")
}

func add_item(item: Item):
	items[item.id].amount_owned += 1

func check_can_consume(ingredients: Array[Ingredient]):
	for ingredient: Ingredient in ingredients:
		if items[ingredient.item.id].amount_owned < ingredient.amount:
			return false
	return true

func consume(ingredients: Array[Ingredient]):
	for ingredient: Ingredient in ingredients:
		items[ingredient.item.id].amount_owned -= ingredient.amount
