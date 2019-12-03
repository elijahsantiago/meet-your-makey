extends Node

#Music Dictionary
export(Dictionary) onready var drum_dictionary = {
	"C": load("res://Music/Drum/C.wav"),
	"D": load("res://Music/Drum/D.wav"),
	"E": load("res://Music/Drum/E.wav"),
	"F": load("res://Music/Drum/F.wav"),
	"G": load("res://Music/Drum/G.wav"),
	"A": load("res://Music/Drum/A.wav"),
	"B": load("res://Music/Drum/B.wav"),
	"C5": load("res://Music/Drum/C5.wav")}
export(Dictionary) onready var cello_dictionary = {
	"C": load("res://Music/Cello/C.wav"),
	"D": load("res://Music/Cello/D.wav"),
	"E": load("res://Music/Cello/E.wav"),
	"F": load("res://Music/Cello/F.wav"),
	"G": load("res://Music/Cello/G.wav"),
	"A": load("res://Music/Cello/A.wav"),
	"B": load("res://Music/Cello/B.wav"),
	"C5": load("res://Music/Cello/C5.wav")}

#Key Input and Reference
var key_input_dictionary = {
	"W"	: null, 
	"A" : null, 
	"S" : null, 
	"D" : null, 
	"F" : null, 
	"G" : null,
	"Left": null,
	"Right": null}
var ref_key = {
	"C"	: null, 
	"D" : null, 
	"E" : null, 
	"F" : null, 
	"G" : null, 
	"A" : null,
	"B": null,
	"C5": null}

#Audio Node Ref
var ref_volume_control
var ref_pitch_control
var ref_circle

#Timer
var time_start = 0
var time_now = 0
var elapsed
var time_start_mili = 0
var time_now_mili = 0
var elapsed_mili
var minutes
var seconds
var str_elapsed

#Audio Variable
var instrument
var volume
var pitch
var pitch_shift

#Record Variable
var is_recording
var ref_scroll_item_container
var is_playing

#Instance
var scene = load("res://prefab/AudioPlayer.tscn")

func _ready():
	#Start Timer
	time_start = OS.get_unix_time()
	time_now = OS.get_unix_time()
	elapsed = time_now - time_start
	
	time_start_mili = OS.get_ticks_msec()
	time_now_mili = OS.get_ticks_msec()
	elapsed_mili = (time_now_mili - time_start_mili) * .001
	
	minutes = elapsed / 60
	seconds = elapsed % 60
	str_elapsed = "%02d : %02d" % [minutes, seconds]

func _process(delta):
	if(is_recording == true or is_playing == true):
		_process_time()

func _process_time():
	time_now = OS.get_unix_time()
	elapsed = time_now - time_start
	
	time_now_mili = OS.get_ticks_msec()
	elapsed_mili = (time_now_mili - time_start_mili) * .001
	
	minutes = elapsed / 60
	seconds = elapsed % 60
	str_elapsed = "%02d : %02d" % [minutes, seconds]

func _reset_time():
	time_start = OS.get_unix_time()
	time_now = OS.get_unix_time()
	elapsed = time_now - time_start
	
	time_start_mili = OS.get_ticks_msec()
	time_now_mili = OS.get_ticks_msec()
	elapsed_mili = (time_now_mili - time_start_mili) * .001
	
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
		if event.scancode == KEY_UP and event.is_pressed() == true:
			if pitch < 2:
				pitch += pitch_shift
				ref_pitch_control.ref_pitch_slider.value = pitch	
		if event.scancode == KEY_DOWN and event.is_pressed() == true:
			if pitch > 0:
				pitch -= pitch_shift
				ref_pitch_control.ref_pitch_slider.value = pitch


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
			"B":
				return ref_key["B"]
			"C5":
				return ref_key["C5"]
			_:
				return null

func play(instruments, notes, time_starts, lengths):
	
	var node = scene.instance()
	node.instrument = instruments
	node.note = notes
	node.time_start = time_starts
	node.length = lengths
	add_child(node)
	node.play()	
	

func stop():
	for child in self.get_children():
		child.stop()
	
