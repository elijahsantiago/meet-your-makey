extends Sprite

enum Key_Identifier { C = 0, D = 1, E = 2, F = 3, G = 4, A = 5}

export(Key_Identifier) var key
export(float, 0, 1, .01) var magnitude_incrument = .01
export(float, 0, 1, .01) var magnitude_percent = 1

var player
var is_pressed = false
var magnitude_min = 40
var magnitude_max = 220

func _ready():
	if(key == 0):
		AudioManager.ref_key_c = self
	elif(key == 1):
		AudioManager.ref_key_d = self
	elif(key == 2):
		AudioManager.ref_key_e = self
	elif(key == 3):
		AudioManager.ref_key_f = self
	elif(key == 4):
		AudioManager.ref_key_g = self
	elif(key == 5):
		AudioManager.ref_key_a = self
	
	self.position = _get_angle_position()

func _process(delta):
	#if(get_parent().volume_control_ref.volume == 0):
	#	audio.volume_db = -80
	#else:
	#	audio.volume_db = ((24 - (-40)) * (get_parent().volume_control_ref.volume/100)) + (-40) 
	#audio.pitch_scale = get_parent().pitch_control_ref.pitch
	
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
	var radian = key * PI/3
	var magnitue_value = ((magnitude_max - magnitude_min) * magnitude_percent) + magnitude_min
	return Vector2(center.x+cos(radian) * magnitue_value, center.y-sin(radian) * magnitue_value)

func _play_music(sound, volume, pitch):
	is_pressed = true
	player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = sound
	player.volume_db = volume
	player.pitch_scale = pitch
	player.play()
	
func _stop_music():
	is_pressed = false
	player.stop()
	self.remove_child(player)