

library(reshape2)
library(paletteer)
library(ggplot2)
library(patchwork)
source("Plots/plotEaten.R")
times <- 100

# alpha
read.alpha <- read.csv("Outputs/Reps_Fear_Manipulations_alpha_list.csv")
alpha_range <- read.alpha$Alpha
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_alpha_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
read.eaten$Value <- alpha_range

eaten_plot_alpha <- plotEaten(read.eaten, "Search and capture \nefficiency = (0.1 - 0.8)", c(0, 35), 
                              0.6, xlab = "\u03b1", as.perc = T)

# basex
read.basex <- read.csv("Outputs/Reps_Fear_Manipulations_base_x_list.csv")
base_x_range <- read.basex$base_x
base_x_spec_range_elevated <- read.basex$base_x_spec
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_basex_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
read.eaten$Value <- base_x_range

eaten_plot_basex <- plotEaten(read.eaten, expression("Baseline X value" == (0 - 0.1)), c(0, 35), 0.01, 
                              xlab = expression(X[base]), as.perc = T)

# cmax
read.cmax <- read.csv("Outputs/Reps_Fear_Manipulations_cmax_list.csv")
cmax_range <- read.cmax$cmax
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_cmax_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
read.eaten$Value <- cmax_range

eaten_plot_cmax <- plotEaten(read.eaten, "Maximum daily \nconsumption = (1 - 10)", c(0, 35), 6, 
                             xlab = expression("\u03c4"), as.perc = T)

# decay
read.decay <- read.csv("Outputs/Reps_Fear_Manipulations_decay_list.csv")
decay_range <- read.decay$decay
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_decay_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
read.eaten$Value <- decay_range

eaten_plot_decay <- plotEaten(read.eaten, "Foraging learning decay \nrate = (0 - 0.3)", c(0, 35), 0.1, 
                              xlab = expression("d"), as.perc = T)

# prop.spec
read.prop_spec <- read.csv("Outputs/Reps_Fear_Manipulations_prop_spec_list.csv")
prop_specialists_range <- read.prop_spec$prop_spec
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_prop_spec_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
read.eaten$Value <- prop_specialists_range

eaten_plot_propspec <- plotEaten(read.eaten, "Specialist Proportion = (0 - 1)", c(0, 35), 0.3, 
                                 xlab = expression("%"), as.perc = T)

# rec.height
read.rec_height <- read.csv("Outputs/Reps_Fear_Manipulations_rec_height_list.csv")
rec.height_range <- read.rec_height$rec_height
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_rec_height_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
read.eaten$Value <- rec.height_range

eaten_plot_height <- plotEaten(data = read.eaten, title = "Social receptivity = (0 - 1)", ylims = c(0, 35), nominal = sqrt(0.5), 
                               xlab = expression("\u03b8"), as.perc = T)

# rec.width
read.rec_width <- read.csv("Outputs/Reps_Fear_Manipulations_rec_width_list.csv")
rec.width_range <- read.rec_width$rec_width
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_rec_width_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
read.eaten$Value <- rec.width_range

eaten_plot_width <- plotEaten(read.eaten, "Width of the receptivity \ncurve = (3 - 30)", c(0, 35), 15, 
                              xlab = expression("z"), as.perc = T)

# step
read.step <- read.csv("Outputs/Reps_Fear_Manipulations_step_list.csv")
step_range <- read.step$step
step_spec_range <- read.step$step_spec
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_step_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
read.eaten$Value <- step_range

eaten_plot_step <- plotEaten(read.eaten, "Forgaing learning \nrate = (0.001 - 0.15)", c(0, 35), 0.05, 
                             xlab = expression("\u03c3"), as.perc = T)

# w
read.w <- read.csv("Outputs/Reps_Fear_Manipulations_w_list.csv")
w_range <- read.w$w
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_w_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
read.eaten$Value <- w_range

eaten_plot_w <- plotEaten(read.eaten, "Baseline foraging \nsuccess = (100 - 3550)", c(0, 35), 355, 
                          xlab = expression("w"), as.perc = T)

# learn.rate
read.learn_rate <- read.csv("Outputs/Reps_Fear_Manipulations_learn_rate_list.csv")
learn_rate_range <- read.learn_rate$learn_rate
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_learn_rate_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
read.eaten$Value <- learn_rate_range

eaten_plot_L <- plotEaten(read.eaten, "Fear learning rate = (0.01 - 0.3)", c(0, 35), 0.15, 
                          xlab = expression("L"), as.perc = T)

# rho
read.rho <- read.csv("Outputs/Reps_Fear_Manipulations_rho_list.csv")
rho_range <- read.rho$rho
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_rho_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
read.eaten$Value <- rho_range

eaten_plot_rho <- plotEaten(read.eaten, "Fear learning decay rate = (0 - 0.3)", c(0, 35), 0.05, 
                            xlab = expression("\u03c1"), as.perc = T)

### composite Plot vuilding

parameter_composite <- eaten_plot_propspec + eaten_plot_height + eaten_plot_width + 
  eaten_plot_basex + eaten_plot_step + eaten_plot_decay +
  eaten_plot_alpha + eaten_plot_cmax + eaten_plot_w + 
  eaten_plot_L + eaten_plot_rho +
  plot_layout(axis_titles = "collect", ncol = 3)
parameter_composite
# ggsave(filename = "parameter_eaten_composite_plot.png",
#        plot = parameter_composite,
#        device = "png",
#        path = "Plots/Plot Outputs",
#        width = 10,
#        height = 13,
#        units = "in")



