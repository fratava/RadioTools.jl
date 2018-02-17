include("constants.jl")

function angulares(λ, D; arcs = true)
    if arcs == true
        θ = 2.5e5 * (λ / D) #Arcseconds
    else
        θ = 1.22 * (λ / D) #Radians
    end

    return θ
end


export angulares
