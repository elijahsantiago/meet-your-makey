extends Node

var fur_elise_notes = [
    {"note": "E", "length": 0.25}, {"note": "C5", "length": 0.25}, {"note": "E", "length": 0.25},  
    {"note": "C5", "length": 0.25}, {"note": "E", "length": 0.25}, {"note": "B", "length": 0.3},  
    {"note": "D", "length": 0.3}, {"note": "C", "length": 0.5}, {"note": "A", "length": 0.9},  

    {"note": "C", "length": 0.3}, {"note": "E", "length": 0.3}, {"note": "A", "length": 0.3},  
    {"note": "B", "length": 0.3}, {"note": "E", "length": 0.3}, {"note": "C5", "length": 0.9},   

    {"note": "E", "length": 0.25}, {"note": "C5", "length": 0.25}, {"note": "E", "length": 0.25},  
    {"note": "C5", "length": 0.25}, {"note": "E", "length": 0.25}, {"note": "B", "length": 0.3},  
    {"note": "D", "length": 0.3}, {"note": "C", "length": 0.6}, {"note": "A", "length": 0.9}
]

func play():
    play_happy_birthday()

func play_happy_birthday():
    var start_time = 0
    
	#Note Scrubbing
    for i in range(fur_elise_notes.size()):
        var note_data = fur_elise_notes[i]
        var next_note_start = start_time + note_data["length"] - 0.05 
        
        # Controls Instrument Based on Tab - Useful for not hardcoding
        AudioManager.play(AudioManager.instrument, note_data["note"], start_time, note_data["length"] + 0.05)  
        
        start_time = next_note_start + 0.03


