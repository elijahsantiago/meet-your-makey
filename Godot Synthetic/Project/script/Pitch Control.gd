tool
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

export(int, 0, 2, .05) var pitch_shift_value setget pitch_shift_value_set
export(int, 0, 2, .1) var pitch_value setget pitch_value_set



func _ready():
	
	ref_pitch_shift_label.text = str("Pitch Shift: ", ref_pitch_shift_slider.value)
	ref_pitch_label.text = str("Pitch: ", ref_pitch_slider.value)
	pitch_shift_value = ref_pitch_shift_slider.value
	pitch_value = ref_pitch_slider.value
	
	AudioManager.pitch = pitch_value
	AudioManager.pitch_shift = pitch_shift_value

func pitch_shift_value_set(value):
	if Engine.editor_hint:
		if has_node(path_pitch_shift_slider):
			pitch_shift_value = value
			get_node(path_pitch_shift_slider).value = value 

func _on_pitch_shift_slider_value_changed(value):
	AudioManager.pitch_shift = pitch_shift_value
	if Engine.editor_hint:
		if has_node(path_pitch_shift_label):
			pitch_shift_value = value
			get_node(path_pitch_shift_label).text = str("Pitch Shift: ", value)
	
	if not Engine.editor_hint:
		pitch_shift_value = value
		ref_pitch_shift_label.text = str("Pitch Shift: ", value)

func pitch_value_set(value):
	if Engine.editor_hint:
		pitch_value = value
		if has_node(path_pitch_slider):
			get_node(path_pitch_slider).value = value 

func _on_pitch_slider_value_changed(value):
	AudioManager.pitch = pitch_value
	if Engine.editor_hint:
		if has_node(path_pitch_label):
			pitch_value = value
			get_node(path_pitch_label).text = str("Pitch: ", value)
	
	if not Engine.editor_hint:
		pitch_value = value
		ref_pitch_label.text = str("Pitch: ", value)




