
library(tidyverse)
library(lubridate)
library(broom)
library(lmtest)
library(sandwich)


lw22 <- read_csv("lw22.csv")
zc22 <- read_csv("zc22.csv")

# Convert date formats
lw22$date <- ymd(paste0(substr(lw22$ym, 1, 4), "-", substr(lw22$ym, 5, 6), "-01"))
zc22$date <- as.Date(zc22$date)

#Part a

# Corrected function to calculate forwards and excess returns
calculate_forwards_excess_returns <- function(df) {
  # Calculate log yields
  df <- df %>%
    mutate(across(starts_with("y"), ~log(1 + .x / 100)))  # Convert yield percentages to log(1+y)
  
  # Calculate forward rates f(n)t and excess returns rx(n)t+1
  for(n in 1:9) {
    df <- df %>%
      mutate(!!sym(paste0("f", n)) := get(paste0("y", n + 1)) - get(paste0("y", n)),
             !!sym(paste0("rx", n + 1)) := lead(get(paste0("y", n)), 12) - get(paste0("y", 1)))  # Assume simple excess returns calculation
  }
  df
}

lw22_transformed <- calculate_forwards_excess_returns(lw22)
zc22_transformed <- calculate_forwards_excess_returns(zc22)

# Output the transformed datasets to verify
head(lw22_transformed)
head(zc22_transformed)


library(ggplot2)

# Function to plot Forward Rates and Excess Returns
plot_data <- function(df_transformed, dataset_name) {
  # Forward Rates Plot
  df_transformed %>%
    select(date, starts_with("f")) %>%
    pivot_longer(-date, names_to = "Forward", values_to = "Rate") %>%
    ggplot(aes(x = date, y = Rate, color = Forward)) +
    geom_line() +
    geom_vline(xintercept = as.numeric(as.Date("2003-12-31")), color = "red", linetype = "dashed") +
    labs(title = paste("Forward Rates for", dataset_name), x = "Date", y = "Log Forward Rate") +
    theme_minimal() +
    theme(legend.position = "bottom")
  
  # Excess Returns Plot
  df_transformed %>%
    select(date, starts_with("rx")) %>%
    pivot_longer(-date, names_to = "ExcessReturn", values_to = "Value") %>%
    ggplot(aes(x = date, y = Value, color = ExcessReturn)) +
    geom_line() +
    geom_vline(xintercept = as.numeric(as.Date("2003-12-31")), color = "red", linetype = "dashed") +
    labs(title = paste("Excess Returns for", dataset_name), x = "Date", y = "Log Excess Return") +
    theme_minimal() +
    theme(legend.position = "bottom")
}

# Plotting for LW22 Dataset
plot_data(lw22_transformed, "LW22 Dataset")

# Plotting for ZC22 Dataset
plot_data(zc22_transformed, "ZC22 Dataset")



# Part b 


run_regression <- function(df) {
  # Sample regression: y2 ~ y1
  model <- lm(y2 ~ y1, data = df)
  return(summary(model))
}

# Run and examine results for both datasets
summary_lw22 <- run_regression(lw22_transformed)
summary_zc22 <- run_regression(zc22_transformed)


# Part c
# Unrestricted Regression Function
run_unrestricted_regression <- function(df, pre_2004) {
  # Filter dataset based on pre-2004 or post-2003 sample
  if (pre_2004) {
    df <- df %>% filter(date <= as.Date("2003-12-31"))
  } else {
    df <- df %>% filter(date > as.Date("2003-12-31"))
  }
  
  # Example: Using forward rate f1 to predict excess return rx2
  # This should be adapted based on your actual model specifications
  model <- lm(rx2 ~ f1, data = df)
  return(tidy(model))
}

# Example usage for LW22 dataset
summary_lw22_pre_2004 <- run_unrestricted_regression(lw22_transformed, TRUE)
summary_lw22_post_2003 <- run_unrestricted_regression(lw22_transformed, FALSE)

# Print the summaries
print(summary_lw22_pre_2004)
print(summary_lw22_post_2003)



#Part d
# Simplified example of testing single risk factor restriction
test_single_risk_factor <- function(df) {
  # Assuming the risk factor model is rx2 ~ f1
  model <- lm(rx2 ~ f1, data = df)
  
  # Perform hypothesis test - example using Wald test
  waldtest(model, vcov = vcovHC(model, type = "HC"))
}

# Example usage for LW22 dataset
test_result_lw22 <- test_single_risk_factor(lw22_transformed)
print(test_result_lw22)

