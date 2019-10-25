tool
extends Panel

export(String) var input_key setget input_key_set
export(int, 0, 5, 1) var note_selected setget note_selected_set

#Node Path
var path_label = "HBoxContainer/CenterContainer/Label"
var path_note = "HBoxContainer/MarginContainer/VBoxContainer/Note"

#Node Ref
onready var ref_label = get_node(path_label)
onready var ref_note = get_node(path_note)

var note

# Called when the node enters the scene tree for the first time.
func _ready():
	note = ref_note.selected
	AudioManager.key_input_dictionary[input_key] = note

func _on_Note_item_selected(ID):
	note = ref_note.get_item_text(ID)
	AudioManager.key_input_dictionary[input_key] = note

#Pre Ready Function
func input_key_set(value):
	input_key = value
	if has_node(path_label):
		get_node(path_label).text = value
func note_selected_set(value):
	note_selected = value
	if has_node(path_note):
		get_node(path_note).selected = value 


