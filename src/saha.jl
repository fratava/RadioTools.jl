#saha function
function fHI(T,ne)
     χ   = 13.60
    temp = 15.6826 - log10(ne) + log10(2) + 1.5 * log10(T) - χ * (5040 / T)

    return temp
end

function fHeI(T,ne)
     χ   = 24.58
    temp = 15.6826 - log10(ne) + log10(2) + 1.5 * log10(T) - χ * (5040 / T)

    return temp
end

function fHeII(T,ne)
     χ   = 54.41
    temp = 15.6826 - log10(ne) + log10(2) + 1.5 * log10(T) - χ * (5040 / T)

    return temp
end

function saha(T,N;ionization = false)
    Ne  = N * 0.1
    X   = 0.9
    Y   = 0.1
    NH  = X * N
    NHe = Y * N
    δ   = 1e-5

    X1  = fHI(  T, Ne)
    X2  = fHeI( T, Ne)
    X3  = fHeII(T, Ne)

    Y1  = 10^(X1) #H0
    Y2  = 10^(X2) #He0
    Y3  = 10^(X3) #He+

    X4  = X * N  / (1 + Y1)
    X5  = Y * N  / (1 + Y2 * (1 + Y3))
    Ne_last = 0

    AHI    = 0
    AHII   = 0
    AHeI   = 0
    AHeII  = 0
    AHeIII = 0
    ANe    = 0

    while true
        HI    = X4
        HII   = X * N - HI
        HeI   = X5
        HeII  = Y2 * HeI
        HeIII = Y3 * HeII
        Ne    = HII + HeII + 2 * HeIII

        if (1 - Ne / Ne_last) < δ

            AHI    = HI
            AHII   = HII
            AHeI   = HeI
            AHeII  = HeIII
            AHeIII = HeIII
            ANe    = Ne

            break
        else
            Ne_last = (Ne_last + Ne) /2
        end
    end

    if ionization == true
        return [AHI,AHII,AHeI,AHeII,AHeIII,ANe]
    else
        return ANe, AHII
    end
end

export fHI, fHeI, fHeII, saha
