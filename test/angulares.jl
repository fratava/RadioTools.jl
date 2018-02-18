using RadioTools
using Base.Test

λ = cm2m(fre2wl(ghz2hz(12)))
D = 2

@test angulares(λ,D) == 3122.8380843749997
