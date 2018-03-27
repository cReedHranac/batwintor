#' Deterministic Model of Fungal Growth
#'
#' \code{DetModel} solves differential equasions accociated with the
#' deterministic model of fungal growth.
#'
#' @param t time
#' @param y dependant varriables calculated within
#' \code{\link{hibernationModel}}
#' @param params parameters accociated with \code{bat.params},
#' and \code{fung.params}
#'
#' @details internal function for \code{\link{hibernationModel}} to calculate the
#' proportion of time and energy spent in the various states that compose a hibernation.
#'
#' @family Model Engine
#' @seealso \code{\link{hibernationModel}},  \code{\link{buildEnv}}
#' @example ExampleScripts/hibernationModel_ex.R
#' @export
batDynamic <- function(t,y, params){
  with(c(as.list(y),params),{
    ttor <- torporTime(Ta = Tb, pct.rh = pct.rh, areaPd = FungalArea, WNS = WNS,
                           bat.params = params, fung.param = params)
    tar <- arousalTime(Ta = Tb, bat.params = params)
    tc <- coolTime(Ta = Tb, bat.params = params)
    tfl <- flyingTime(bat.params = params)
    tieu <- euthermicTime(bat.params = params) #time inactive euthermic
    # change in TorporProp (pT)/dt
    dpTdt <- (pE/tieu + pAr/tar + pC/tc + pFl/tfl)/4 - pT/ttor
    # change in ArousalProp (pAr)/dt
    dpAdt <- (pE/tieu + pC/tc + pT/ttor + pFl/tfl)/4 - pAr/tar
    # change in CoolProp (pC)/dt
    dpCdt <- (pE/tieu + pAr/tar + pT/ttor + pFl/tfl)/4 - pC/tc
    # change in EuthermicProp (pE)/dt
    dpEdt <- (pT/ttor + pAr/tar + pC/tc + pFl/tfl)/4 - pE/tieu
    # Cange in FlyingProp (pFl)/dt
    dpFldt <- (pT/ttor + pAr/tar + pC/tc + pE/tieu)/4 - pFl/tfl
    # change in EnergyConsumed/dt
    dJdt  <- Eeu*pE + Etor*pT + Ear*pAr + Ec*pC + Efl*pFl
    # change in precEArousal/dt
    dpJdt <- Eeu*pE +Ear*pAr + Ec*pC + Efl*pFl
    #change in FungalArea/dt
    dFdt  <- growth*pT

    list(c(dpTdt, dpAdt, dpCdt, dpEdt, dpFldt, dJdt, dpJdt, dFdt))
  })
}
