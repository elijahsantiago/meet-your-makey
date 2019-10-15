extends HBoxContainer


export(NodePath) onready var texture_ref = get_node(texture_ref)
export(NodePath) onready var label_ref = get_node(label_ref)
export(NodePath) onready var slider_ref = get_node(slider_ref)
export(NodePath) onready var audio_manager_ref = get_node(audio_manager_ref)

export(Texture) onready var volume0
export(Texture) onready var volume1
export(Texture) onready var volume2
export(Texture) onready var volume3

var volume

# Called when the node enters the scene tree for the first time.
func _ready():
	volume = slider_ref.value
	label_ref.text = str("Volume: ", slider_ref.value)
	texture_ref.texture = volume1
	pass # Replace with function body.

func _on_HSlider_value_changed(value):
	if(value == 0):
		texture_ref.texture = volume0
	elif(value <= 33):
		texture_ref.texture = volume1
	elif(value <= 66):
		texture_ref.texture = volume2
	elif(value <= 100):
		texture_ref.texture = volume3
	volume = slider_ref.value
	audio_manager_ref.volume = value
	label_ref.text = str("Volume: ", value)
	pass # Replace with function body.
