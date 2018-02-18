#add_library('numpy')
#imbest
import math
import cmath
#from dtf import DFT
inreal = []
inimag = []
both = [[-0.1, 0.1, 1.5, 2.5, 1, 0, -1, -2.5, -1.5],[1.25, 1.25, 1.75, 0, -2, -2.5, -2, 0, 1.75]]
zoom = 5.0
tpi = 2*math.pi
keyframes = 0
spd = 1
shorter = 0
def setup():
    size(600, 600)
    global daft, newboth, keyframes, time, adaptn
    background(255)
    smooth(20)
    time = 0
    newboth = []
    inreal = [-0.1, 0.1, 1.5, 2.5, 1, 0, -1, -2.5, -1.5]
    inimag = [1.25, 1.25, 1.75, 0, -2, -2.5, -2, 0, 1.75]
    n = len(inreal)
    newboth = arrange(inreal, inimag)
    adaptn = adapt(newboth)
    keyframes = fdft(adaptn)
    keyframes = sortlist(keyframes)
    for i in keyframes:
        print i

    
def draw():
    #background(255, 0)
    fill(255,20);
    #rect(0,0,width, height)
    noFill()
    translate(width/2,height/2)
    #scale(15)
    rotate(radians(180))
    for i in range(len(keyframes)-shorter):
        global time
        f = keyframes[i][2]
        if f > len(keyframes)/2:
            f = f - len(keyframes)

        angle = time / 360.0 * tpi * f
        print "a",angle
        c = cmult(math.cos(angle),math.sin(angle),keyframes[i][0], keyframes[i][1])
        
        #circle(c[0],c[1],3,"RED",5)
        #translate(c[0],c[1])
        circle(0,0,math.sqrt(c[0]*c[0]+c[1]*c[1]),0,0.2)

    time = timer(time)
    drawPoint(adaptn, 7, 0)


def fdft(input):
  n = len(input)
  output = []
  for i in range(n):
    sumreal = 0.0
    sumimag = 0.0
    angle = 0.0
    for j in range(n):
      angle = tpi * j * i / n
      sumreal +=  input[j][0] * math.cos(angle) + input[j][1] * math.sin(angle)
      sumimag += -input[j][0] * math.sin(angle) + input[j][1] * math.cos(angle)
    output.append([sumreal/n,sumimag/n,i])
  return (output)

def arrange(inreal, inimag):
    output = []
    a = len(inreal)
    for i in range(a):
        x = inreal[i]
        y = inimag[i]
        output.append([x,y])
    return output

def circle(x, y, r, c, s):
    strokeWeight(s)
    if c == "RED":
        stroke(255,61,127)
    else:
        stroke(c)
    noFill()
    ellipse(x,y,r,r)
    

def drawPoint(alist,sz,f):
    for i in range(len(alist)):
        fill(f)
        ellipse(alist[i][0],alist[i][1],sz,sz)
        #print(alist[0][i]*sz,alist[1][i]*sz)
    
def cmult(a,b,c,d):
    return [a*c-b*d,a*d+b*c]

def sortlist(x):
    new = []
    snew = []
    for i in x:
        y = i[0]*i[0]+i[1]*i[1]
        g = i[2]
        new.append([y, g])
    def getKey(i):
        return i[0]
    new = sorted(new, key=getKey, reverse=True)
    for i in new:
        snew.append(x[i[1]])    
    return snew

def adapt(input):
    x = input
    for i in range(len(input)):
        x[i][0] = x[i][0]/zoom/2*width
        x[i][1] = x[i][1]/zoom/2*width
    return x

def timer(time):
    if time > 360:
        time = 0
    else:
        time += spd
    return time