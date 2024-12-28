library(deSolve)
library(ggplot2)
library(dplyr)
library(tidyr)
library(FSA)

# Source scripts
source("path/to/Simulating-Red-Queen-Hypothesis/ode_model.R")
source("path/to/Simulating-Red-Queen-Hypothesis/ode_solve.R")
source("path/to/Simulating-Red-Queen-Hypothesis/data_analysis.R")
source("path/to/Simulating-Red-Queen-Hypothesis/simulation.R")

# Parameters
default_params <- list(
  r_S = 0.1,    # Growth Rate of Susceptible Bacteria
  r_R = 0.1,    # Growth Rate of Resistant Bacteria
  beta = 0.01,  # Rate of Infection
  alpha = 0.1,  # Rate of Phage Production by Infected Bacteria
  delta = 0.05, # Natural Death Rate of Phages
  mu = 0.001,   # Mutation Rate to Resistant Bacteria
  nu = 0.001    # Mutation Rate to Susceptible Bacteria
)

# Initial conditions
default_state <- c(S = 1000, R = 10, P = 100) # Susceptible, Resistant, Phages

# Time points
default_times <- seq(0, 10, by = 0.1) # Generation time of 10

# Run the simulation with default parameters
results <- run_simulation(default_state, default_times, default_params)

# Display the plot
print(results$Plot)

# Display statistical test results
print(results$Kruskal_Wallis)
print(results$Dunn_Test)