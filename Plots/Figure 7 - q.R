library(ggplot2)
library(viridis)
source("Plots/plotEaten.R")

times <- 100
read.learn_rate <- read.csv("Outputs/Reps_Fear_Manipulations_learn_rate_q0.1_list.csv")
learn_rate_range <- read.learn_rate$learn_rate

# Salmon Eaten

read.eaten_q0.1 <- read.csv("Outputs/Reps_Fear_Manipulations_learn_rate_q0.1_salmon_eaten_output.csv")
colnames(read.eaten_q0.1) <- c("Iteration", "Eaten")
read.eaten_q0.1$Value <- learn_rate_range
read.eaten_q0.1$q <- 0.1

read.eaten_q0.3 <- read.csv("Outputs/Reps_Fear_Manipulations_learn_rate_q0.3_salmon_eaten_output.csv")
colnames(read.eaten_q0.3) <- c("Iteration", "Eaten")
read.eaten_q0.3$Value <- learn_rate_range
read.eaten_q0.3$q <- 0.3

read.eaten_q0.5 <- read.csv("Outputs/Reps_Fear_Manipulations_learn_rate_q0.5_salmon_eaten_output.csv")
colnames(read.eaten_q0.5) <- c("Iteration", "Eaten")
read.eaten_q0.5$Value <- learn_rate_range
read.eaten_q0.5$q <- 0.5

read.eaten <- rbind(read.eaten_q0.1, read.eaten_q0.3, read.eaten_q0.5)
read.eaten$q <- as.factor(read.eaten$q)
read.eaten$percent_Eaten <- read.eaten$Eaten / 10000 * 100


eaten_plot_L <- plotEaten(read.eaten_q0.1, "L = (0.01 - 0.3)", c(0, 3000), 0.15)

eaten_plot <- 
  ggplot() + 
  geom_point(data = read.eaten, aes(x = Value, y = percent_Eaten, color = q), size = 1.5) +
  geom_vline(xintercept = 0.15, linetype = 2) +
  scale_color_manual(values = c("#f9b666", "#EA6D20", "#9E3D22")) +
  ylim(c(0, 30)) +
  theme_classic(base_size = 16) + 
  # theme(text = element_text(family = "Candara")) +
  labs(y = "% Run Consumed", x = "Parameter L", title = "Fear learning rate = (0.01 - 0.3)", color = "Parameter q: \ncatchability")
eaten_plot

# ggsave(filename = "fear_sensitivity_q_levels_plot.png", plot = eaten_plot,
#        device = "png", path = "Paper 1/Plot Outputs", width = 10, height = 4, units = "in")
