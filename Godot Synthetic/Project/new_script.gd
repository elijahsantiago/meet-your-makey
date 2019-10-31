extends Node

#play(note, time_start, length)

# Called when the node enters the scene tree for the first time.
func _ready():
	remove_child(self)
	AudioManager.play("C", 2, 5)
	AudioManager.play("C", 2.5, 1)
	
func _back_beat():
	
	pass

