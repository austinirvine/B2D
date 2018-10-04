extends StaticBody2D
#extends InputEventMouse

var type_count

func _ready():
	type_count = 0
	pass

func _process(delta):
	if InputEventMouse.InputEventMouseButton.get_button_index() == 0 :
		#TODO: do stuff
		pass
	pass