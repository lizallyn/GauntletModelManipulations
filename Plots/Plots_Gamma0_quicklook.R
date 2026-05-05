# Compare Gamma 0 to Gamma -1

# Num seals at Gauntlet
read.seals.base <- read.csv("Outputs_Gamma_-1/Reps_Base_Run_gauntlet_seals_output.csv")
read.seals.base <- read.seals.base[,-2]
colnames(read.seals.base) <- c("Day", 1:times)
seals_for_plot_base <- melt(data = read.seals.base, id.vars = colnames(read.seals.base)[1], 
                            variable.name = "Iteration", value.name = "Gauntlet_Seals")
seals_for_plot_base$Iteration <- as.numeric(seals_for_plot_base$Iteration)
seals_plot_0 <- #plotSeals(seals_for_plot_base, "Base", "cividis", c(0, 85))
  ggplot(data = seals_for_plot_base) +
  geom_line(aes(x = Day, y = Gauntlet_Seals, group = Iteration, color = Iteration), 
            linewidth = 0.8) +
  scale_color_paletteer_c("ggthemes::Blue-Teal", direction = -1) +
  ylim(0, 80) +
  theme_classic(base_size = 18) +
  theme(legend.position = "none") +
  labs(y = "Number of Seals at the Gauntlet", x = "Day", title = "Base")
seals_plot_0

read.seals.base <- read.csv("Outputs/Reps_Base_Run_gauntlet_seals_output.csv")
read.seals.base <- read.seals.base[,-2]
colnames(read.seals.base) <- c("Day", 1:times)
seals_for_plot_base <- melt(data = read.seals.base, id.vars = colnames(read.seals.base)[1], 
                            variable.name = "Iteration", value.name = "Gauntlet_Seals")
seals_for_plot_base$Iteration <- as.numeric(seals_for_plot_base$Iteration)
seals_plot_neg1 <- #plotSeals(seals_for_plot_base, "Base", "cividis", c(0, 85))
  ggplot(data = seals_for_plot_base) +
  geom_line(aes(x = Day, y = Gauntlet_Seals, group = Iteration, color = Iteration), 
            linewidth = 0.8) +
  scale_color_paletteer_c("ggthemes::Blue-Teal", direction = -1) +
  ylim(0, 80) +
  theme_classic(base_size = 18) +
  theme(legend.position = "none") +
  labs(y = "Number of Seals at the Gauntlet", x = "Day", title = "Base")
seals_plot_neg1

seals_plot_comp <- seals_plot_0 / seals_plot_neg1
seals_plot_comp

# Salmon eaten
read.0 <- read.csv("Outputs/Reps_Base_Run_salmon_eaten_output.csv")
read.neg1 <- read.csv("Outputs_Gamma_-1/Reps_Base_Run_salmon_eaten_output.csv")
eaten <- cbind(read.0, read.neg1[,2])
colnames(eaten) <- c("Iteration", "Eaten_0", "Eaten_-1")
boxplot(eaten[,-1])


