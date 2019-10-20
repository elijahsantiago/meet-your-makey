extends Panel

export(NodePath) onready var instrument_ref = get_node(instrument_ref)
export(NodePath) onready var note_ref = get_node(note_ref)
export(NodePath) onready var key_ref = get_node(key_ref)

var instrument
var note
var sound_file

# Called when the node enters the scene tree for the first time.
func _ready():
	instrument = instrument_ref.text
	note = note_ref.text
	
	var sound_file = "res://Music/" + instrument + note + ".wav"
	key_ref._set_sound_file(sound_file)

func _on_Instrument_item_selected(ID):
	instrument = instrument_ref.text
	note = note_ref.text
	sound_file = load(str("res://Music/", instrument, note, ".wav"))
	#key_ref._set_sound_file(sound_file)
	pass # Replace with function body.


func _on_Instrument_Key_item_selected(ID):
	instrument = instrument_ref.text
	note = note_ref.text
	sound_file = load(str("res://Music/", instrument, note, ".wav"))
	#key_ref._set_sound_file(sound_file)
	pass # Replace with function body.
