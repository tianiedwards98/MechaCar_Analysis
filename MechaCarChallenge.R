# Part 1: -----------------------------------

#load dplyr package
library(dplyr)

#read file
table_df <- read.csv(file='MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

#perform linear regression
table_lm <- lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data = table_df)

#perform summary
summary(table_lm)

# Part 2: ------------------------------------

#read file
suspension_df <- read_csv(file='Suspension_Coil.csv')

#get a total summary
total_summary <- suspension_df %>% summarize(Mean=mean(PSI), Variance=var(PSI), SD=sd(PSI))

#create a lot summary
lot_summary <- suspension_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=(PSI), Variance=var(PSI),SD=sd(PSI))

# Part 3: --------------------------------------

#perform t-test to determine if the PSI across

#perform t-test across all Lots
t.test(suspension_df$PSI, mu = 1500)

#perform t-test on Lot 1
t.test(subset(suspension_df,Manufacturing_Lot == "Lot1")$PSI,mu = 1500 )

#perform t-test on Lot 2
t.test(subset(suspension_df,Manufacturing_Lot == "Lot2")$PSI,mu = 1500 )

#perform t-test on Lot 3
t.test(subset(suspension_df,Manufacturing_Lot == "Lot3")$PSI,mu = 1500 )
