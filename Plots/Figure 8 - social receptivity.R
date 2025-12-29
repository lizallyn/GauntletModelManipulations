library(ggplot2)
library(patchwork)
source("Plots/plotEaten.R")

times <- 100

# Base

read.rec_height <- read.csv("Outputs/Reps_Base_Manipulations_rec_height_list.csv")
rec.height_range <- read.rec_height$rec_height
read.eaten <- read.csv("Outputs/Reps_Base_Manipulations_rec_height_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
read.eaten$Value <- rec.height_range
read.eaten$Scenario <- "Base"
read.eaten_base <- read.eaten

# eaten_plot_height <- plotEaten(data = read.eaten, title = "\u03b8 = (0 - 1)", ylims = c(0, 4000), nominal = sqrt(0.5))

# No Fear

read.rec_height <- read.csv("Outputs/Reps_NoFear_Manipulations_rec_height_list.csv")
rec_height_range_nofear <- read.rec_height$rec_height
read.eaten <- read.csv("Outputs/Reps_NoFear_Manipulations_rec_height_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
read.eaten$Value <- rec_height_range_nofear
read.eaten$Scenario <- "Section 120"
read.eaten_nofear <- read.eaten

# eaten_plot_rec_height_nofear <- plotEaten(read.eaten, "\u03b8 = (0.01 - 0.5)", c(0, 4000), sqrt(0.5))

# Fear

read.rec_height <- read.csv("Outputs/Reps_Fear_Manipulations_rec_height_list.csv")
rec_height_range_fear <- read.rec_height$rec_height
read.eaten <- read.csv("Outputs/Reps_Fear_Manipulations_rec_height_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
read.eaten$Value <- rec_height_range_fear
read.eaten$Scenario <- "Hunting"
read.eaten_fear <- read.eaten

# eaten_plot_rec_height_fear <- plotEaten(read.eaten, "\u03b8 = (0.01 - 0.5)", c(0, 4000), sqrt(0.5))

read.eaten <- rbind(read.eaten_base, read.eaten_nofear, read.eaten_fear)
read.eaten$percent_Eaten <- read.eaten$Eaten / 10000 * 100
read.eaten$Scenario <- factor(read.eaten$Scenario, levels = c("Base", "Section 120", "Hunting"))

social_sensitivity_harvest_plot <- 
  ggplot() + 
  geom_point(data = read.eaten, aes(x = Value, y = percent_Eaten, color = Scenario), size = 1.5) +
  # geom_smooth(method = "lm") +
  geom_vline(xintercept = sqrt(0.5), linetype = 2) +
  scale_color_manual(values = c("#5182AF","#6DB562", "#F5A040")) + 
  ylim(c(0, 40)) +
  theme_classic(base_size = 16) + 
  labs(y = "% Run Consumed", x = expression("Social Receptivity"~italic("\u03b8")), color = "Management \nScenario")
social_sensitivity_harvest_plot
# ggsave(filename = "social_sensitivity_harvest_plot.png", plot = social_sensitivity_harvest_plot,
#        device = "png", path = "Plots/Plot Outputs", width = 10, height = 4, units = "in")

