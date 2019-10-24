extends Node

export(NodePath) onready var audio_manager  = get_node(audio_manager)


# Called when the node enters the scene tree for the first time.
func _ready():
	audio_manager._play_audio(6, "Cello", "A")
	
	
	
	pass # Replace with function body.
	
func _back_beat():
	
	pass


