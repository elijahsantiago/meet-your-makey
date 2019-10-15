extends Node2D

export(NodePath) onready var pitch_control_ref  = get_node(pitch_control_ref)
export(NodePath) onready var volume_control_ref  = get_node(volume_control_ref)


export(int, -60, 60, 1) var rotation_range

var volume
var pitch
var pitch_shift

func _ready():
	volume = volume_control_ref.volume
	pitch = pitch_control_ref.pitch
	pitch_shift = pitch_control_ref.pitch_shift

func _process(delta):
	self.rotation_degrees = (((pitch - 0) * (60 - (-60))) / (2 - 0)) + (-60)

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