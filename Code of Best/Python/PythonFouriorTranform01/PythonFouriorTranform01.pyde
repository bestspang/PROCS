#add_library('numpy')
#imbest
import math
import cmath
#from dtf import DFT
inreal = [-0.1, 0.1, 1.5, 2.5,1, 0, -1, -2.5,-1.5]
inimag = [1.25, 1.25, 1.75, 0,-2, -2.5, -2, 0,1.75]
both = [[-0.1, 0.1, 1.5, 2.5,1, 0, -1, -2.5,-1.5],[1.25, 1.25, 1.75, 0,-2, -2.5, -2, 0,1.75]]
zoom = 50
tpi = 2*math.pi
keyframes = 0
def setup():
    size(400, 400)
    global daft
    daft = cdft(inreal, inimag)
    #daft2 = dft(both)
    #print daft
    print cmult(1,2,3,4)

    
def draw():
    background(255)
    translate(width/2,height/2)
    rotate(radians(180))
    #point(0,0)
    drawPoint(both,both[0], zoom)
    #drawPoint(daft,daft[0], zoom)
    
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
    strokeWeight(5)
    for i in range(len(leng)):
        point(alist[0][i]*sz,alist[1][i]*sz)
        #print(alist[0][i]*sz,alist[1][i]*sz)
        
def circle(x, y, r, col):
    stroke(col)
    ellipse(x, y, r, r)
    
def cmult(a,b,c,d):
    return (a*c-b*d,a*d+b*c)
