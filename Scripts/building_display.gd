class_name BuildingDisplay extends Control

var building: Building

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set building image
	
	# Set building label
	$BuildingLabel.text = str(building.name)
	
	# Set amount owned
	# $AmountOwnedLabel.text = str("[right][font_size=20]x[font_size=28]", building.amount_owned)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ProgressBar.value = building.progress_percent * 100
