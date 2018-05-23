include("constants.jl")
include("bremsstrahlung.jl")

#Plank law
function plank(ν,T)
    b_nu = ( (2 * h * ν.^3) / (c^2)) .* (1 ./ ( exp.( (h .* ν) / (k_b * T) ) - 1))
    return b_nu
end

#Intensity
function intensity(N, ν, T, D, I0)
    I   = [I0]
    Iν  = 0
    tau = []

    for i=2:length(N)

        Δx  = D[i] - D[i-1]
        ttemp = τ([N[i-1] N[i]],[T[i-1] T[i]], ν, Δx)
        push!(tau, ttemp)

        I_temp = I[i-1] * exp(-τ([N[i-1] N[i]],[T[i-1] T[i]], ν, Δx)) +
                 S(ν, T[i]) * (1 - exp(-τ([N[i-1] N[i]],[T[i-1] T[i]], ν, Δx)))

        Iν = I_temp
        push!(I,I_temp)
    end

    #return I, Iν, tau
    return Iν
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
function τ(N, T, ν, Δx)

    τ1 = (Δx/2 * 1e5) * ( κ(N[1], T[1], ν) + κ(N[2], T[2], ν) )

    return τ1
end

#Temperature brightness
function tb(I, ν)
    return I * c^2 / (2 * k_b * ν^2)
end

export plank, intensity, κ, S, τ, TB
