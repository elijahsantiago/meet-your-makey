extends Node


#play(instrument, note, time_start, length)


var dark_horse_beat = ["C5","C5","C5","C5","B","B","A","E",]

# Called when the node enters the scene tree for the first time.
func play():
    
#      for x in range(0,3):
#        example_1()

      for x in range(1,3):
        example_2()
    

func example_1():
    AudioManager.play("Cello", "C5", 0, 1)
    AudioManager.play("Cello", "C5", 1.1, 1)
    AudioManager.play("Cello", "C5", 2.1, 1)
    AudioManager.play("Cello", "C5", 3.1, 1)
    AudioManager.play("Cello", "B", 4.1, 1)
    AudioManager.play("Cello", "B", 5.1, 1)
    AudioManager.play("Cello", "A", 6.1, 1)
    AudioManager.play("Cello", "E", 7.1, 1)
    
    
func example_2():
    
    var StartNoteTime = 0; #starts the notes and song at 5 seconds
    
    for note in dark_horse_beat:
        AudioManager.play("Cello", note, StartNoteTime, .7)
        StartNoteTime += .75 #increases the start time of the next note by .5 seconds