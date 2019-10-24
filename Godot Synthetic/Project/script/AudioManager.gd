extends Node2D

export(NodePath) onready var pitch_control_ref  = get_node(pitch_control_ref)
export(NodePath) onready var volume_control_ref  = get_node(volume_control_ref)

export(int, -60, 60, 1) var rotation_range

var volume
var pitch
var pitch_shift

export(NodePath) onready var timer_ref  = get_node(timer_ref)


var time_start = 0
var time_now = 0


func _ready():
	time_start = OS.get_unix_time()
	volume = volume_control_ref.volume
	pitch = pitch_control_ref.pitch
	pitch_shift = pitch_control_ref.pitch_shift

func _process(delta):
	time_now = OS.get_unix_time()
	var elapsed = time_now - time_start
	var minutes = elapsed / 60
	var seconds = elapsed % 60
	var str_elapsed = "%02d : %02d" % [minutes, seconds]
	print("elapsed : ", str_elapsed)
	self.rotation_degrees = (((pitch - 0) * (60 - (-60))) / (2 - 0)) + (-60)
	
func wait():
	pass

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



func _input(event):
	if event is InputEventKey:
		if event.is_pressed() == true and event.scancode == KEY_UP:
			if pitch < 2:
				rotation_range += 1;
				pitch += pitch_shift
			
		if event.is_pressed() == true and event.scancode == KEY_DOWN:
			if pitch > 0:
				rotation_range -= 1;
				pitch -= pitch_shift
			
		pitch_control_ref.pitch_slider_ref.value = pitch
		pitch_control_ref.pitch_label_ref.text = str("Pitch: ", pitch)