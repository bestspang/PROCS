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
  return (output)