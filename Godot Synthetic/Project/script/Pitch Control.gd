extends HBoxContainer

export(NodePath) onready var pitch_shift_label_ref = get_node(pitch_shift_label_ref)
export(NodePath) onready var pitch_shift_slider_ref = get_node(pitch_shift_slider_ref)
export(NodePath) onready var pitch_label_ref = get_node(pitch_label_ref)
export(NodePath) onready var pitch_slider_ref = get_node(pitch_slider_ref)


var pitch
var pitch_shift

# Called when the node enters the scene tree for the first time.
func _ready():
	pitch_shift_label_ref.text = str("Pitch Shift: ", pitch_shift_slider_ref.value)
	pitch_label_ref.text = str("Pitch: ", pitch_slider_ref.value)
	pitch_shift = pitch_shift_slider_ref.value
	pitch = pitch_slider_ref.value
	pass # Replace with function body.



func _on_pitch_shift_slider_value_changed(value):
	pitch_shift_label_ref.text = str("Pitch Shift: ", value)
	pitch_shift = value
	audio_manager_ref.pitch_shift = value
	pass


func _on_pitch_slider_value_changed(value):
	pitch_label_ref.text = str("Pitch: ", value)
	pitch = value
	audio_manager_ref.pitch = value
	pass
