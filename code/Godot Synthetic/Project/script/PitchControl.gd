extends HBoxContainer

#Node Path Ref
var path_pitch_shift_label = "MarginContainer/VBoxContainer/pitch_shift_label"
var path_pitch_shift_slider = "MarginContainer/VBoxContainer/pitch_shift_slider"
var path_pitch_label = "MarginContainer/VBoxContainer/pitch_label"
var path_pitch_slider = "MarginContainer/VBoxContainer/pitch_slider"

#Node Ref
onready var ref_pitch_shift_label = get_node(path_pitch_shift_label)
onready var ref_pitch_shift_slider = get_node(path_pitch_shift_slider)
onready var ref_pitch_label = get_node(path_pitch_label)
onready var ref_pitch_slider = get_node(path_pitch_slider)

export(int, 0, 2, .05) onready var pitch_shift_value = 0.25
export(int, 0, 2, .1) onready var pitch_value = 1



func _ready():
	ref_pitch_shift_label.text = str("Pitch Shift: ", ref_pitch_shift_slider.value)
	ref_pitch_label.text = str("Pitch: ", ref_pitch_slider.value)
	pitch_shift_value = ref_pitch_shift_slider.value
	pitch_value = ref_pitch_slider.value
	
	AudioManager.ref_pitch_control = self;
	AudioManager.pitch = pitch_value
	AudioManager.pitch_shift = pitch_shift_value


func _on_pitch_shift_slider_value_changed(value):
	AudioManager.pitch_shift = pitch_shift_value
	pitch_shift_value = value
	ref_pitch_shift_label.text = str("Pitch Shift: ", value)

func _on_pitch_slider_value_changed(value):
	AudioManager.pitch = pitch_value
	pitch_value = value
	ref_pitch_label.text = str("Pitch: ", value)




