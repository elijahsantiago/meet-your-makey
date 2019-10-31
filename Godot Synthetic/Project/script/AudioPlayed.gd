extends MarginContainer

var id
var instrument
var note
var start_time
var length
var output

func _set_text(instrument, note, start_time, length):
	self.id = get_parent().get_child_count()
	self.instrument = instrument
	self.note = instrument
	self.start_time = instrument
	self.length = instrument
	self.output = str(
	"#", id, "\n", 
	"Instrument: ", instrument, "\n",
	"Note: ", note, "\n",
	"Start At: ", start_time, "\n",
	"Length: ", length)
	
	get_child(0).text = (output)