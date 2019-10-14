extends Sprite

enum Key_Identifier { W = 1, A = 2, S = 3, D = 4, F = 5, G = 6}

export(Key_Identifier) var key
export(float, 0, 1, .01) var magnitude_incrument = .01
export(float, 0, 1, .01) var magnitude_percent = 1

var is_pressed = false
var magnitude_min = 40
var magnitude_max = 220

func _ready():
	self.position = _get_angle_position()
	print(self.position)

func _process(delta):
	#Update object position if button is pressed
	if(is_pressed):
		self.position = _get_angle_position()
	
	#Set object rotation to match parent rotation
	self.rotation = abs(get_parent().rotation)
	
	#Move key if pressed, reset if release
	if(is_pressed and magnitude_percent > 0):
		magnitude_percent -= magnitude_incrument
	elif(!is_pressed):
		magnitude_percent = 1;
		self.position = _get_angle_position()
		

#Convert input into postion in circle
func _get_angle_position():
	var center = Vector2(0,0)
	var radian = key * PI/3
	var magnitue_value = ((magnitude_max - magnitude_min) * magnitude_percent) + magnitude_min
	return Vector2(center.x+cos(radian) * magnitue_value, center.y-sin(radian) * magnitue_value)

func _check_valid(event):
	if event is InputEventKey:
		if event.scancode == KEY_W and key == 1:
			return true
		elif event.scancode == KEY_A and key == 2:
			return true
		elif event.scancode == KEY_S and key == 3:
			return true
		elif event.scancode == KEY_D and key == 4:
			return true
		elif event.scancode == KEY_F and key == 5:
			return true
		elif event.scancode == KEY_G and key == 6:
			return true
		else:
			return false

func _input(event):
	var audio = get_child(0);

	if _check_valid(event):
		if event.is_pressed() == true and not event.echo:
			is_pressed = true
			audio.play()
		elif event.is_pressed() == false:
			is_pressed = false
			audio.stop()
