class_name IngredientRequiredBuilding extends Building

@export var ingredients: Array[Ingredient]

func process(delta, inventory):
	if not is_active:
		if inventory.check_can_consume(ingredients):
				inventory.consume(ingredients)
				activate()

	# If active, process
	if is_active:
		var furnace_output = super(delta, inventory)
		
		# If there is output, reset furnace state & return it
		if furnace_output:
			deactivate()
			return furnace_output
