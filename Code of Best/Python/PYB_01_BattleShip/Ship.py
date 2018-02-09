class Ship(object):
    
    def __init__(self, sz):
        self.c = color(59,134,134)
        self.x = sz/2
        self.y = sz/2
        self.t = random(0,10000)
        self.ts = random(0.001,0.004)
        fill(self.c)
        
    def seabox(self,sz,i,j,b):
        overBox = False
        x = noise(self.t)
        x = map(x,0,1,0,150);
        c = map(x,0,1,210,255);
        loX = self.x+i*sz
        loY = self.y+j*sz
        dis = dist(mouseX,mouseY,loX,loY)
        #if mouseX < loX + sz/2 and mouseX > loX - sz/2:
        #if dis < sz/2:
        if mouseX < loX + sz/2 and mouseX > loX - sz/2 \
        and mouseY > loY - sz/2 and mouseY < loY + sz/2:
            overBox = True
            if b[j][i] == "X":
                self.c = color(207,c,158)
            elif b[j][i] == "W":
                self.c = color(255,x,127)
            else:
                self.c = color(121,189,154)
        else:
            if b[j][i] == "X":
                self.c = color(207,c,158)
            elif b[j][i] == "W":
                self.c = color(255,x,127)
            else:
                self.c = color(x,134,134)
            
        fill(self.c)
        rectMode(CENTER)
        rect(loX,loY,sz,sz)
    
    def cell(self, cells):
        stroke(11,72,107)#11,72,107
        sz = width / cells
        for i in range(cells):
            noFill()
            line(i*sz,0,i*sz,height)
            line(0,i*sz,width,i*sz)
            
    def sea(self, sz, cells):
        x = sz /2
        y = sz /2
        for i in range(cells):
            for j in range(cells):
                fill(50)
                rectMode(CENTER)
                self.seabox(sz,i,j)
                
    def ifnear(self):
        if mouseX < loX + sz/2 and mouseX > loX - sz/2 \
        and mouseY > loY - sz/2 and mouseY < loY + sz/2:
            self.c = color(121,189,154)
        else:
            self.c = color(59,134,134)
    
    def time(self):
        self.t = self.t + self.ts
                
class Shipdata(object):
    
    def printb(self, b):
        for row in b:
            print " ".join(row)
        
    def mouselo(self, sz, xy):
        global guessx, guessy
        guessx = int(map(mouseX, 0, width, 0, width/sz))
        guessy = int(map(mouseY, 0, height, 0, height/sz))
        if xy == "y":
            return guessy
        elif xy == "x":
            return guessx
        else:
            print "guess! "+"(%s, %s)" %(guessx, guessy)
        
    def game(self, b, cells, shipx, shipy, turn):
        if guessx == shipx and shipy == guessy:
            b[guessy][guessx] = "W"
            print "Congratulations! You sank my battleship!"
            #break
        else:
            if guessx not in range(cells) or \
            guessy not in range(cells):
                print "Oops, that's not even in the ocean."
            elif b[guessy][guessx] == "X":
                print( "You guessed that one already." )
            else:
                print "You missed my battleship!"
                b[guessy][guessx] = "X"
                #if turn == cells/5:
                #    print "Game Over"
        self.printb(b)
       
       