extends Node

#Music Dictionary
export(Dictionary) onready var drum_dictionary = {
	"C": load("res://Music/Drum/C.wav"),
	"D": load("res://Music/Drum/D.wav"),
	"E": load("res://Music/Drum/E.wav"),
	"F": load("res://Music/Drum/F.wav"),
	"G": load("res://Music/Drum/G.wav"),
	"A": load("res://Music/Drum/A.wav")}
export(Dictionary) onready var cello_dictionary = {
	"C": load("res://Music/Cello/C.wav"),
	"D": load("res://Music/Cello/D.wav"),
	"E": load("res://Music/Cello/E.wav"),
	"F": load("res://Music/Cello/F.wav"),
	"G": load("res://Music/Cello/G.wav"),
	"A": load("res://Music/Cello/A.wav")}

#Key Input and Reference
var key_input_dictionary = {
	"W"	: null, 
	"A" : null, 
	"S" : null, 
	"D" : null, 
	"F" : null, 
	"G" : null}
var ref_key = {
	"C"	: null, 
	"D" : null, 
	"E" : null, 
	"F" : null, 
	"G" : null, 
	"A" : null}

#Audio Node Ref
var ref_volume_control
var ref_pitch_control
var ref_circle

#Timer
var time_start = 0
var time_now = 0
var elapsed
var minutes
var seconds
var str_elapsed

#Audio Variable
var instrument
var volume
var pitch
var pitch_shift


func _ready():
	#Start Timer
	time_start = OS.get_unix_time()

func _process(delta):
	#Incrument Timer
	_process_time()

func _process_time():
	time_now = OS.get_unix_time()
	elapsed = time_now - time_start
	minutes = elapsed / 60
	seconds = elapsed % 60
	str_elapsed = "%02d : %02d" % [minutes, seconds]


func _input(event):
	#Play/Stop Keyref input
	if event is InputEventKey:
		var key_pressed = OS.get_scancode_string(event.scancode)
		var key_ref = _get_key_ref(key_pressed)
		if(key_ref != null):
			if event.is_pressed() == true and not event.echo:
				key_ref._play_music()
			elif event.is_pressed() == false:
				key_ref._stop_music()


func _get_key_ref(value):
	#Return key ref depending on input dictionary
	if(key_input_dictionary.has(value)):
		match key_input_dictionary[value]:
			"C":
				return ref_key["C"]
			"D":
				return ref_key["D"]
			"E":
				return ref_key["E"]
			"F":
				return ref_key["F"]
			"G":
				return ref_key["G"]
			"A":
				return ref_key["A"]
			_:
				return null

func play(note):
	var audio_player
	
	match note:
		"C":
			audio_player = ref_key["C"]
		"D":
			audio_player = ref_key["D"]
		"E":
			audio_player = ref_key["E"]
		"F":
			audio_player = ref_key["F"]
		"G":
			audio_player = ref_key["G"]
		"A":
			audio_player = ref_key["A"]	
	
	audio_player._play_music()
	
	yield(get_tree().create_timer(1.0), "timeout")
	
	audio_player._stop_music()