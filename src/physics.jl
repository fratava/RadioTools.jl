include("constants.jl")

#Plank law
function plank(ν,T)
    b_nu = ((2 * h * ν.^3)/(c^2)) .* (1 / ( exp( (h * c) / (k_b + T) ) - 1))
    return b_nu
end

#Intensity
function intensity(n, T, I0)
    I = [I0]

    for i=2:n
        I_temp = I[i-1] * exp(-τ(n,T)) + S(T) * (1 - exp(-τ(n,T)))
        push!(I,I_temp)
    end

    return I
end

#Opacity
function κ(n,T)
    return 1.0
end

#Source function
function S(T)
    return 1.0
end

#Optical depth
function τ(n,T)
    Δx = 0.1

    τ1 = (Δx / 2) * ( κ(n,T) + κ(n,T) )

    return τ1
end

export plank, intensity, κ, S, τ
