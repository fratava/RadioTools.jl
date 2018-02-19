__precompile__()

module RadioTools

#Constants
include("constants.jl")
#Convertion
include("convert.jl")

export fre2wl, wl2fre,
       m2cm,
       mm2cm, mm2m, mm2um
       cm2m, cm2mm,
       hz2ghz, hz2mhz,
       ghz2hz, mhz2hz,
       arcs2dg

#Antenna
include("antenna.jl")

export angulares, rms

#Physics
include("physics.jl")

end
