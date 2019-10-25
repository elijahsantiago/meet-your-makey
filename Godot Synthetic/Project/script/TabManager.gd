extends TabContainer

export(NodePath) onready var ref_cello_c = get_node(ref_cello_c)
export(NodePath) onready var ref_cello_d = get_node(ref_cello_d)
export(NodePath) onready var ref_cello_e = get_node(ref_cello_e)
export(NodePath) onready var ref_cello_f = get_node(ref_cello_f)
export(NodePath) onready var ref_cello_g = get_node(ref_cello_g)
export(NodePath) onready var ref_cello_a = get_node(ref_cello_a)

export(NodePath) onready var ref_drum_c = get_node(ref_drum_c)
export(NodePath) onready var ref_drum_d = get_node(ref_drum_d)
export(NodePath) onready var ref_drum_e = get_node(ref_drum_e)
export(NodePath) onready var ref_drum_f = get_node(ref_drum_f)
export(NodePath) onready var ref_drum_g = get_node(ref_drum_g)
export(NodePath) onready var ref_drum_a = get_node(ref_drum_a)


# Called when the node enters the scene tree for the first time.
func _ready():
	AudioManager.instrument = get_child(current_tab).name
	if AudioManager.instrument == "Cello":
		AudioManager.ref_key_c = ref_cello_c
		AudioManager.ref_key_d = ref_cello_d
		AudioManager.ref_key_e = ref_cello_e
		AudioManager.ref_key_f = ref_cello_f
		AudioManager.ref_key_g = ref_cello_g
		AudioManager.ref_key_a = ref_cello_a
	elif AudioManager.instrument == "Drum":
		AudioManager.ref_key_c = ref_drum_c
		AudioManager.ref_key_d = ref_drum_d
		AudioManager.ref_key_e = ref_drum_e
		AudioManager.ref_key_f = ref_drum_f
		AudioManager.ref_key_g = ref_drum_g
		AudioManager.ref_key_a = ref_drum_a


func _on_TabContainer_tab_changed(tab):
	AudioManager.instrument = get_child(tab).name
	if AudioManager.instrument == "Cello":
		AudioManager.ref_key_c = ref_cello_c
		AudioManager.ref_key_d = ref_cello_d
		AudioManager.ref_key_e = ref_cello_e
		AudioManager.ref_key_f = ref_cello_f
		AudioManager.ref_key_g = ref_cello_g
		AudioManager.ref_key_a = ref_cello_a
	elif AudioManager.instrument == "Drum":
		AudioManager.ref_key_c = ref_drum_c
		AudioManager.ref_key_d = ref_drum_d
		AudioManager.ref_key_e = ref_drum_e
		AudioManager.ref_key_f = ref_drum_f
		AudioManager.ref_key_g = ref_drum_g
		AudioManager.ref_key_a = ref_drum_a

