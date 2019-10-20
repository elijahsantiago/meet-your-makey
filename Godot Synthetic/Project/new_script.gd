extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var AudioManager

# Called when the node enters the scene tree for the first time.
func _ready():
	#Test out playing
	AudioManager.play("Note A", 5)
	AudioManager.play("Note B", 2)
	AudioManager.play("Note C", 3)
	AudioManager.play("Note D", 4)
	AudioManager.play("Note F", 6)
	AudioManager.play("Note G", 7)
		
	pass # Replace with function body.
	
func _back_beat():
	#Copy from ready once it sounds good
	AudioManager.play("Note A", 5)
	AudioManager.play("Note B", 2)
	AudioManager.play("Note C", 3)
	AudioManager.play("Note D", 4)
	AudioManager.play("Note F", 6)
	AudioManager.play("Note G", 7)
	


