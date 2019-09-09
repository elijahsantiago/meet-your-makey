import sys
import pygame
pygame.init()
# open and read the .txt file line by line
file = input("Choose an instrument file: ")
f = open(file, "r")
keyList = f.read().split('\n')
f.close()
# initialize pygame, set the number of available mixer channels to 8, create a window for events to use
pygame.mixer.set_num_channels(8)
pygame.display.set_mode()
# assign a sound to a variable
n1 = pygame.mixer.Sound(keyList[0])
n2 = pygame.mixer.Sound(keyList[1])
n3 = pygame.mixer.Sound(keyList[2])
n4 = pygame.mixer.Sound(keyList[3])
n5 = pygame.mixer.Sound(keyList[4])
n6 = pygame.mixer.Sound(keyList[5])
n7 = pygame.mixer.Sound(keyList[6])
n8 = pygame.mixer.Sound(keyList[7])
# play a note for each key; close the window with ESC
# keys correspond with makey makey inputs
while True:
   for event in pygame.event.get():
       if event.type == pygame.KEYDOWN:
           if event.key == pygame.K_ESCAPE:
               pygame.quit()
               sys.exit()
           elif event.key == pygame.K_w:
               pygame.mixer.Channel(0).play(n1, loops = -1, fade_ms = 200)
           elif event.key == pygame.K_a:
               pygame.mixer.Channel(1).play(n2, loops = -1, fade_ms = 200)
           elif event.key == pygame.K_s:
               pygame.mixer.Channel(2).play(n3, loops = -1, fade_ms = 200)
           elif event.key == pygame.K_d:
               pygame.mixer.Channel(3).play(n4, loops = -1, fade_ms = 200)
           elif event.key == pygame.K_f:
               pygame.mixer.Channel(4).play(n5, loops = -1, fade_ms = 200)
           elif event.key == pygame.K_g:
               pygame.mixer.Channel(5).play(n6, loops = -1, fade_ms = 200)
           elif event.key == pygame.K_UP:
               pygame.mixer.Channel(6).play(n7, loops = -1, fade_ms = 200)
           elif event.key == pygame.K_DOWN:
               pygame.mixer.Channel(7).play(n8, loops = -1, fade_ms = 200)
       if event.type == pygame.KEYUP:
           if event.key == pygame.K_w:
               pygame.mixer.Channel(0).fadeout(300)
           elif event.key == pygame.K_a:
               pygame.mixer.Channel(1).fadeout(300)
           elif event.key == pygame.K_s:
               pygame.mixer.Channel(2).fadeout(300)
           elif event.key == pygame.K_d:
               pygame.mixer.Channel(3).fadeout(300)
           elif event.key == pygame.K_f:
               pygame.mixer.Channel(4).fadeout(300)
           elif event.key == pygame.K_g:
               pygame.mixer.Channel(5).fadeout(300)
           elif event.key == pygame.K_UP:
               pygame.mixer.Channel(6).fadeout(300)
           elif event.key == pygame.K_DOWN:
               pygame.mixer.Channel(7).fadeout(300)