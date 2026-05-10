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

## Seals All Mgmt Scenarios

## Seals Comp Line Plots Gamma = 0
read.seals.base <- read.csv("Outputs/Reps_Base_Run_gauntlet_seals_output.csv")
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
  theme_classic(base_size = 18) +
  theme(legend.position = "none") +
  labs(y = "Number of Seals at the Gauntlet", x = "Day", title = "Base (Gamma = 0")
seals_plot_base

read.seals.nofear <- read.csv("Outputs/Reps_NoFear_Run_During_Low_gauntlet_seals_output.csv")
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
  theme_classic(base_size = 18) +
  theme(legend.position = "none") +
  labs(y = "Number of Seals at the Gauntlet", x = "Day", title = "Section 120")

read.seals.fear <- read.csv("Outputs/Reps_Fear_Run_During_Low_gauntlet_seals_output.csv")
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
  theme_classic(base_size = 18) +
  theme(legend.position = "none") +
  labs(y = "Number of Seals at the Gauntlet", x = "Day", title = "Hunting")
seals_plot_fear_during_low


G0_harvest_seals_comp_plot <- seals_plot_base / 
  seals_plot_nofear_during_low / seals_plot_fear_during_low + 
  plot_annotation("Gamma = -1") + plot_layout(axis_titles = "collect")

## Seals Comp Line Plots Gamma = -1
read.seals.base <- read.csv("Outputs_Gamma_-1/Reps_Base_Run_gauntlet_seals_output.csv")
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
  theme_classic(base_size = 18) +
  theme(legend.position = "none") +
  labs(y = "Number of Seals at the Gauntlet", x = "Day", title = "Base (Gamma = -1)")
seals_plot_base

read.seals.nofear <- read.csv("Outputs_Gamma_-1/Reps_NoFear_Run_During_Low_gauntlet_seals_output.csv")
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
  theme_classic(base_size = 18) +
  theme(legend.position = "none") +
  labs(y = "Number of Seals at the Gauntlet", x = "Day", title = "Section 120")

read.seals.fear <- read.csv("Outputs_Gamma_-1/Reps_Fear_Run_During_Low_gauntlet_seals_output.csv")
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
  theme_classic(base_size = 18) +
  theme(legend.position = "none") +
  labs(y = "Number of Seals at the Gauntlet", x = "Day", title = "Hunting")
seals_plot_fear_during_low


G1_harvest_seals_comp_plot <- seals_plot_base / 
  seals_plot_nofear_during_low / seals_plot_fear_during_low + plot_annotation("Gamma = -1") + 
  plot_layout(axis_titles = "collect")

G1_harvest_seals_comp_plot | G0_harvest_seals_comp_plot

# Salmon eaten
read.0 <- read.csv("Outputs/Reps_Base_Run_salmon_eaten_output.csv")
read.neg1 <- read.csv("Outputs_Gamma_-1/Reps_Base_Run_salmon_eaten_output.csv")
eaten <- cbind(read.0, read.neg1[,2])
colnames(eaten) <- c("Iteration", "Eaten_0", "Eaten_-1")
boxplot(eaten[,-1])


## Box and Whisker - 

