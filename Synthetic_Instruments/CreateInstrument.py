



btList = ["Instrument Name:","A:","B:","C:","D:","E:","F:","UP:","DOWN:"]
inst = []








for x in btList:
    print("Please Input Var " + x)
    
    inst.append(input())

def createInstrument(inst):
    
    f = open (inst[0] + ".txt", "x")
    for instrument in inst:
        x = 0
        f.write(instrument + "" + "\n")
        x += 1
    f.close()
    print("Done")
    
    
createInstrument(inst)    
print("Program Complete")