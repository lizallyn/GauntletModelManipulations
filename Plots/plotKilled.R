# functionalize plot for total consumed per parameter value


plotKilled <- function(data, ylims, nominal, xlab = NULL, as.perc = F){
  if(as.perc == T){
    data$Killed <- data$Killed / 10000 * 100
    ylab = "% Pinniped Pop Killed"
  } else {ylab = "Total Pinnipeds Killed"}
  
  killed_plot <- 
    ggplot(data = data) + 
    geom_point(aes(x = Value, y = Killed), size = 1.5, color = "black") +
    geom_vline(xintercept = nominal, linetype = 2) +
    ylim(ylims) +
    theme_classic(base_size = 14) + 
    theme(legend.position = "none" ,
          #axis.title.x = element_text(family = "Candara"),
          title = element_text(size = 12)) +
    labs(y = ylab, x = xlab)
  return(killed_plot)
}

# plotEaten(read.eaten, title = "Base_x = (0 - 0.25)")
