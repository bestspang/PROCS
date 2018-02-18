#add_library('numpy')
#imbest
import math
import cmath
#from dtf import DFT
inreal = []
inimag = []
both = [[-0.1, 0.1, 1.5, 2.5,1, 0, -1, -2.5,-1.5],[1.25, 1.25, 1.75, 0,-2, -2.5, -2, 0,1.75]]
zoom = 5
tpi = 2*math.pi
keyframes = 0
def setup():
    size(600, 600)
    global daft, newboth
    newboth = []
    inreal = [-0.1, 0.1, 1.5, 2.5,1, 0, -1, -2.5,-1.5]
    inimag = [1.25, 1.25, 1.75, 0,-2, -2.5, -2, 0,1.75]
    #daft = cdft(inreal, inimag)
    print both
    #a = daft[0] * daft[1]
    n = len(inreal)
    for i in range(n):
        inreal[i] = inreal[i]/zoom/2*width
        inimag[i] = inimag[i]/zoom/2*width
        
    newboth = [inreal, inimag]
    print "0----------------"
    print newboth
    
    keyframes = cdft(newboth[0], newboth[1])
    print "1----------------"
    print keyframes
    print "2----------------"
    keyframes = sortlist(keyframes)
    for i in keyframes:
        print i
    
def draw():
    background(255)
    translate(width/2,height/2)
    scale(15)
    rotate(radians(180))
    #point(0,0)
    drawPoint(both,both[0], zoom)
    #drawPoint(daft,daft[0], zoom)
    #for i in range(len(newboth[0])):
    #    ellipse(newboth[0][i],newboth[1][i],1,1)
    
def cdft(inreal, inimag):
  assert len(inreal) == len(inimag)
  n = len(inreal)
  outreal = []
  outimag = []
  output = []
  for i in range(n):  # For each output element
    sumreal = 0.0
    sumimag = 0.0
    angle = 0.0
    for j in range(n):  # For each input element
      angle = tpi * j * i / n
      sumreal +=  inreal[j] * math.cos(angle) + inimag[j] * math.sin(angle)
      sumimag += -inreal[j] * math.sin(angle) + inimag[j] * math.cos(angle)
    output.append([sumreal/n,sumimag/n,i])
    outreal.append(sumreal)
    outimag.append(sumimag)
  return (output)

def arrange(inreal, inimag):
    output = []
    a = len(inreal)
    for i in range(a):
        x = inreal[i]
        y = inimag[i]
        output.append([x,y])
    return output
    
def dft(x):
    t = []
    N = len(x)
    for k in range(N):
        a = 0
        for n in range(N):
            a += x[n]*cmath.exp(-2j*cmath.pi*k*n*(1/N))
        t.append(a)
    return t
# Inverse discrete fourier transform
def idft(t):
    x = []
    N = len(t)
    for n in range(N):
        a = 0
        for k in range(N):
            a += t[k]*cmath.exp(2j*cmath.pi*k*n*(1/N))
        a /= N
        x.append(a)
    return x

def drawPoint(alist,leng, sz):
    strokeWeight(1)
    for i in range(len(leng)):
        point(alist[0][i]*sz,alist[1][i]*sz)
        #print(alist[0][i]*sz,alist[1][i]*sz)
        
def circle(x, y, r, col):
    stroke(col)
    ellipse(x, y, r, r)
    
def cmult(a,b,c,d):
    return (a*c-b*d,a*d+b*c)

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
