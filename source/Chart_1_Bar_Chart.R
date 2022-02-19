library(dplyr)
data2020 <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-Gsr19/main/data/2020_LA_Crime_Dataset.csv", stringsAsFactors=FALSE)
data2021 <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-Gsr19/main/data/2021_LA_Crime_Dataset.csv", stringsAsFactors=FALSE)
crime_data_2020_2021 <- full_join(data2020, data2021)

library(ggplot2)

diff_areas <- unique(crime_data_2020_2021$AREA.NAME)

unique_area_count <- crime_data_2020_2021 %>%
  group_by(AREA.NAME) %>%
  summarize(count=n())

bar <- ggplot(data = unique_area_count) +
  geom_col(mapping = aes(x = reorder(AREA.NAME, +count), y = count),
           fill = "red2") +
  geom_text(aes(x = AREA.NAME, y = count, label=count),
            hjust = -.02, size = 2,
            position = position_dodge(width = 1),
            inherit.aes = TRUE) +
  coord_flip() +
  labs(
    title = "Crime Occurrences Each Area of Los Angeles",
    x = "Area in Los Angeles",
    y = "Crime Occurance Count"
  ) 


# The question we are trying to answer with this chart is: Which area in Los Angeles has the
# most crimes that were reported?
# The purpose of this chart is to show how many crimes were reported in each of the different
# areas of Los Angeles. We put the areas in order from area with most occurrences to least occurrences.
# By looking at the different areas, people are able to see where they are most safe in Los Angeles,
# and where there needs to be more regulation and awareness.
# From this chart, we can see that the area with the most crimes is 77th Street (18,346 observations),
# whereas the area with the least crimes is Foothill (9,578 observations). The top 3 areas that had
# the most crime occurrences were 77th Street, Pacific, and Central.
