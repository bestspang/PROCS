public final class Dft {
  
  /* 
   * Computes the discrete Fourier transform (DFT) of the given complex vector.
   * All the array arguments must be non-null and have the same length.
   */
  public static void computeDft(double[] inreal, double[] inimag, double[] outreal, double[] outimag) {
    int n = inreal.length;
    for (int k = 0; k < n; k++) {  // For each output element
      double sumreal = 0;
      double sumimag = 0;
      for (int t = 0; t < n; t++) {  // For each input element
        double angle = 2 * Math.PI * t * k / n;
        sumreal +=  inreal[t] * Math.cos(angle) + inimag[t] * Math.sin(angle);
        sumimag += -inreal[t] * Math.sin(angle) + inimag[t] * Math.cos(angle);
      }
      outreal[k] = sumreal;
      outimag[k] = sumimag;
    }
  }
  
}

void dft(time) {
  float ret = []
  float n = time.length
  for (int i = 0 ; i < n ; ++i) {
    float sreal = 0, simag = 0, angle = 0
    for (int j = 0 ; j < n ; ++j) {
      angle = tpi * i * j / n; // tpi = 2*Math.PI
      sreal +=  time[j][0] * Math.cos(angle) + time[j][1] * Math.sin(angle);
      simag += -time[j][0] * Math.sin(angle) + time[j][1] * Math.cos(angle);
    }
    ret.push([sreal/n,simag/n,i])
  }
  return ret
}