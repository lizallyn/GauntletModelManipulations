# receptivity plots for papers and presentations
library(ggplot2)

x <- seq(0, 1, length.out = 1000)
naive_x <- 0.01
m <- sqrt(0.5)
b <- 15
Rx <- (m*x^((naive_x*(b-2)+1)/(1-naive_x) - 1) * (1-x)^(b-1)) / 
  (naive_x^((naive_x*(b-2)+1)/(1-naive_x)-1)*(1-naive_x)^(b-1))
plot(x, Rx)
x_data <- cbind(x, Rx)
x_receptivity_plot <- ggplot(x_data) + 
  geom_line(aes(x = x, y = Rx), linewidth = 2) + 
  labs(x = "", y = "") + 
  theme_classic(base_size = 16)

# ggsave(filename = "x_receptivity_plot_nolabels.png",
#        plot = x_receptivity_plot, device = "png",
#        path = "ParameterManipulations/Plots/",
#        width = 10, height = 5, units = "in")


eta_x <- 0.2

Psx <- Rx*eta_x + (1-Rx)*naive_x
plot(Rx, Psx)
text(0.5, 0.04, "x = 0.01")
text(0.5, 0.02, "social info = 0.2")

y <- seq(0, 1, length.out = 100)
Py <- 1-y
naive_Py = 0.999
m <- sqrt(0.5)
c <- 15
Ry <- m * exp(-c*y)
plot(y, Ry)
y_data <- cbind(y, Ry)

y_receptivity_plot <- ggplot(y_data) + 
  geom_line(aes(x = y, y = Ry), linewidth = 2) + 
  labs(x = "", y = "") + 
  theme_classic(base_size = 16)

ggsave(filename = "y_receptivity_plot_nolabels.png",
       plot = y_receptivity_plot, device = "png",
       path = "ParameterManipulations/Plots/",
       width = 10, height = 5, units = "in")

