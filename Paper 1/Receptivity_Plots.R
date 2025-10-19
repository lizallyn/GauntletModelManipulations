
library(ggplot2)
library(patchwork)

x <- seq(0, 1, length.out = 1000)
naive_x = 0.01
m = sqrt(0.5)
b = 5
Rx <- (m*x^((naive_x*(b-2)+1)/(1-naive_x) - 1) * (1-x)^(b-1)) / 
  (naive_x^((naive_x*(b-2)+1)/(1-naive_x)-1)*(1-naive_x)^(b-1))
data.x <- data.frame(x = x, Rx = Rx)

# "Canela Text", "Hoefler Text"


receptivity.x <- ggplot(data.x) + 
  geom_line(aes(x = x, y = Rx), linewidth = 1) + 
  geom_vline(aes(xintercept = naive_x), color = "dodgerblue", linetype = 2, linewidth = 1) + 
  labs(y = "Receptivity (X)", x = "X") +
  theme_classic(base_size = 18) #+ 
  #theme(text = element_text(family = "STIX Two Math"))

y <- seq(0, 1, length.out = 1000)
naive_y = 0
m = sqrt(0.5)
b = 5
Ry <- (m*x^((naive_y*(b-2)+1)/(1-naive_y) - 1) * (1-x)^(b-1)) / 
  (naive_y^((naive_y*(b-2)+1)/(1-naive_y)-1)*(1-naive_y)^(b-1))
data.y <- data.frame(y = y, Ry = Ry)

receptivity.y <- ggplot(data.y) + 
  geom_line(aes(x = y, y = Ry), linewidth = 1) + 
  geom_vline(aes(xintercept = naive_y), color = "dodgerblue", linetype = 2, linewidth = 1) + 
  labs(y = "Receptivity (Y)", x = "Y") +
  theme_classic(base_size = 18) #+ 
  # theme(text = element_text(family = "STIX Two Math"))

receptivity_plot <- receptivity.x / receptivity.y
receptivity_plot
# ggsave(filename = "receptivity_combo_plot_thesis.png",
#        plot = receptivity_plot, path = "Paper 1/Plot Outputs",
#        device = "png", height = 6, width = 10, units = "in")
