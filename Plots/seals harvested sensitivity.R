library(reshape2)
library(paletteer)
library(ggplot2)
library(patchwork)
source("Plots/plotKilled.R")
times <- 100

# alpha
read.alpha <- read.csv("Outputs/Reps_Fear_Manipulations_alpha_list.csv")
alpha_range <- read.alpha$Alpha
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_alpha_seals_harvested_output.csv")
killed <- colSums(read.eaten[3:ncol(read.eaten)])
killed.sums <- data.frame(Iteration = 1:times,
                          Killed = killed,
                          Value = alpha_range)
killed_plot_alpha <- plotKilled(killed.sums, c(0, max(killed.sums$Killed + 5)), 0.6, 
                               xlab = expression("Search and Capture Efficiency"~italic("\u03b1")), as.perc = F)

# basex
read.basex <- read.csv("Outputs/Reps_Fear_Manipulations_base_x_list.csv")
base_x_range <- read.basex$base_x
base_x_spec_range_elevated <- read.basex$base_x_spec
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_basex_seals_harvested_output.csv")
killed <- colSums(read.eaten[3:ncol(read.eaten)])
killed.sums <- data.frame(Iteration = 1:times,
                          Killed = killed,
                          Value = base_x_range)

killed_plot_basex <- plotKilled(killed.sums, c(0, max(killed.sums$Killed + 5)), 0.01, 
                              xlab = expression("Baseline X Value"~italic(X[base])))

# cmax
read.cmax <- read.csv("Outputs/Reps_Fear_Manipulations_cmax_list.csv")
cmax_range <- read.cmax$cmax
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_cmax_seals_harvested_output.csv")
killed <- colSums(read.eaten[3:ncol(read.eaten)])
killed.sums <- data.frame(Iteration = 1:times,
                          Killed = killed,
                          Value = cmax_range)

killed_plot_cmax <- plotKilled(killed.sums, c(0, max(killed.sums$Killed + 5)), 6, 
                                xlab = expression("Maximum Daily Consumption"~italic("\u03c4")))

# decay
read.decay <- read.csv("Outputs/Reps_Fear_Manipulations_decay_list.csv")
decay_range <- read.decay$decay
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_decay_seals_harvested_output.csv")
killed <- colSums(read.eaten[3:ncol(read.eaten)])
killed.sums <- data.frame(Iteration = 1:times,
                          Killed = killed,
                          Value = decay_range)
killed_plot_decay <- plotKilled(killed.sums, c(0, max(killed.sums$Killed + 5)), 0.1, 
                               xlab = expression("Foraging Learning Decay Rate"~italic(d)))

# prop.spec
read.prop_spec <- read.csv("Outputs/Reps_Fear_Manipulations_prop_spec_list.csv")
prop_specialists_range <- read.prop_spec$prop_spec
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_prop_spec_seals_harvested_output.csv")
killed <- colSums(read.eaten[3:ncol(read.eaten)])
killed.sums <- data.frame(Iteration = 1:times,
                          Killed = killed,
                          Value = prop_specialists_range)
killed_plot_propspec <- plotKilled(killed.sums, c(0, max(killed.sums$Killed + 5)), 0.3, 
                                xlab = expression("Specialist Proportion %"))

# rec.height
read.rec_height <- read.csv("Outputs/Reps_Fear_Manipulations_rec_height_list.csv")
rec.height_range <- read.rec_height$rec_height
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_rec_height_seals_harvested_output.csv")
killed <- colSums(read.eaten[3:ncol(read.eaten)])
killed.sums <- data.frame(Iteration = 1:times,
                          Killed = killed,
                          Value = rec.height_range)
killed_plot_height <- plotKilled(killed.sums, c(0, max(killed.sums$Killed + 5)), sqrt(0.5), 
                                   xlab = expression("Social Receptivity"~italic("\u03b8")))

# rec.width
read.rec_width <- read.csv("Outputs/Reps_Fear_Manipulations_rec_width_list.csv")
rec.width_range <- read.rec_width$rec_width
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_rec_width_seals_harvested_output.csv")
killed <- colSums(read.eaten[3:ncol(read.eaten)])
killed.sums <- data.frame(Iteration = 1:times,
                          Killed = killed,
                          Value = rec.width_range)
killed_plot_width <- plotKilled(killed.sums, c(0, max(killed.sums$Killed + 5)), 15, 
                                 xlab = expression("Width of the Receptivity Curve"~italic("z")))

# step
read.step <- read.csv("Outputs/Reps_Fear_Manipulations_step_list.csv")
step_range <- read.step$step
step_spec_range <- read.step$step_spec
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_step_seals_harvested_output.csv")
killed <- colSums(read.eaten[3:ncol(read.eaten)])
killed.sums <- data.frame(Iteration = 1:times,
                          Killed = killed,
                          Value = step_spec_range)
killed_plot_step <- plotKilled(killed.sums, c(0, max(killed.sums$Killed + 5)), 0.05, 
                                xlab = expression("Foraging Learning Rate"~italic("\u03c3")))

# w
read.w <- read.csv("Outputs/Reps_Fear_Manipulations_w_list.csv")
w_range <- read.w$w
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_w_seals_harvested_output.csv")
killed <- colSums(read.eaten[3:ncol(read.eaten)])
killed.sums <- data.frame(Iteration = 1:times,
                          Killed = killed,
                          Value = w_range)
killed_plot_w <- plotKilled(killed.sums, c(0, max(killed.sums$Killed + 5)), 355, 
                               xlab = expression("Baseline Foraging Success"~italic("w")))

# learn.rate
read.learn_rate <- read.csv("Outputs/Reps_Fear_Manipulations_learn_rate_list.csv")
learn_rate_range <- read.learn_rate$learn_rate
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_learn_rate_seals_harvested_output.csv")
killed <- colSums(read.eaten[3:ncol(read.eaten)])
killed.sums <- data.frame(Iteration = 1:times,
                          Killed = killed,
                          Value = learn_rate_range)
killed_plot_L <- plotKilled(killed.sums, c(0, max(killed.sums$Killed + 5)), 0.15, 
                            xlab = expression("Fear Learning Rate"~italic("L")))

# rho
read.rho <- read.csv("Outputs/Reps_Fear_Manipulations_rho_list.csv")
rho_range <- read.rho$rho
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_rho_seals_harvested_output.csv")
killed <- colSums(read.eaten[3:ncol(read.eaten)])
killed.sums <- data.frame(Iteration = 1:times,
                          Killed = killed,
                          Value = rho_range)
killed_plot_rho <- plotKilled(killed.sums, c(0, max(killed.sums$Killed + 5)), 0.05, 
                            xlab = expression("Fear Learning Decay Rate"~italic("\u03c1")))

### composite Plot building

parameter_composite <- killed_plot_propspec + killed_plot_height + killed_plot_width + 
  killed_plot_basex + killed_plot_step + killed_plot_decay +
  killed_plot_alpha + killed_plot_cmax + killed_plot_w + 
  killed_plot_L + killed_plot_rho +
  plot_layout(axis_titles = "collect", ncol = 3)
parameter_composite
# ggsave(filename = "parameter_eaten_composite_plot.png",
#        plot = parameter_composite,
#        device = "png",
#        path = "Plots/Plot Outputs",
#        width = 10,
#        height = 12,
#        units = "in")



