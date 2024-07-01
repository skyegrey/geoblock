class_name Building extends Resource

@export var id: String
@export var name: String
@export var amount_owned: int
@export var base_process_time: float
var remaining_process_time: float
@export var output: Array[Item]
var progress_percent: float
var is_active: bool = false

func activate():
	is_active = true
	remaining_process_time = base_process_time

func deactivate():
	is_active = false
	progress_percent = 0

func process(delta, inventory):
	remaining_process_time -= delta
	progress_percent = (base_process_time - remaining_process_time) / base_process_time
	if remaining_process_time <= 0:
		remaining_process_time = base_process_time
		return output