# Eaten with Gamma = -1
read.eaten <- read.csv("Outputs/Reps_Base_Run_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
eaten_base <- read.eaten

read.eaten <- read.csv("Outputs/Reps_NoFear_Run_During_Low_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
eaten_nofear_during_low <- read.eaten

read.eaten <- read.csv("Outputs/Reps_Fear_Run_During_Low_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
eaten_fear_during_low <- read.eaten

eaten_all <- data.frame(Iteration = eaten_base$Iteration, Base = eaten_base$Eaten,
                        Section120 = eaten_nofear_during_low$Eaten, Hunting = eaten_fear_during_low$Eaten)
eaten_all_long <- melt(eaten_all, id.vars = colnames(eaten_all)[1], variable.name = "Scenario", value.name = "Eaten")
eaten_all_long$Eaten <- eaten_all_long$Eaten / 10000 * 100

ch1_scenario_eaten_comp_boxplot_0 <- ggplot(data = eaten_all_long) +
  geom_boxplot(aes(x = Scenario, y = Eaten), 
               fill = c("#63B1C1","#6DB562", "#F6AC50")) + 
  theme_classic(base_size = 18) +
  labs(y = "% Run Consumed", x = "Management Scenario", title = "Gamma = 0")
ch1_scenario_eaten_comp_boxplot_0

# Eaten with Gamma = 0
read.eaten <- read.csv("Outputs_Gamma_-1/Reps_Base_Run_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
eaten_base <- read.eaten

read.eaten <- read.csv("Outputs_Gamma_-1/Reps_NoFear_Run_During_Low_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
eaten_nofear_during_low <- read.eaten

read.eaten <- read.csv("Outputs_Gamma_-1/Reps_Fear_Run_During_Low_salmon_eaten_output.csv")
colnames(read.eaten) <- c("Iteration", "Eaten")
eaten_fear_during_low <- read.eaten

eaten_all <- data.frame(Iteration = eaten_base$Iteration, Base = eaten_base$Eaten,
                        Section120 = eaten_nofear_during_low$Eaten, Hunting = eaten_fear_during_low$Eaten)
eaten_all_long <- melt(eaten_all, id.vars = colnames(eaten_all)[1], variable.name = "Scenario", value.name = "Eaten")
eaten_all_long$Eaten <- eaten_all_long$Eaten / 10000 * 100

ch1_scenario_eaten_comp_boxplot_1 <- ggplot(data = eaten_all_long) +
  geom_boxplot(aes(x = Scenario, y = Eaten), 
               fill = c("#63B1C1","#6DB562", "#F6AC50")) + 
  theme_classic(base_size = 18) +
  labs(y = "% Run Consumed", x = "Management Scenario", title = "Gamma = -1")
ch1_scenario_eaten_comp_boxplot_1

ch1_scenario_eaten_comp_boxplot_1 | ch1_scenario_eaten_comp_boxplot_0 + plot_layout(axis_titles = "collect")

## Salmon eaten per seal per day
# Gamma 0
consumed.per <- read.csv("Outputs/Reps_Base_Run_consumed_per_output.csv")
colnames(consumed.per) <- c("X", "Iteration", "Day", 1:num_seals)
consumed.long <- melt(consumed.per, id.vars = colnames(consumed.per[1:3]), variable.name = "Seal", 
                                                       value.name = "Consumed")

base_g0 <- ggplot(data = consumed.long[which(consumed.long$Iteration %in% c(1:25)),]) + 
  geom_point(aes(y = Consumed, x = Day, color = Iteration)) +
  labs(title = "Gamma = 0", subtitle = "Base", y = "Consumed per Seal")

consumed.per <- read.csv("Outputs/Reps_Fear_Run_During_Low_consumed_per_output.csv")
colnames(consumed.per) <- c("X", "Iteration", "Day", 1:num_seals)
consumed.long <- melt(consumed.per, id.vars = colnames(consumed.per[1:3]), variable.name = "Seal", 
                      value.name = "Consumed")

fear_g0 <- ggplot(data = consumed.long[which(consumed.long$Iteration %in% c(1:25)),]) + 
  geom_point(aes(y = Consumed, x = Day, color = Iteration)) +
  labs(subtitle = "Fear", y = "Consumed per Seal")
 
consumed.per <- read.csv("Outputs/Reps_NoFear_Run_During_Low_consumed_per_output.csv")
colnames(consumed.per) <- c("X", "Iteration", "Day", 1:num_seals)
consumed.long <- melt(consumed.per, id.vars = colnames(consumed.per[1:3]), variable.name = "Seal", 
                      value.name = "Consumed")

no_fear_g0 <- ggplot(data = consumed.long[which(consumed.long$Iteration %in% c(1:25)),]) + 
  geom_point(aes(y = Consumed, x = Day, color = Iteration)) +
  labs(subtitle = "No Fear", y = "Consumed per Seal")

# Gamma -1

consumed.per <- read.csv("Outputs_Gamma_-1/Reps_Base_Run_consumed_per_output.csv")
colnames(consumed.per) <- c("X", "Iteration", "Day", 1:num_seals)
consumed.long <- melt(consumed.per, id.vars = colnames(consumed.per[1:3]), variable.name = "Seal", 
                      value.name = "Consumed")
base_g1 <- ggplot(data = consumed.long[which(consumed.long$Iteration %in% c(1:25)),]) + 
  geom_point(aes(y = Consumed, x = Day, color = Iteration)) +
  labs(title = "Gamma = -1", subtitle = "Base", y = "Consumed per Seal")

consumed.per <- read.csv("Outputs_Gamma_-1/Reps_Fear_Run_During_Low_consumed_per_output.csv")
colnames(consumed.per) <- c("X", "Iteration", "Day", 1:num_seals)
consumed.long <- melt(consumed.per, id.vars = colnames(consumed.per[1:3]), variable.name = "Seal", 
                      value.name = "Consumed")

fear_g1 <- ggplot(data = consumed.long[which(consumed.long$Iteration %in% c(1:25)),]) + 
  geom_point(aes(y = Consumed, x = Day, color = Iteration)) +
  labs(subtitle = "Fear", y = "Consumed per Seal")

consumed.per <- read.csv("Outputs_Gamma_-1/Reps_NoFear_Run_During_Low_consumed_per_output.csv")
colnames(consumed.per) <- c("X", "Iteration", "Day", 1:num_seals)
consumed.long <- melt(consumed.per, id.vars = colnames(consumed.per[1:3]), variable.name = "Seal", 
                      value.name = "Consumed per")

no_fear_g1 <- ggplot(data = consumed.long[which(consumed.long$Iteration %in% c(1:25)),]) + 
  geom_point(aes(y = Consumed, x = Day, color = Iteration)) +
  labs(subtitle = "No Fear", y = "Consumed per Seal")

base_g1 / no_fear_g1 / fear_g1 + plot_layout(guides = "collect")  & 
  theme(legend.position = "none") | base_g0 / no_fear_g0 / fear_g0 + plot_layout(guides = "collect")
  
