
# harvest_days_during <- fishy_days
# harvest_activity_bar_during <- ggplot() +
#   geom_segment(aes(x = harvest_days_during[1], y = 0, 
#                    xend = harvest_days_during[length(harvest_days_during)], yend = 0), linewidth = 2) + 
#   xlim(1, days) + 
#   ylim(-0.01, 0.01) + 
#   theme_void()
# 
# harvest_days_fish <- fishery_dates
# harvest_activity_bar_fishing <- ggplot() +
#   geom_segment(aes(x = harvest_days_fish[1], y = 0, 
#                    xend = harvest_days_fish[length(harvest_days_fish)], yend = 0), linewidth = 2) + 
#   xlim(1, days) + 
#   ylim(-0.01, 0.01) + 
#   theme_void()

## Seals Comp Line Plots
read.seals.base <- read.csv("ParameterManipulations/Outputs/Reps_Base_Run_gauntlet_seals_output.csv")
read.seals.base <- read.seals.base[,-2]
colnames(read.seals.base) <- c("Day", 1:times)
seals_for_plot_base <- melt(data = read.seals.base, id.vars = colnames(read.seals.base)[1], 
                            variable.name = "Iteration", value.name = "Gauntlet_Seals")
seals_for_plot_base$Iteration <- as.numeric(seals_for_plot_base$Iteration)
seals_plot_base <- #plotSeals(seals_for_plot_base, "Base", "cividis", c(0, 85))
  ggplot(data = seals_for_plot_base) +
  geom_line(aes(x = Day, y = Gauntlet_Seals, group = Iteration, color = Iteration), 
            linewidth = 0.8) +
  scale_color_paletteer_c("ggthemes::Blue-Teal", direction = -1) +
  ylim(0, 80) +
  theme_classic(base_size = 12) +
  theme(legend.position = "none") +
  labs(y = "Seals at the Gauntlet", x = "Day", title = "Base")
seals_plot_base

read.seals.nofear <- read.csv("ParameterManipulations/Outputs/Reps_NoFear_Run_During_Low_gauntlet_seals_output.csv")
read.seals.nofear <- read.seals.nofear[,-2]
colnames(read.seals.nofear) <- c("Day", 1:times)
seals_for_plot_nofear_during <- melt(data = read.seals.nofear, id.vars = colnames(read.seals.nofear)[1], 
                                     variable.name = "Iteration", value.name = "Gauntlet_Seals")
seals_for_plot_nofear_during$Iteration <- as.numeric(seals_for_plot_nofear_during$Iteration)
seals_plot_nofear_during_low <- #plotSeals(seals_for_plot_nofear_during, "No Fear", "mako", c(0, 80))
  ggplot(data = seals_for_plot_nofear_during) +
  geom_line(aes(x = Day, y = Gauntlet_Seals, group = Iteration, color = Iteration),
            linewidth = 0.8) +
  scale_color_paletteer_c("ggthemes::Green", direction = -1) +
  ylim(0, 80) +
  theme_classic(base_size = 12) +
  theme(legend.position = "none") +
  labs(y = "Seals at the Gauntlet", x = "Day", title = "No Fear")

read.seals.fear <- read.csv("ParameterManipulations/Outputs/Reps_Fear_Run_During_Low_gauntlet_seals_output.csv")
read.seals.fear <- read.seals.fear[,-2]
colnames(read.seals.fear) <- c("Day", 1:times)
seals_for_plot_fear_during <- melt(data = read.seals.fear, id.vars = colnames(read.seals.fear)[1],
                                   variable.name = "Iteration", value.name = "Gauntlet_Seals")

seals_for_plot_fear_during$Iteration <- as.numeric(seals_for_plot_fear_during$Iteration)
seals_plot_fear_during_low <- #plotSeals2(read.seals.fear, "Fear", "rocket", c(0, 80))
  ggplot(data = seals_for_plot_fear_during) +
  geom_line(aes(x = Day, y = Gauntlet_Seals, group = Iteration, color = Iteration),
            linewidth = 0.8) +
  scale_color_paletteer_c("ggthemes::Orange", direction = -1) +
  ylim(0, 80) +
  theme_classic(base_size = 12) +
  theme(legend.position = "none") +
  labs(y = "Seals at the Gauntlet", x = "Day", title = "Fear")
