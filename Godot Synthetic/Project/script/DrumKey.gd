extends TextureRect

enum Key_Identifier { C = 0, D = 1, E = 2, F = 3, G = 4, A = 5, B = 6, C5 = 7}

export(Key_Identifier) var key

var player
var is_pressed = false
var timer_t = null


func _process(delta):
	
	if timer_t != null and timer_t.time_left > .1:
		self.rect_scale.x -= (1.0/delta) * .0003
		self.rect_scale.y -= (1.0/delta) * .0003
	elif timer_t != null:
		timer_t = null
		self.remove_child(timer_t)
		self.rect_scale.x = 1
		self.rect_scale.y = 1
		
	
	if player != null and player.playing == true:
		player.pitch_scale = float(AudioManager.pitch)
		if(AudioManager.volume == 0):
			player.volume_db = -80
		else:
			player.volume_db = ((24 - (-60)) * (AudioManager.volume/100)) + (-40)
	
	#Move key if pressed, reset if release
	if(is_pressed):
		pass
	elif(!is_pressed):
		pass
		

func _play_music():
	is_pressed = true
	player = AudioStreamPlayer.new()
	self.add_child(player)
	
	timer_t = Timer.new()
	self.add_child(timer_t)
	timer_t.start(.5)
	self.rect_scale.x = 1
	self.rect_scale.y = 1
	
	match key:
		0:
			player.stream = AudioManager.drum_dictionary["C"]
		1:
			player.stream = AudioManager.drum_dictionary["D"]
		2:
			player.stream = AudioManager.drum_dictionary["E"]
		3:
			player.stream = AudioManager.drum_dictionary["F"]
		4:
			player.stream = AudioManager.drum_dictionary["G"]
		5:
			player.stream = AudioManager.drum_dictionary["A"]
		6:
			player.stream = AudioManager.drum_dictionary["B"]
		7:
			player.stream = AudioManager.drum_dictionary["C5"]
	
	player.volume_db = AudioManager.volume
	player.pitch_scale = AudioManager.pitch
	player.play()


func _stop_music():
	is_pressed = false
