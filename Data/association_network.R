# Creating fake association network from Zach's data
# see "social_associations_cleanup.R" in Case Studies repo

library(tidyr)

set.seed <- 5

## load associations from Zach for 735 EMB Zc over all years of monitoring
# 0s mean those individuals never overlapped (between or within years)
network <- read.csv("Data/social_network_associations_zac_EMB.csv")

# wide to long format
long_network <- network %>% 
  pivot_longer(!ID, names_to = "Buddy_ID", values_to = "Association")

# mean(long_network$Association)

# remove self-associations and make all 1 and 0
long_network <- long_network[-which(long_network$ID == long_network$Buddy_ID),]
long_network$Association[which(long_network$Association > 0)] <- 1

# check stats and viz
max(long_network$Association)
mean(long_network$Association)
hist(long_network$Association)

# describe a binomial dist to it
num_connections <- length(which(long_network$Association == 1))
total_nodes <- nrow(long_network)
prob_1 <- num_connections/total_nodes

# simulate fake data from the fitted beta and viz it
# round so almost-zeroes become zeroes again - janky zi workaround
sim_network <- data.frame(vals = rbinom(500000,1, prob_1))
write.csv(sim_network, "Data/simulated_association_network_1.csv")
# max(sim_network)
# mean(sim_network)
# hist(sim_network)
sim_network_2 <- data.frame(vals = rbinom(500000,1, prob_1))
write.csv(sim_network_2, "Data/simulated_association_network_2.csv")
sim_network_3 <- data.frame(vals = rbinom(500000,1, prob_1))
write.csv(sim_network_3, "Data/simulated_association_network_3.csv")

# double prob of association versions
prob_2 <- prob_1 * 2
sim_network_double <- data.frame(vals = rbinom(500000,1, prob_2))
write.csv(sim_network_double, "Data/simulated_association_network_double_1.csv")

# half prob of association version
prob_0.5 <- prob_1 * 0.5
sim_network_half <- data.frame(vals = rbinom(500000,1, prob_0.5))
write.csv(sim_network_half, "Data/simulated_association_network_half_1.csv")
