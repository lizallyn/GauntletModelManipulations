ibrary(reshape2)
library(paletteer)
library(ggplot2)
library(patchwork)

times <- 100

# Gaps Lapses
read.gaps <- read.csv("Outputs/Reps_Fear_Effort_Lapses_range_gap.csv")
colnames(read.gaps) <- c("Iteration", "gaps")
gaps_range <- read.gaps$gaps

read.eaten <- read.csv("Outputs/Reps_Fear_Effort_Lapses_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
read.eaten$Value <- gaps_range
read.eaten$perc.Eaten <- read.eaten$Eaten / 10000 * 100

eaten_plot_gaps <- #plotEaten(read.eaten, "Days/Week = (1 - 7)", c(0, 4000), NULL)
  ggplot(data = read.eaten) + 
  geom_point(aes(x = Value, y = perc.Eaten), 
             color = "black", size = 1.5) +
  ylim(c(0, 40)) +
  theme_classic(base_size = 12) + 
  # theme(legend.position = "none" ,
  #       text = element_text(family = "Candara")
  # ) +
  labs(y = "% Run Consumed", x = "Days", title = "Gap Days = (1 - 21)")
eaten_plot_gaps


read.seals.base <- read.csv("Outputs/Reps_Fear_Effort_Lapses_gauntlet_seals_output.csv")
read.seals.base <- read.seals.base[,-2]
colnames(read.seals.base) <- c("Day", 1:times)
seals_for_plot_base <- melt(data = read.seals.base, id.vars = colnames(read.seals.base)[1], 
                            variable.name = "Iteration", value.name = "Gauntlet_Seals")
seals_for_plot_base$Value <- as.factor(read.gaps$gaps[match(seals_for_plot_base$Iteration, read.gaps$Iteration)])

# seals_plot_gaps <- plotSealsValue(seals_for_plot_base, "gaps = (1 - 21)", palette = "turbo",  c(0, 75))
seals_for_plot_base$Iteration <- as.numeric(seals_for_plot_base$Iteration)
seals_for_plot_base$Value <- as.numeric(seals_for_plot_base$Value)
seals_plot_gaps <-
  ggplot(data = seals_for_plot_base) +
  geom_line(aes(x = Day, y = Gauntlet_Seals, group = Iteration, color = Value),
            linewidth = 0.5, alpha = 0.75) +
  scale_color_viridis(discrete = F, option = "turbo") +
  ylim(0, 75) +
  theme_classic(base_size = 12) +
  theme(legend.position = "none") +
  labs(y = "Predators at the Gauntlet", x = "Day", title = "Lapses in Effort")

# Weekly Effort

read.effort <- read.csv("Outputs/Reps_Fear_Weekly_Effort_range_days.csv")
colnames(read.effort) <- c("Iteration", "effort")
effort_range <- read.effort$effort

read.eaten <- read.csv("Outputs/Reps_Fear_Weekly_Effort_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
read.eaten$Value <- effort_range
read.eaten$perc.Eaten <- read.eaten$Eaten / 10000 * 100

eaten_plot_effort <- #plotEaten(read.eaten, "Days/Week = (1 - 7)", c(0, 4000), NULL)
  ggplot(data = read.eaten) + 
  geom_point(aes(x = Value, y = perc.Eaten, group = Value), size = 1.5) +
  ylim(c(0, 40)) +
  theme_classic(base_size = 12) + 
  # theme(legend.position = "none" ,
  #       text = element_text(family = "Candara")
  # ) +
  labs(y = "% Run Consumed", x = "Days", title = "Days/Week = (1 - 7)")
eaten_plot_effort

read.seals.base <- read.csv("Outputs/Reps_Fear_Weekly_Effort_gauntlet_seals_output.csv")
read.seals.base <- read.seals.base[,-2]
colnames(read.seals.base) <- c("Day", 1:times)
seals_for_plot_base <- melt(data = read.seals.base, id.vars = colnames(read.seals.base)[1], 
                            variable.name = "Iteration", value.name = "Gauntlet_Seals")
seals_for_plot_base$Value <- as.factor(read.effort$effort[match(seals_for_plot_base$Iteration, read.effort$Iteration)])

# seals_plot_effort <- plotSealsValue(seals_for_plot_base, "days/week = (1 - 7)", palette = "turbo",  c(0, 100))
seals_for_plot_base$Iteration <- as.numeric(seals_for_plot_base$Iteration)
seals_for_plot_base$Value <- as.numeric(seals_for_plot_base$Value)
seals_plot_effort <-
  ggplot(data = seals_for_plot_base) +
  geom_line(aes(x = Day, y = Gauntlet_Seals, group = Iteration, color = Value),
            linewidth = 0.5, alpha = 0.75) +
  scale_color_viridis(discrete = F, option = "turbo") +
  ylim(0, 75) +
  theme_classic(base_size = 12) +
  theme(legend.position = "none") +
  labs(y = "Predators at the Gauntlet", x = "Day", title = "Weekly Effort")


ch1_harvest_effort_comp_plot <- (seals_plot_gaps / seals_plot_effort + plot_layout(axis_titles = "collect")) |
  (eaten_plot_gaps / eaten_plot_effort + plot_layout(axis_titles = "collect"))
ch1_harvest_effort_comp_plot
# ggsave(filename = "ch1_harvest_effort_comp_plot.png", device = "png",
#        path = "Paper 1/Plot Outputs",
#        width = 8, height = 5, units = "in",
#       plot = ch1_harvest_effort_comp_plot)
