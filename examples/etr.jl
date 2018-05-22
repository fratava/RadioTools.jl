using RadioTools
using PyPlot

data = readdlm("hydrostatic.bak")#("../../Tesis/data/VALC/hydrostatic.bak")

n2  = data[:,5]
ν2  = 12e9
T2  = data[:,3]
I02 = 5e-13

Iν  = intensity(n2, ν2, T2, I02)
loglog(Iν)
title("Intensity at 12GHz")
xlabel("Step")
ylabel("Intensity")

show()

Tb = Iν * c^2 / (2 * k_b * ν2^2)

loglog(data[:,2],Tb)
title("Emisión total")
ylabel("Tb (K)")
xlabel("Height over photosphere (Km)")
#yscale("log")
ylim(1e3,1e5)

show()
