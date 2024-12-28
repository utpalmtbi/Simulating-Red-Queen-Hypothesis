define_model <- function(time, state, parameters) {
  with(as.list(c(state, parameters)), {
    dS <- r_S * S - beta * S * P - mu * S + nu * R
    dR <- r_R * R - alpha * beta * R * P + mu * S - nu * R
    dP <- alpha * beta * S * P + alpha * beta * R * P - delta * P
    list(c(dS, dR, dP))
  })
}