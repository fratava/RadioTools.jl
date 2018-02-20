# RadioTools.jl

Documentation for RadioTools.jl


```julia
using RadioTools
```

# Ejemplo

Tenemos una antena de 2m de diámetro y queremos saber su resolución angular a una frecuencia de 12Ghz.

Primero tenemos que convertir la frecuencia a longitud de onda. Como la longitud de onda onda está en cm, debemos convertirla a metros.


```julia
λ = fre2wl(ghz2hz(12))
#λ = cm2m(λ)
D = m2cm(2)

println("λ = $λ\nD = $D")
```

    λ = 2.4982704675
    D = 200


Despues utilizamos la función angulares($\lambda$, D) y obtendremos el resultado en arcs. Si queremos convertirlo a grados en el cielo usamos la función "arcs2dg()"


```julia
res_angular=angulares(λ,D)
res_angular_grados=arcs2dg(res_angular)
```




    0.8743946636249998
