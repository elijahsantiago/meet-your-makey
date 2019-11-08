extends Node2D

var volume
var pitch


var instrument
var note
var time_start
var length

var audio_player
var note_dictionary
var is_playing

func play():
	audio_player = AudioStreamPlayer.new()
	self.add_child(audio_player)
	
	note_dictionary = {}
	match instrument:
		"Cello":
			note_dictionary = AudioManager.cello_dictionary
		"Drum":
			note_dictionary = AudioManager.drum_dictionary
	
	audio_player.stream = note_dictionary[note.to_upper()]
	
	
	yield(get_tree().create_timer(time_start - AudioManager.elapsed), "timeout")
	audio_player.play()
	is_playing = true
	yield(get_tree().create_timer(length), "timeout")
	stop()
	is_playing = false
	
	pass


func _process(delta):
	if(is_playing == true): 
		if(volume != 0):
			audio_player.volume_db = (((AudioManager.volume - 0) * (5 - (-20))) / (100 - 0)) + (-20)
		elif(volume == 0):
			audio_player.volume_db = -80
		audio_player.pitch_scale = AudioManager.pitch
	pass

func stop():
	is_playing = false
	self.queue_free()
	pass