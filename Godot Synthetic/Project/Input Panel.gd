extends Panel

onready var instrument_node = get_node("HBoxContainer/MarginContainer/VBoxContainer/OptionButton")
onready var note_node = get_node("HBoxContainer/MarginContainer/VBoxContainer/OptionButton2")

var instrument
var note
var soundFile

# Called when the node enters the scene tree for the first time.
func _ready():
	instrument_node.connect("item_selected", self, "_set_value")
	note_node.connect("item_selected", self, "_set_value")
	pass
	
func _set_value(param):
	instrument = instrument_node.text
	note = note_node.text
	soundFile = instrument + note + ".wav"
