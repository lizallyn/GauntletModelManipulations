#salmon arrival plot for base Ch 1

read.arrival <- read.csv("ParameterManipulations/Outputs/Reps_Base_Run_salmon_arrival_output.csv")

Ch1_arrival_plot <- ggplot(data = read.arrival) +
  geom_line(aes(x = Day - 49, y = Run1), linewidth = 2) +
  theme_classic(base_size = 14) +
  labs(x = "Day", y = "Arriving Salmon Abundance")
# ggsave(filename = "Ch1_salmon_arrival_plot",
#        plot = Ch1_arrival_plot,
#        device = "png", width = 10, height = 5, units = "in",
#        path = "Paper 1/Plot Outputs")