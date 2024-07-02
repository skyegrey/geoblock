class_name NavigationMenu extends Control

var active_menu_button: Button
var active_menu_display

# Called when the node enters the scene tree for the first time.
func _ready():
	$Mines.pressed.connect(_change_active_menu.bind($Mines, %MinesDisplay))
	$Furnaces.pressed.connect(_change_active_menu.bind($Furnaces, %FurnaceDisplay))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _change_active_menu(button, display):
	if active_menu_button:
		active_menu_button.get_node("Panel").self_modulate = Color("7077A1")
		active_menu_display.visible = false

	button.get_node("Panel").self_modulate = Color("F6B17A")
	active_menu_button = button
	display.visible = true
	active_menu_display = display
