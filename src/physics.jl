include("constants.jl")

#Intensity
function intensity_fq(ν,T)
    I_λ= (2 * ν^2 * k_b * T) / (c^2)
    return I_λ
end

function intensity_wl(λ,T)
    I_λ= (2 * c * k_b * T) ./ (λ.^4)
    return I_λ
end

#Flux
function flux_ll(R,r,λ,T)
    f_ll = (R / r)^2 * π * intensity_fq(λ,T)
    return f_ll
end

function flux_obs(A,R,r,λ,T)
    f_obs = A * flux_ll(R,r,λ,T)
    return f_obs
end

function flux_obs_df(Δλ,R,r,λ,T)
    f_obs = flux_ll(R,r,λ,T) * Δλ
    return f_obs
end

export intensity_fq, intensity_wl,
       flux_ll, flux_obs, flux_obs_df
