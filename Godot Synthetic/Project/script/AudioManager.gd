extends Node

#Dictionary
export(Dictionary) onready var drum_dictionary = {
	"C": AudioStreamSample,"D": AudioStreamSample,"E": AudioStreamSample,"F": AudioStreamSample,"G": AudioStreamSample,"A": AudioStreamSample}
export(Dictionary) onready var cello_dictionary = {
	"C": load("res://Music/CelloA.wav"),"D": AudioStreamSample,"E": AudioStreamSample,"F": AudioStreamSample,"G": AudioStreamSample,"A": AudioStreamSample}
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
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	#var note = key_input_dictionary[_get_key_ref("W")]
	print(cello_dictionary["C"])
	player.stream = cello_dictionary["C"]
	player.volume_db = 50
	player.play()
	
	#Start Timer
	time_start = OS.get_unix_time()

func _process(delta):
	time_now = OS.get_unix_time()
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
				if event.is_pressed() == true and not event.echo:
					_get_key_ref("W").is_pressed = true
				elif event.is_pressed() == false:
					_get_key_ref("W").is_pressed = false
			KEY_A:
				if event.is_pressed() == true and not event.echo:
					_get_key_ref("A").is_pressed = true
				elif event.is_pressed() == false:
					_get_key_ref("A").is_pressed = false
			KEY_S:
				if event.is_pressed() == true and not event.echo:
					_get_key_ref("S").is_pressed = true
				elif event.is_pressed() == false:
					_get_key_ref("S").is_pressed = false
			KEY_D:
				if event.is_pressed() == true and not event.echo:
					_get_key_ref("D").is_pressed = true
				elif event.is_pressed() == false:
					_get_key_ref("D").is_pressed = false
			KEY_F:
				if event.is_pressed() == true and not event.echo:
					_get_key_ref("F").is_pressed = true
				elif event.is_pressed() == false:
					_get_key_ref("F").is_pressed = false
			KEY_G:
				if event.is_pressed() == true and not event.echo:
					_get_key_ref("G").is_pressed = true
				elif event.is_pressed() == false:
					_get_key_ref("G").is_pressed = false
			


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