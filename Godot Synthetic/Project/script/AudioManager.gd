extends Node

#Dictionary
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
var key_input_dictionary = {}

#Audio Node Ref
var ref_volume_control
var ref_pitch_control
var ref_circle

#Key ref
var ref_key_c
var ref_key_d
var ref_key_e
var ref_key_f
var ref_key_g
var ref_key_a

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
	instrument = "Cello"
	time_start = OS.get_unix_time()

func _process(delta):
	time_now = OS.get_unix_time()
	#print(ref_key_c.name)
	_process_time()

func _process_time():
	elapsed = time_now - time_start
	minutes = elapsed / 60
	seconds = elapsed % 60
	str_elapsed = "%02d : %02d" % [minutes, seconds]

func _input(event):
	if event is InputEventKey:
		match event.scancode:
			KEY_W:
				var key_ref = _get_key_ref("W")
				if event.is_pressed() == true and not event.echo:
					key_ref._play_music()
				elif event.is_pressed() == false and instrument != "Drum":
					key_ref._stop_music()
			KEY_A:
				var key_ref = _get_key_ref("A")
				if event.is_pressed() == true and not event.echo:
					key_ref._play_music()
				elif event.is_pressed() == false and instrument != "Drum":
					key_ref._stop_music()
			KEY_S:
				var key_ref = _get_key_ref("S")
				if event.is_pressed() == true and not event.echo:
					key_ref._play_music()
				elif event.is_pressed() == false and instrument != "Drum":
					key_ref._stop_music()
			KEY_D:
				var key_ref = _get_key_ref("D")
				if event.is_pressed() == true and not event.echo:
					key_ref._play_music()
				elif event.is_pressed() == false and instrument != "Drum":
					key_ref._stop_music()
			KEY_F:
				var key_ref = _get_key_ref("F")
				if event.is_pressed() == true and not event.echo:
					key_ref._play_music()
				elif event.is_pressed() == false and instrument != "Drum":
					key_ref._stop_music()
			KEY_G:
				var key_ref = _get_key_ref("G")
				if event.is_pressed() == true and not event.echo:
					key_ref._play_music()
				elif event.is_pressed() == false and instrument != "Drum":
					key_ref._stop_music()
			KEY_UP:
				if pitch < 2:
					pitch += pitch_shift
					ref_pitch_control.ref_pitch_slider.value = pitch
					
			KEY_DOWN:
				if pitch > 0:
					pitch -= pitch_shift
					ref_pitch_control.ref_pitch_slider.value = pitch


func _get_key_ref(value):
	if key_input_dictionary[value] == "C":
		return ref_key_c
	elif key_input_dictionary[value] == "D":
		return ref_key_d
	elif key_input_dictionary[value] == "E":
		return ref_key_e
	elif key_input_dictionary[value] == "F":
		return ref_key_f
	elif key_input_dictionary[value] == "G":
		return ref_key_g
	elif key_input_dictionary[value] == "A":
		return ref_key_a

func _play_audio(timestart, key, note):
	var t = Timer.new()
	t.set_wait_time(timestart)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load(str("res://Music/", key, note ,".wav"))
	player.play()
	pass