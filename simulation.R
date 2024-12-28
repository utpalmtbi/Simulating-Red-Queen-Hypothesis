run_simulation <- function(state, times, parameters) {
  # Solve the ODE
  out <- as.data.frame(solve_ode(state, times, parameters))
  
  # Analyze results
  analysis_results <- analyze_results(out)
  
  # Return analysis results
  analysis_results
}