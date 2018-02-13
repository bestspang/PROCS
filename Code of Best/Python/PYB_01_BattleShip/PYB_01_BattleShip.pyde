from Ship import Ship
from Ship import Shipdata
global mx, my, gameEnd
gameEnd = False
t = 0
cells = 100
mode = 0 # 0 = unlimited, 1 = limited turn mode
ship = list(range(cells))
board = []
def setup():
    size(800,800)
    background(255)
    global ship1, data, t, ship, shipx, shipy
    mx = 0
    my = 0
    data = Shipdata()
    ship1 = Ship(width/cells)
    for x in range(len(ship)):
        ship[x] = Ship(width/cells)
    for x in range(0, cells):
        board.append(["O"] * cells)
    shipx = int(random(cells))
    shipy = int(random(cells))
    data.printb(board)
    t += 1
    print "Turn", t
    print (shipx, shipy)
    
def draw():
    global sz, gameEnd
    sz = width / cells
    fill(50)
    rectMode(CENTER)
    ship1.cell(cells)
    for i in range(cells):
        for j in range(cells):
            ship[i].seabox(sz,i,j,board)
            ship[i].time()    

    if board[shipy][shipx] == "W":
        s = ("turn: " + str(t))
        fill(255)
        text(s, 10, 20)
        text("GAME END", (width/2)-30, height/2+2)
        gameEnd = True
    else:
        s = ("turn: " + str(t))
        fill(255)
        text(s, 10, 20)

def mouseClicked():
    if board[shipy][shipx] == "W":
        print "Nothing!"
        #print gameEnd
        #if gameEnd == True:
        #    for x in range(len(board)):
        #        for i in x:
        #            board[x][i] = ["O"]
        #    shipx = int(random(cells))
        #    shipy = int(random(cells))
    else:
        global t, mx, my
        data.mouselo(sz, False)
        mx = data.mouselo(sz, "x")
        my = data.mouselo(sz, "y")
        data.game(board, cells, shipx, shipy, t)
        #data.printb(board)
        t = t + 1
        print "Turn", t
    

    