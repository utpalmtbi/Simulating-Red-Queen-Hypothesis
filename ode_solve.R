solve_ode <- function(state, times, parameters) {
  ode(y = state, times = times, func = define_model, parms = parameters)
}