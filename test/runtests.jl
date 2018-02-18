using RadioTools
using Base.Test

# Test
@testset "Angular resolution" begin include("angulares.jl") end
@testset "rms" begin include("rms.jl") end
