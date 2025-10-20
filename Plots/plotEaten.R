# functionalize plot for total consumed per parameter value


plotEaten <- function(data, title = "Parameter Range", ylims, nominal, xlab = NULL, as.perc = F){
  if(as.perc == T){
    data$Eaten <- data$Eaten / 10000 * 100
    ylab = "% Run Consumed"
  } else {ylab = "Total Salmon Consumed"}
  
  eaten_plot <- 
    ggplot(data = data) + 
    geom_point(aes(x = Value, y = Eaten), size = 1.5, color = "black") +
    geom_vline(xintercept = nominal, linetype = 2) +
    ylim(ylims) +
    theme_classic(base_size = 14) + 
    theme(legend.position = "none" ,
          axis.title.x = element_text(family = "Candara"),
          title = element_text(size = 12)) +
    labs(y = ylab, x = xlab, title = title)
  return(eaten_plot)
}

# plotEaten(read.eaten, title = "Base_x = (0 - 0.25)")
