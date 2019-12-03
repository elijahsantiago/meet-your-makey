extends Panel

#Node Path
var path_label = "HBoxContainer/CenterContainer/Label"
var path_note = "HBoxContainer/MarginContainer/VBoxContainer/Note"

#Node Ref
onready var ref_label = get_node(path_label)
onready var ref_note = get_node(path_note)

var note
var key

func _ready():
	note = ref_note.text
	key = ref_label.text
	AudioManager.key_input_dictionary[key] = note

func _on_Note_item_selected(ID):
	note = ref_note.text
	AudioManager.key_input_dictionary[key] = note

