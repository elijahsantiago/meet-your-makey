extends Node

#play(note, time_start, length)

var ode_to_joy = ["E","E","F","G","G","F","E","D","C","C","D","E","E","D","D",
                  "E","E","F","G","G","F","E","D","C","C","D","E","D","C","C",
                   "D","D","E","C","D","E","F","E","C","D","E","F","E","D","C","D",
                  "E","E","F","G","G","F","E","D","C","C","D","E","D","C","C"
                 ]

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	var i = 5
	for note in ode_to_joy:
		AudioManager.play("Cello", note, i, .9)
		i+= .5
	
func _back_beat():
	
	pass

