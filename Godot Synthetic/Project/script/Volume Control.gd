tool
extends HBoxContainer

#Volume Texture
export(Texture) onready var volume0
export(Texture) onready var volume1
export(Texture) onready var volume2
export(Texture) onready var volume3

#Node Path Ref
var path_texture = "CenterContainer/TextureRect"
var path_label = "MarginContainer/VBoxContainer/Label"
var path_slider = "MarginContainer/VBoxContainer/HSlider"

#Node Path Ref
onready var ref_texture = get_node(path_texture)
onready var ref_label = get_node(path_label)
onready var ref_slider = get_node(path_slider)

# Audio Variable
export(int, 0, 100, 1) var volume_value setget volume_value_set


# Called when the node enters the scene tree for the first time.
func _ready():
	volume_value = ref_slider.value
	_set_texture(ref_slider.value)
	ref_label.text = str("Volume: ", ref_slider.value)
	AudioManager.volume = volume_value
	
func _on_HSlider_value_changed(value):
	AudioManager.volume = value
	if Engine.editor_hint:
		if has_node(path_label):
			volume_value = value
			get_node(path_label).text = str("Volume: ", value)
	
	if not Engine.editor_hint:
		volume_value = value
		_set_texture(value)
		ref_label.text = str("Volume: ", value)

func _set_texture(value):
	if(value == 0):
		ref_texture.texture = volume0
	elif(value <= 33):
		ref_texture.texture = volume1
	elif(value <= 66):
		ref_texture.texture = volume2
	elif(value <= 100):
		ref_texture.texture = volume3

func volume_value_set(value):
	if Engine.editor_hint:
		
		if has_node(path_slider):
			get_node(path_slider).value = value
		
		if has_node(path_texture):
			if(value == 0):
				get_node(path_texture).texture = volume0
			elif(value <= 33):
				get_node(path_texture).texture = volume1
			elif(value <= 66):
				get_node(path_texture).texture = volume2
			elif(value <= 100):
				get_node(path_texture).texture = volume3