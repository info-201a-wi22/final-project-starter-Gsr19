DT2020 <- read.csv("../data/2020_LA_Crime_Dataset.csv")
DT2021 <- read.csv("../data/2021_LA_Crime_Dataset.csv")

library(dplyr)

Combined <- bind_rows(DT2020, DT2021)

Chopped <- select(Combined, "AREA.NAME", "Crm.Cd.Desc", "Weapon.Desc")
Chopped <- rename(Chopped, District = "AREA.NAME", Crime = "Crm.Cd.Desc", WeaponUsed = "Weapon.Desc")
Chopped <- group_by(Chopped, District)

Agg_Table <- table(Chopped$Crime, Chopped$District)

NonViol <- filter(Chopped, TRUE == is.na(WeaponUsed))
NonViolAgg_Table <-table(NonViol$Crime, NonViol$District)

Viol <- filter(Chopped, FALSE == is.na(WeaponUsed))
ViolAgg_Table <- table(Viol$Crime, Viol$District)
table(Viol$Crime, Viol$WeaponUsed)


#I Included three tables one for the total frequency of each crime in a district,
#One that only shows the frequency of Non-Violent crimes in a district,
#And one that only shows the Violent crime frequency in a district
#I also included a smaller table to show which crimes seems to use a particular style of weapon.
#In order to gauge how serious a violent crime is as they vary from automatic firearms to just hands.
#
#These tables help reveal the areas where Violent crime is persistent compared 
#to non-violent crimes showing where police presence could help save lives
#compared to areas mostly consisting of non-violent crime where police presence 
#would likely only save property from being stolen in that area and would just 
#drive people to steal from other areas.