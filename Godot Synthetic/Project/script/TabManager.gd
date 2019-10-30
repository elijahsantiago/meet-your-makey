extends TabContainer

export(Dictionary) onready var ref_cello_key
export(Dictionary) onready var ref_drum_key

# Called when the node enters the scene tree for the first time.
func _ready():
	AudioManager.instrument = get_child(current_tab).name
	_set_ref_key(AudioManager.instrument)

func _on_TabContainer_tab_changed(tab):
	AudioManager.instrument = get_child(tab).name
	_set_ref_key(AudioManager.instrument)

func _set_ref_key(instrument):
	if AudioManager.instrument == "Cello":
		AudioManager.ref_key["C"] = get_node(ref_cello_key["C"])
		AudioManager.ref_key["D"] = get_node(ref_cello_key["D"])
		AudioManager.ref_key["E"] = get_node(ref_cello_key["E"])
		AudioManager.ref_key["F"] = get_node(ref_cello_key["F"])
		AudioManager.ref_key["G"] = get_node(ref_cello_key["G"])
		AudioManager.ref_key["A"] = get_node(ref_cello_key["A"])
	elif AudioManager.instrument == "Drum":
		AudioManager.ref_key["C"] = get_node(ref_drum_key["C"])
		AudioManager.ref_key["D"] = get_node(ref_drum_key["D"])
		AudioManager.ref_key["E"] = get_node(ref_drum_key["E"])
		AudioManager.ref_key["F"] = get_node(ref_drum_key["F"])
		AudioManager.ref_key["G"] = get_node(ref_drum_key["G"])
		AudioManager.ref_key["A"] = get_node(ref_drum_key["A"])
