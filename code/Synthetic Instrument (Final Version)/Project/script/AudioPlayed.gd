extends MarginContainer

var id
var instrument
var note
var start_time
var length
var output

func _set_text(instrument, note, start_time, length):
	self.id = get_parent().get_child_count()
	start_time = stepify(start_time,0.1)
	length = stepify(length,0.1)
	self.output = str("#", id, "\n",
	"AudioManager.play(\"", instrument, "\"" , ", \"" , note , "\", " , start_time, ", ", length, ")")
#	self.output = str(
#	"#", id, "\n", 
#	"Instrument: ", instrument, "\n",
#	"Note: ", note, "\n",
#	"Start At: ", start_time, " sec\n",
#	"Length: ", length)
	#, "\n", "AudioManager.play(\"", instrument, "\"" , ", \"" , note , "\", " , start_time, ", ", length
	
	get_child(0).text = (output)