include("constants.jl")
include("bremsstrahlung.jl")

#Plank law
function plank(ν,T)
    b_nu = ( (2 * h * ν.^3) / (c^2)) .* (1 ./ ( exp.( (h .* ν) / (k_b * T) ) - 1))
    return b_nu
end

#Intensity
function intensity(N, ν, T, I0; Δx = 0.1)
    I = [I0]

    for i=2:length(N)
        I_temp = I[i-1] * exp(-τ([N[i-1] N[i]],[T[i-1] T[i]], ν)) +
                 S(ν, T[i]) * (1 - exp(-τ([N[i-1] N[i]],[T[i-1] T[i]], ν)))
        push!(I,I_temp)
    end

    return I
end

#Opacity
function κ(N,T,ν, opacity=true)
    if opacity == true
        return bremsstrahlung(N, T ,ν)
    else
        return 1.0
    end
end

#Source function
function S(ν, T)
    return plank(ν,T)
end

#Optical depth
function τ(N, T, ν; Δx = 1e1)

    #τ1 = (Δx * 5e4) * ( κ(N[1], T[1], ν) + κ(N[2], T[2], ν) )
    τ1 = (Δx * 0.5) * ( κ(N[1], T[1], ν) + κ(N[2], T[2], ν) )

    return τ1
end

export plank, intensity, κ, S, τ
