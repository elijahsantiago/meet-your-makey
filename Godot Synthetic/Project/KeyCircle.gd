extends Sprite

var center
export(Vector2) var start_point
export(int, 40, 220, 2) var direction

# Called when the node enters the scene tree for the first time.
func _ready():
	center = get_parent().get_position()
	
	
	
	
	print(center)
	
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	start_point = _EndlineAngle(0,0,(1 * PI/3),direction) 
	self.position = start_point;
	
	pass

func _EndlineAngle(x, y, angle, length):

	return Vector2(x+cos(angle)*length, y-sin(angle)*length)
	pass


