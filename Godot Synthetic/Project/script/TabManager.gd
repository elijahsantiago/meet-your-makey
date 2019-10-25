extends TabContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	AudioManager.instrument = get_child(current_tab).name


func _on_TabContainer_tab_changed(tab):
	AudioManager.instrument = get_child(tab).name
