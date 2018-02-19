include("constants.jl")

fre2wl(ν) = c / ν #cm
wl2fre(λ) = c / λ #Hz

#Distance
function m2cm(m)
       return m   * 100
end

function mm2cm(mm)
       return mm  * 0.1
end

function mm2m(mm)
       return mm  * 0.001
end

function mm2um(mm)
       return mm  * 1000
end

function cm2m(cm)
       return cm  * 0.01
end

function cm2mm(cm)
       return cm  * 10
end
#Frequency
function hz2ghz(hz)
       return hz  / 1e9
end

function hz2mhz(hz)
       return hz  / 1e6
end

function ghz2hz(ghz)
       return ghz * 1e9
end

function mhz2hz(mhz)
       return mhz * 1e6
end
#Angle
function arcs2dg(arcs)
       return arcs * 0.00028
end

export fre2wl, wl2fre,
       m2cm,
       mm2cm, mm2m, mm2um
       cm2m, cm2mm,
       hz2ghz, hz2mhz,
       ghz2hz, mhz2hz,
       arcs2dg
