include("saha.jl")
include("constants.jl")

function bremsstrahlung(N, T, ν)

    A = 0

    gaunt = 1.0

    #gaunt= (sqrt(3) / π)* log((4.0 / ζ)*((keV * T) / (heV* ν)))

    Ne , HI, HII, HeI, HeII, HeIII = saha(T, N)

    if T <= 2e5
        A = 18.2 + 3/2 * log(T) - log(ν)
    else
        A = 24.5 + log(T) - log(ν)
    end

    κ = 9.78e-3 * (Ne^2 / (ν^2 * T^(3/2))) * A

    #κ2 = 1.3705e-35 * T^(0.5) * Ne * Ne * ν^(-3) * (1 - exp(-heV * ν / (keV * T) )) * gaunt
    #κ = 3.7e8 * T^(0.5) * Ne * HeIII * ν^(-3) * (1 - exp(-heV * ν / (keV * T) )) * gaunt

    return κ
end

export bremsstrahlung
