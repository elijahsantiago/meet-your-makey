extends TextureRect

enum Key_Identifier { C = 0, D = 1, E = 2, F = 3, G = 4, A = 5}

export(Key_Identifier) var key

var player
var is_pressed = false

func _ready():
	if AudioManager.instrument == "Drum":
		_on_TabContainer_tab_changed(0)

func _process(delta):
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
	
	player.volume_db = AudioManager.volume
	player.pitch_scale = AudioManager.pitch
	player.play()


func _stop_music():
	is_pressed = false
	player.stop()
	self.remove_child(player)




func _on_TabContainer_tab_changed(tab):
	print(str(tab, ":" , key))
	if(AudioManager.instrument == "Drum"):
		print(str(tab, ":" , key))
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
