extends Sprite

enum Key_Identifier { C = 0, D = 1, E = 2, F = 3, G = 4, A = 5, B = 6, C5 = 7}

export(Key_Identifier) var key
export(float, 0, 1, .01) var magnitude_incrument = .01
export(float, 0, 1, .01) var magnitude_percent = 1


var player
var is_pressed = false
var magnitude_min = 40
var magnitude_max = 220


func _ready():
	print(str(key , ":" , _get_angle_position()))
	self.position = _get_angle_position()

func _process(delta):
	if player != null and player.playing == true:
		player.pitch_scale = float(AudioManager.pitch)
		if(AudioManager.volume == 0):
			player.volume_db = -80
		else:
			player.volume_db = ((24 - (-60)) * (AudioManager.volume/100)) + (-40) 
	
	#Update object position if button is pressed
	if(is_pressed):
		self.position = _get_angle_position()
	
	#Set object rotation to match parent rotation
	self.rotation = get_parent().rotation
	
	#Move key if pressed, reset if release
	if(is_pressed and magnitude_percent > 0):
		magnitude_percent -= magnitude_incrument
	elif(!is_pressed):
		magnitude_percent = 1;
		self.position = _get_angle_position()
		

#Convert input into postion in circle
func _get_angle_position():
	var center = Vector2(0,0)
	var radian = key * PI/4
	var magnitue_value = ((magnitude_max - magnitude_min) * magnitude_percent) + magnitude_min
	return Vector2(center.x+cos(radian) * magnitue_value, center.y-sin(radian) * magnitue_value)

func _play_music():
	is_pressed = true
	player = AudioStreamPlayer.new()
	self.add_child(player)
	
	match key:
		0:
			player.stream = AudioManager.cello_dictionary["C"]
		1:
			player.stream = AudioManager.cello_dictionary["D"]
		2:
			player.stream = AudioManager.cello_dictionary["E"]
		3:
			player.stream = AudioManager.cello_dictionary["F"]
		4:
			player.stream = AudioManager.cello_dictionary["G"]
		5:
			player.stream = AudioManager.cello_dictionary["A"]
		6:
			player.stream = AudioManager.cello_dictionary["B"]
		7:
			player.stream = AudioManager.cello_dictionary["C5"]
			
	player.volume_db = AudioManager.volume
	player.pitch_scale = AudioManager.pitch
	player.play()


func _stop_music():
	is_pressed = false
	player.stop()
	self.remove_child(player)