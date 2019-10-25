extends Node

#Dictionary
export(Dictionary) onready var drum_dictionary = {
	"C": AudioStream,"D": AudioStream,"E": AudioStream,"F": AudioStream,"G": AudioStream,"A": AudioStream}
export(Dictionary) onready var cello_dictionary = {
	"C": AudioStream,"D": AudioStream,"E": AudioStream,"F": AudioStream,"G": AudioStream,"A": AudioStream}
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
	time_start = OS.get_unix_time()

func _process(delta):
	time_now = OS.get_unix_time()
	_process_time()

func _process_time():
	elapsed = time_now - time_start
	minutes = elapsed / 60
	seconds = elapsed % 60
	str_elapsed = "%02d : %02d" % [minutes, seconds]

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