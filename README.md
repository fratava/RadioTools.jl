# RadioTools

The package can be installed through Julia's package manager:
```julia
Pkg.clone("https://github.com/fratava/RadioTools.jl")
```


## Functions:
### Angular resolution:
```julia
angulares(λ,D,arcs=true)
```
### rms:
```julia
rms(λ)
```

## Input units:
### Angular resolution:
* λ = m (wavelength)
* D = m (Diameter of telescope)
### rms:
* λ = m (wavelength)

## Output units:
* Angular resolution: arcs (If you need radians arcs=false )
* rms: m
