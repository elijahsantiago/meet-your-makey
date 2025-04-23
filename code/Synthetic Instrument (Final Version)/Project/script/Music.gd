extends Node

var songs = [{
        "title": "Happy Birthday",
        "notes": [
			#Happy Birthday to YOU!
            {"note": "C", "length": 0.2}, {"note": "C", "length": 0.2},
            {"note": "D", "length": 0.25}, {"note": "C", "length": 0.25},
            {"note": "F", "length": 0.25}, {"note": "E", "length": 0.5},
			
			#Happy Birthday to YOU!
            {"note": "C", "length": 0.2}, {"note": "C", "length": 0.2},
            {"note": "D", "length": 0.25}, {"note": "C", "length": 0.25},
            {"note": "G", "length": 0.25}, {"note": "F", "length": 0.5},
			
			#Happy Birthday dear ...!
            {"note": "C", "length": 0.2}, {"note": "C", "length": 0.2},
            {"note": "C5", "length": 0.25}, {"note": "A", "length": 0.25},
            {"note": "F", "length": 0.25}, {"note": "E", "length": 0.25},
            {"note": "D", "length": 0.9},
			
			#Happy Birthday to you!
            {"note": "B", "length": 0.2}, {"note": "B", "length": 0.2},
            {"note": "A", "length": 0.50}, {"note": "F", "length": 0.25},
            {"note": "G", "length": 0.25}, {"note": "F", "length": 0.9}
        ]
    },
    {
        "title": "Custom Song Space",
        "notes": [
            {"note": "E", "length": 0.25}, {"note": "C5", "length": 0.25}, {"note": "E", "length": 0.25},
            {"note": "C5", "length": 0.25}, {"note": "E", "length": 0.25}, {"note": "B", "length": 0.3},
            {"note": "D", "length": 0.3}, {"note": "C", "length": 0.5}, {"note": "A", "length": 0.9}
        ]
    },
	{
		"title": "Twinkle Twinkle Little Star",
		"notes": [
	# Twinkle Twinkle Little Star
    {"note": "C", "length": 0.5}, {"note": "C", "length": 0.5},
    {"note": "G", "length": 0.5}, {"note": "G", "length": 0.5},
    {"note": "F", "length": 0.5}, {"note": "F", "length": 0.5},
    {"note": "G", "length": 1.0},

    # How I wonder what you are
    {"note": "F", "length": 0.5}, {"note": "F", "length": 0.5},
    {"note": "E", "length": 0.5}, {"note": "E", "length": 0.5},
    {"note": "D", "length": 0.5}, {"note": "D", "length": 0.5},
    {"note": "C", "length": 1.0},

    # Up above the world so high
    {"note": "G", "length": 0.5}, {"note": "G", "length": 0.5},
    {"note": "F", "length": 0.5}, {"note": "F", "length": 0.5},
    {"note": "E", "length": 0.5}, {"note": "E", "length": 0.5},
    {"note": "D", "length": 1.0},

    # Like a diamond in the sky
    {"note": "G", "length": 0.5}, {"note": "G", "length": 0.5},
    {"note": "F", "length": 0.5}, {"note": "F", "length": 0.5},
    {"note": "E", "length": 0.5}, {"note": "E", "length": 0.5},
    {"note": "D", "length": 1.0},

    # Twinkle, twinkle, little star,
    {"note": "C", "length": 0.5}, {"note": "C", "length": 0.5},
    {"note": "G", "length": 0.5}, {"note": "G", "length": 0.5},
    {"note": "F", "length": 0.5}, {"note": "F", "length": 0.5},
    {"note": "G", "length": 1.0},

    # How I wonder what you are
    {"note": "F", "length": 0.5}, {"note": "F", "length": 0.5},
    {"note": "E", "length": 0.5}, {"note": "E", "length": 0.5},
    {"note": "D", "length": 0.5}, {"note": "D", "length": 0.5},
    {"note": "C", "length": 1.0}
]
},
	{
		"title": "Three Blind Mice",
		"notes": [
    # First melody
    {"note": "E", "length": 0.5}, {"note": "G", "length": 0.5},
    {"note": "E", "length": 0.5}, {"note": "C", "length": 0.5},
    {"note": "E", "length": 0.5}, {"note": "G", "length": 0.5},
    {"note": "E", "length": 0.5}, {"note": "C", "length": 0.5},

    # Second melody
    {"note": "C", "length": 0.5}, {"note": "E", "length": 0.5},
    {"note": "D", "length": 0.5}, {"note": "C", "length": 0.5},
    {"note": "B", "length": 0.5}, {"note": "C", "length": 0.5},


    {"note": "E", "length": 0.75}
]
}
]

var selected_index := 0

func get_current_song():
    return songs[selected_index]

func next_song():
    selected_index += 1
    if selected_index >= songs.size():
        selected_index = 0

func play():
	var notes = get_current_song()["notes"]
	var start_time = 0

	for note_data in notes:
		var instrument = ""
		if note_data.has("instrument"):
			instrument = note_data["instrument"]
		else:
			instrument = AudioManager.instrument

		var note = note_data["note"]
		var length = note_data["length"]
		var next_note_start = start_time + length - 0.05

		AudioManager.play(instrument, note, start_time, length + 0.05)
		start_time = next_note_start + 0.03


