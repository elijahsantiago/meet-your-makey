extends Node


#play(instrument, note, time_start, length)

var ode_to_joy = ["E","E","F","G","G","F","E","D","C","C","D","E","E","D","D",
  "E","E","F","G","G","F","E","D","C","C","D","E","D","C","C",
   "D","D","E","C","D","E","F","E","C","D","E","F","E","D","C","D",
  "E","E","F","G","G","F","E","D","C","C","D","E","D","C","C"]

# Called when the node enters the scene tree for the first time.
func play():
	
	
	AudioManager.play("Cello", "C", 0, .4)
	AudioManager.play("Cello", "C", .5, .4)
	AudioManager.play("Cello", "C", 1, .4)
	AudioManager.play("Cello", "C", 1.5, .4)
	AudioManager.play("Cello", "B", 3, 1)
	AudioManager.play("Cello", "B", 2.5, .4)
	AudioManager.play("Cello", "A", 3, .4)
	AudioManager.play("Cello", "E", 3.5, .4)
	
#	var i = 2
#	for note in ode_to_joy:
#		AudioManager.play("Cello", note, i, 1)
#		AudioManager.play("Drum", note, i, 1)
#		i+= .5
