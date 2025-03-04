extends TextureRect

enum Key_Identifier { C = 0, D = 1, E = 2, F = 3, G = 4, A = 5, B = 6, C5 = 7}

export(Key_Identifier) var key
var key_value

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
			player.volume_db = (((AudioManager.volume - 0) * (5 - (-20))) / (100 - 0)) + (-20)

func _play_music():
	is_pressed = true
	player = AudioStreamPlayer.new()
	self.add_child(player)
	
	timer_t = Timer.new()
	self.add_child(timer_t)
	timer_t.start(.5)
	self.rect_scale.x = 1
	self.rect_scale.y = 1
	
	key_value = Key_Identifier.keys()[key]
	
	player.stream = AudioManager.drum_dictionary[key_value]	
	player.volume_db = AudioManager.volume
	player.pitch_scale = AudioManager.pitch
	player.play()
	
	if AudioManager.is_recording == true:
		AudioManager.ref_scroll_item_container._spawn("Drum", key_value, AudioManager.elapsed_mili, .1)


func _stop_music():
	pass