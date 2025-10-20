# run the loop 100 times on base settings and take a look

times <- 100
salmon_eaten_reps <- rep(NA, times)
salmon_escaped_reps <- rep(NA, times)
salmon_list_reps <- data.frame(NA)
seal_prob_gauntlet_reps <- data.frame()
salmon_consumed_pv_reps <- data.frame()
gauntlet_seals_reps <- data.frame(NA)
seals_harvested_reps <- data.frame(NA)

## Parameter Manipulation Ranges
w_range <- runif(min = 100, max = 3550, n = times)
save_w <- tibble(Iteration = 1:times, w = w_range)

for(rep in 1:times){
  case.study <- "Base"
  run_count <- 1
  # case.study <- "N1"
  # case.study <- "B1"
  
  # bounds <- "Made-Up"
  bounds <- "High Consumption"
  # bounds <- "Low Consumption"
  
  # 01 Set-Up Functions
  source("Functions/makeArray.R")
  source("Functions/sampleBespoke.R")
  source("Functions/createHarvestPlan.R")
  source("Functions/createSalmonArrival.R")
  
  # 02 Prep Salmon Data
  source("CopyOfRunTheModel/Prep_Bioenergetics.R")
  source("CopyOfRunTheModel/Prep_Salmon_Data.R")
  
  # 03 Prep Pinniped Data
  source("CopyOfRunTheModel/Prep_Pinniped_Data.R")
  
  scenario <- "Boat"
  timing = "Weekly"
  days_per_week <- 7
  harvest_schedule <- rep(c(rep(0, 7-days_per_week), rep(1, days_per_week)), n_days/7)
  fear <- "Fear"
  participation <- 1
  catchability <- 0.1
  overlap_pv <- 0.5
  
  w["Pv"] <- w_range[rep]
  
  # Haulout Reduction?
  reduction <- 0
  source("Functions/hauloutReduction.R")
  
  # 04 Set Pars
  source("CopyOfRunTheModel/set_pars.R")
  
  # 05 Initialize Variables
  source("CopyOfRunTheModel/initialize_variables.R")
  
  # 06 Loop Functions
  source("CopyOfRunTheModel/loadLoopFunctions.R")
  
  # 07 Run The Loop
  source("ParameterManipulations/runLoop.R")
  
  # 08 Plots
  source("Functions/Plots_Pv.R")
  source("Functions/Plots_salmon.R")
  
  iter_salmon_consumed_pv <- cbind(rep(rep, days), 1:days, t(salmon_consumed_pv))
  iter_seal_prob_gauntlet <- cbind(rep(rep, days), 1:days, t(seal_prob_gauntlet))
  salmon_consumed_pv_reps <- rbind(salmon_consumed_pv_reps, iter_salmon_consumed_pv)
  seal_prob_gauntlet_reps <- rbind(seal_prob_gauntlet_reps, iter_seal_prob_gauntlet)
  salmon_escaped_reps[rep] <- salmon_escapement
  salmon_eaten_reps[rep] <- salmon_eaten
  gauntlet_seals_reps <- cbind(gauntlet_seals_reps, colSums(seal_forage_loc, na.rm = T))
  salmon_list_reps <- cbind(salmon_list_reps, salmon_list[,"Run1"])
  seals_harvested_reps <- cbind(seals_harvested_reps, H)
}

write.csv(save_w, "ParameterManipulations/Outputs/Reps_Fear_Manipulations_w_list.csv")
write.csv(salmon_eaten_reps, "ParameterManipulations/Outputs/Reps_Fear_Manipulations_w_salmon_eaten_output.csv")
write.csv(salmon_escaped_reps, "ParameterManipulations/Outputs/Reps_Fear_Manipulations_w_salmon_escaped_output.csv")
write.csv(salmon_list_reps, "ParameterManipulations/Outputs/Reps_Fear_Manipulations_w_gauntlet_salmon_output.csv")
write.csv(salmon_consumed_pv_reps, "ParameterManipulations/Outputs/Reps_Fear_Manipulations_w_consumed_per_output.csv")
write.csv(gauntlet_seals_reps, "ParameterManipulations/Outputs/Reps_Fear_Manipulations_w_gauntlet_seals_output.csv")
write.csv(seal_prob_gauntlet_reps,"ParameterManipulations/Outputs/Reps_Fear_Manipulations_w_prob_gauntlet_output.csv")
write.csv(seals_harvested_reps, "ParameterManipulations/Outputs/Reps_Fear_Manipulations_w_seals_harvested_output.csv")

# For interpreting reps outputs

