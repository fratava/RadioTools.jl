include("constants.jl")

#Plank law
function plank(ν,T)
    b_nu = ( (2 * h * ν.^3) / (c^2)) .* (1 ./ ( exp.( (h .* ν) / (k_b * T) ) - 1))
    return b_nu
end

#Intensity
function intensity(n, ν, T, I0; Δx = 0.1)
    I = [I0]

    for i=2:n
        I_temp = I[i-1] * exp(-τ(n,T)) + S(ν, T) * (1 - exp(-τ(n,T)))
        push!(I,I_temp)
    end

    return I
end

#Opacity
function κ(n,T)
    return 1.0
end

#Source function
function S(ν, T)
    return plank(ν,T)
end

#Optical depth
function τ(n,T; Δx = 0.1)

    τ1 = (Δx / 2) * ( κ(n,T) + κ(n,T) )

    return τ1
end

export plank, intensity, κ, S, τ
