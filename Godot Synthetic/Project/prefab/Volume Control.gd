extends HBoxContainer


export(NodePath) onready var texture_ref = get_node(texture_ref)
export(NodePath) onready var label_ref = get_node(label_ref)
export(NodePath) onready var slider_ref = get_node(slider_ref)

export(Dictionary) onready var texture_mode = { "volume0" : Texture, "volume1" : Texture, 
"volume2" : Texture, 
"volume3" : Texture, }

export(Texture) onready var test

# Called when the node enters the scene tree for the first time.
func _ready():
	label_ref.text = str("Volume: ", slider_ref.value)
	var test2 = (texture_mode.get("volume0"))
	texture_ref.texture = test2
	#texture_ref.texture = test
	pass # Replace with function body.

func _on_HSlider_value_changed(value):
	if(value == 0):
		texture_ref.texture = texture_mode["volume0"]
	label_ref.text = str("Volume: ", value)
	pass # Replace with function body.
