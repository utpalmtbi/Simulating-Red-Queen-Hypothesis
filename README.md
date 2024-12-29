# Red Queen Hypothesis: Bacteria and Phage Co-evolution

This repository contains R codes for simulating the co-evolution dynamics of bacteria and phages based on the Red Queen Hypothesis. The system uses ordinary differential equations (ODEs) to model the interactions between susceptible bacteria, resistant bacteria, and phages, incorporating parameters such as growth rates, mutation rates, and infection rates. This code is part of this blog post: https://www.bakshilab.org/blog/simulating-the-red-queen-hypothesis
## Features

- **Differential Equation Modeling**: Captures the population dynamics of bacteria and phages over time.
- **Growth Rate Analysis**: Calculates growth rates for each population type.
- **Statistical Tests**: Includes Kruskal-Wallis and Dunn's test to compare growth rates between populations.
- **Visualization**: Generates time-series plots of population dynamics.

## Use
Run script.R

## Requirements

### R Packages

The following R packages are required:
- `deSolve`: For solving ODEs.
- `ggplot2`: For data visualization.
- `dplyr`: For data manipulation.
- `tidyr`: For data tidying.
- `FSA`: For statistical tests (Dunn's test).

Install them using the command:
```r
install.packages(c("deSolve", "ggplot2", "dplyr", "tidyr", "FSA"))
