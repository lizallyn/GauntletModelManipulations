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
prop_specialists_range <- runif(min = 0, max = 1, n = times)
save_prop_spec <- tibble(Iteration = 1:times, prop_spec = prop_specialists_range)

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
  
  # reset pars
  prop_specialists <- prop_specialists_range[rep]
  
  scenario <- "Boat"
  timing = "Weekly"
  days_per_week <- 7
  harvest_schedule <- rep(c(rep(0, 7-days_per_week), rep(1, days_per_week)), n_days/7)
  fear <- "Fear"
  participation <- 1
  catchability <- 0.1
  overlap_pv <- 0.5
  
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
  if(no_seals == F && no_zc == F && no_ej == F){
    source("Functions/rungeKutta_3.R")
    source("CopyOfRunTheModel/The_Loop_all.R")
    source("Functions/Plots_Ej.R")
    source("Functions/Plots_Zc.R")
  } else if(no_seals == F && no_zc == F && no_ej == T){
    source("Functions/rungeKutta_2.R")
    source("CopyOfRunTheModel/The_Loop_pv_zc.R")
    source("Functions/Plots_Zc.R")
  } else if(no_seals == F && no_zc == T && no_ej == T){
    source("Functions/rungeKutta.R")
    source("CopyOfRunTheModel/The_Loop_pv.R")
  } else {print(error_msg)}
  
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

write.csv(save_prop_spec, "ParameterManipulations/Outputs/Reps_Fear_Manipulations_prop_spec_list.csv")
write.csv(salmon_eaten_reps, "ParameterManipulations/Outputs/Reps_Fear_Manipulations_prop_spec_salmon_eaten_output.csv")
write.csv(salmon_escaped_reps, "ParameterManipulations/Outputs/Reps_Fear_Manipulations_prop_spec_salmon_escaped_output.csv")
write.csv(salmon_list_reps, "ParameterManipulations/Outputs/Reps_Fear_Manipulations_prop_spec_gauntlet_salmon_output.csv")
write.csv(salmon_consumed_pv_reps, "ParameterManipulations/Outputs/Reps_Fear_Manipulations_prop_spec_consumed_per_output.csv")
write.csv(gauntlet_seals_reps, "ParameterManipulations/Outputs/Reps_Fear_Manipulations_prop_spec_gauntlet_seals_output.csv")
write.csv(seal_prob_gauntlet_reps,"ParameterManipulations/Outputs/Reps_Fear_Manipulations_prop_spec_prob_gauntlet_output.csv")
write.csv(seals_harvested_reps, "ParameterManipulations/Outputs/Reps_Fear_Manipulations_prop_spec_seals_harvested_output.csv")

# For interpreting reps outputs

