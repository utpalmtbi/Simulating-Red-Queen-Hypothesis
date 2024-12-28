analyze_results <- function(out_df) {
  # Calculate growth rate for each population
  out_df <- out_df %>%
    mutate(
      Growth_Rate_S = c(NA, diff(S) / diff(time)),
      Growth_Rate_R = c(NA, diff(R) / diff(time)),
      Growth_Rate_P = c(NA, diff(P) / diff(time))
    )
  
  # Prepare data for statistical tests
  growth_rate_data <- data.frame(
    Population_Type = factor(rep(c("Susceptible", "Resistant", "Phages"), each = nrow(out_df))),
    Growth_Rate = c(out_df$Growth_Rate_S, out_df$Growth_Rate_R, out_df$Growth_Rate_P)
  ) %>%
    filter(!is.na(Growth_Rate)) # Remove NAs from growth rates
  
  # Perform Kruskal-Wallis test
  kruskal_res <- kruskal.test(Growth_Rate ~ Population_Type, data = growth_rate_data)
  
  # Perform Dunn's test for pairwise comparisons
  dunn_res <- dunnTest(Growth_Rate ~ Population_Type, data = growth_rate_data, method = "bonferroni")
  
  # Plot results
  plot <- ggplot(out_df, aes(x = time)) +
    geom_line(aes(y = S, color = "Susceptible Bacteria")) +
    geom_line(aes(y = R, color = "Resistant Bacteria")) +
    geom_line(aes(y = P, color = "Phages")) +
    labs(
      title = "Red Queen Hypothesis: Bacteria and Phage Co-evolution",
      x = "Time",
      y = "Population",
      color = "Population Type"
    ) +
    theme_minimal()
  
  list(
    Plot = plot,
    Kruskal_Wallis = kruskal_res,
    Dunn_Test = dunn_res$res
  )
}