seals_plot_fear_during_low
# "grDevices::Peach"


ch1_harvest_seals_comp_plot <- seals_plot_base / 
  seals_plot_nofear_during_low / seals_plot_fear_during_low
# ggsave(filename = "ch1_harvest_scenarios_comparison_seal_plot.png", device = "png",
#        path = "ParameterManipulations/Plots",
#        width = 15, height = 10, units = "in",
#       plot = ch1_harvest_seals_comp_plot)

# harvest_activity_bar / consumed_plot_nofear / seals_plot_nofear

## Box and Whisker - Eaten
read.eaten <- read.csv("ParameterManipulations/Outputs/Reps_Base_Run_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
eaten_base <- read.eaten

read.eaten <- read.csv("ParameterManipulations/Outputs/Reps_NoFear_Run_During_Low_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
eaten_nofear_during_low <- read.eaten

read.eaten <- read.csv("ParameterManipulations/Outputs/Reps_Fear_Run_During_Low_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
eaten_fear_during_low <- read.eaten

eaten_all <- data.frame(Iteration = eaten_base$Iteration, Base = eaten_base$Eaten,
                        NoFear = eaten_nofear_during_low$Eaten, Fear = eaten_fear_during_low$Eaten)
eaten_all_long <- melt(eaten_all, id.vars = colnames(eaten_all)[1], variable.name = "Scenario", value.name = "Eaten")
eaten_all_long$Eaten <- eaten_all_long$Eaten / 10000 * 100

ch1_scenario_eaten_comp_boxplot <- ggplot(data = eaten_all_long) +
  geom_boxplot(aes(x = Scenario, y = Eaten), 
               fill = c("#63B1C1","#6DB562", "#F6AC50")) + 
  theme_classic(base_size = 12) +
  labs(y = "% Run Consumed", x = "Management Scenario")
ch1_scenario_eaten_comp_boxplot
# ggsave(filename = "ch1_scenario_eaten_comp_boxplot.png", device = "png",
#        path = "ParameterManipulations/Plots",
#        width = 10, height = 10, units = "in",
#       plot = ch1_scenario_eaten_comp_boxplot)

ch1_harvest_seals_and_salmon_comp_plot <- (seals_plot_base / seals_plot_nofear_during_low / seals_plot_fear_during_low + 
    plot_layout(axis_titles = "collect")) | ch1_scenario_eaten_comp_boxplot
ch1_harvest_seals_and_salmon_comp_plot
# ggsave(filename = "ch1_harvest_scenarios_comparison_seals_and_salmon_plot_thesis.png", device = "png",
#        path = "Paper 1/Plot Outputs",
#        width = 8, height = 6, units = "in",
#       plot = ch1_harvest_seals_and_salmon_comp_plot)

# ch1_harvest_effort_comp_plot <- (seals_plot_gaps / seals_plot_effort + plot_layout(axis_titles = "collect")) | 
#   (eaten_plot_gaps / eaten_plot_effort + plot_layout(axis_titles = "collect"))
# ggsave(filename = "ch1_harvest_effort_comp_plot.png", device = "png",
#        path = "ParameterManipulations/Plots",
#        width = 15, height = 8, units = "in",
#       plot = ch1_harvest_effort_comp_plot)

## Seals Harvested Summary

# read.harvested.base <- read.csv("ParameterManipulations/Outputs/Reps_Base_Run_seals_harvested_output.csv")
# read.harvested.base <- read.harvested.base[,-2]
# colnames(read.harvested.base) <- c("Day", 1:times)
# mean(colSums(read.harvested.base)[-1])
# 
# read.harvested.nofear <- read.csv("ParameterManipulations/Outputs/Reps_NoFear_Run_During_Low_seals_harvested_output.csv")
# read.harvested.nofear <- read.harvested.nofear[,-2]
# colnames(read.harvested.nofear) <- c("Day", 1:times)
# mean(colSums(read.harvested.nofear)[-1])
# 
# read.harvested.fear <- read.csv("ParameterManipulations/Outputs/Reps_Fear_Run_During_Low_seals_harvested_output.csv")
# read.harvested.fear <- read.harvested.fear[,-2]
# colnames(read.harvested.fear) <- c("Day", 1:times)
# colSums(read.harvested.fear)
# mean(colSums(read.harvested.fear)[-1])

