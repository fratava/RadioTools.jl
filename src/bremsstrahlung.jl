include("saha.jl")

function bremsstrahlung(N, T, ν)

    A = 0

    Ne = saha(T, N)

    if T < 2e5
        A = 18.2 + 3/2 * log(T) - log(ν)
    else
        A = 24.5 + log(T) - log(ν)
    end

    κ = 9.78e-3 * (Ne^2 / (ν^2 * T^(3/2))) * A

    return κ
end

export bremsstrahlung
