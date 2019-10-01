extends Sprite

export(int, 1, 6, 1) var position_value
export(int, 40, 220, 2) var magnitude
var start_point
var isPressed = false

func _ready():
	pass


func _process(delta):
	start_point = _EndlineAngle(Vector2(0,0), (position_value * PI/3), magnitude) 
	self.position = start_point
	self.rotation = abs(get_parent().rotation)
	
	if(isPressed and magnitude > 40):
		magnitude -= 1
	elif(!isPressed):
		magnitude = 220;

func _EndlineAngle(vector, angle, length):
	return Vector2(vector.x+cos(angle)*length, vector.y-sin(angle)*length)


