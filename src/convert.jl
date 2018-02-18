include("constants.jl")

fre2wl(ν) = c / ν #cm
wl2fre(λ) = c / λ #Hz

#Distance
m2cm(m)     = m   * 100

mm2cm(mm)   = mm  * 0.1
mm2m(mm)    = mm  * 0.001
mm2um(mm)   = mm  * 1000

cm2m(cm)    = cm  * 0.01
cm2mm(cm)   = cm  * 10
#Frequency
hz2ghz(hz)  = hz  / 1e9
hz2mhz(hz)  = hz  / 1e6

ghz2hz(ghz) = ghz * 1e9
mhz2hz(mhz) = mhz * 1e6
#Angle
arcs2dg(arcs) = arcs * 0.00028

export fre2wl, wl2fre,
       m2cm,
       mm2cm, mm2m, mm2um 
       cm2m, cm2mm,
       hz2ghz, hz2mhz,
       ghz2hz, mhz2hz,
       arcs2dg
