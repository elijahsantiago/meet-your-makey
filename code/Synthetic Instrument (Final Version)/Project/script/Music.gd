extends Node

var happy_birthday_notes = [
    {"note": "C", "length": 0.2, "instrument": "Cello"}, {"note": "C", "length": 0.2, "instrument": "Cello"}, 
    {"note": "D", "length": 0.25, "instrument": "Cello"}, {"note": "C", "length": 0.25, "instrument": "Cello"}, 
    {"note": "F", "length": 0.25, "instrument": "Cello"}, {"note": "E", "length": 0.5, "instrument": "Cello"},  # Hanging note

    {"note": "C", "length": 0.2, "instrument": "Cello"}, {"note": "C", "length": 0.2, "instrument": "Cello"}, 
    {"note": "D", "length": 0.25, "instrument": "Cello"}, {"note": "C", "length": 0.25, "instrument": "Cello"}, 
    {"note": "G", "length": 0.25, "instrument": "Cello"}, {"note": "F", "length": 0.5, "instrument": "Cello"},  # Hanging note

    {"note": "C", "length": 0.2, "instrument": "Cello"}, {"note": "C", "length": 0.2, "instrument": "Cello"}, 
    {"note": "C5", "length": 0.25, "instrument": "Cello"}, {"note": "A", "length": 0.25, "instrument": "Cello"}, 
    {"note": "F", "length": 0.25, "instrument": "Cello"}, {"note": "E", "length": 0.25, "instrument": "Cello"}, 
    {"note": "D", "length": 0.9, "instrument": "Cello"},  # Hanging note

    {"note": "B", "length": 0.2, "instrument": "Piano"}, {"note": "B", "length": 0.2, "instrument": "Piano"}, 
    {"note": "A", "length": 0.25, "instrument": "Piano"}, {"note": "F", "length": 0.25, "instrument": "Piano"}, 
    {"note": "G", "length": 0.25, "instrument": "Piano"}, {"note": "F", "length": 0.9, "instrument": "Piano"}  # Final hanging note
]

func play():
    play_happy_birthday()

func play_happy_birthday():
    var start_time = 0
    
    for note_data in happy_birthday_notes:
        var next_note_start = start_time + note_data["length"] - 0.05 
        
        AudioManager.play(note_data["instrument"], note_data["note"], start_time, note_data["length"] + 0.05)  
        
        start_time = next_note_start + 0.03


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
var happy_birthday_notes_dynamic = [
    {"note": "C", "length": 0.2}, {"note": "C", "length": 0.2}, {"note": "D", "length": 0.25}, 
    {"note": "C", "length": 0.25}, {"note": "F", "length": 0.25}, {"note": "E", "length": 0.5},  # Hanging note

    {"note": "C", "length": 0.2}, {"note": "C", "length": 0.2}, {"note": "D", "length": 0.25}, 
    {"note": "C", "length": 0.25}, {"note": "G", "length": 0.25}, {"note": "F", "length": 0.5},  # Hanging note

    {"note": "C", "length": 0.2}, {"note": "C", "length": 0.2}, {"note": "C5", "length": 0.25}, 
    {"note": "A", "length": 0.25}, {"note": "F", "length": 0.25}, {"note": "E", "length": 0.25}, {"note": "D", "length": 0.9},  # Hanging note

    {"note": "B", "length": 0.2}, {"note": "B", "length": 0.2}, {"note": "A", "length": 0.25}, 
    {"note": "F", "length": 0.25}, {"note": "G", "length": 0.25}, {"note": "F", "length": 0.9}  # Final hanging note
]


