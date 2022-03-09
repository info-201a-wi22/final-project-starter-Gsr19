library("dplyr")
library("shiny")
library("lubridate")
library("plotly")
library("ggplot2")
report <- fluidPage(
  h1("Crime in Los Angeles, California"),
  em("Authors: Tiffani Pham (tpham5@uw.edu), Aswin Sundar (aswinsun@uw.edu), Sonic Yao (sjy9@uw.edu), Garrett Ruth (gsr19@uw.edu)"),
  em("Affiliation |  INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
  em("Date: Winter 2022"),
  p("
    
    "),
  h2("Abstract"),
  p("Our main question is: What are the most common crimes that occur in Los Angeles, California, and why? This question is important because the types of crimes vary, and knowing what kind of crimes are more prominent in the city, it will help people address the issue and to keep the crimes limited. To address the question, we will look into the Los Angeles crime data, which includes several different factors, such as, dates and times occurred, area of occurrence, and we plan to not only look at the occurrences but to also explore why these crimes are happening."),
  p("
    "),
  h2("Keywords"),
  strong("crime; los angeles; california; crime purpose; crimes reported"),
  p("
    "),
  h2("Introduction"),
  p("Crime rates are continuing to increase, specifically in the well-known city of Los Angeles, California. For this project, we are diving into Los Angeles crime data from 2020 up until now. Our main objective is to extract from the dataset which crimes are the most common and likely to happen while also looking into why these crimes occur. With the uprise in crimes, it is important that we are helping out the key stakeholders to be aware of these crimes in order to prevent them from occurring and how to deal with them. We want to help create a safer community in Los Angeles, whereas there is a population of almost 4 million people, with many tourists going in and out of the city as well."),
  p("
    "),
  h2("Design Situation"),
  p("Framing Crime: Our topic is focused around the crime of a single mega-city which incorporates many aspects of society including, racism, poverty, abuse of power, and others. Here we are trying to categorize crime data based on their possible root causes to identify the biggest societal issues facing Los Angeles. 
  Human Values: Human values are deeply related to our issues as the issues facing the people are what leads to the crimes committed. Specifically how the issues that affect the people of Los Angeles have a role in the types of crime committed and what situations lead to the need to break the law. 
    Stakeholders: The LA police force and the local government are the most benefitted by our project as it can lead discussions and bill creation in order to address the problems highlighted in this project. All of this would also benefit the people of Los Angeles as the societal issues facing them can be more easily identified which hopefully would make it easier to solve them. 
    Benefits and Harms: Without actual people to filter through this data the data can be used to commit more police resources to underprivileged areas that need financial assistance to solve the crime issues and instead would be harmed by more police presence. Although, with the categories created we can distinguish these types of crimes by need instead of violent crimes."),
  p("
    "),
  h2("Research Questions"),
  p("1. What are the most common crimes that occur in Los Angeles, CA? 
  2. Why do these crimes occur? 
  3. Which months of the year have the most crimes that were reported?
  4. Which area in Los Angeles has the most crimes? 
    These questions are important to address because there is an increase in crime rates. By knowing the answers to these questions, police, citizens, society, etc. can predict and be aware of what crimes are likely to happen and prevent them from happening. It is important that as a society, we are keeping people as safe as possible and ensure that people are being ethical in their actions. These questions being answered will further community relations, better resource allocation and budget formations, and many more."),
  p("
    "),
  h2("The Dataset"),
  p("The dataset for crimes in LA, although having only 1 file, is quite complex. There are more than 250,000 observations and 28 features. Each observation represents a single case. The 28 attributes provide information on the record, victim, crime, location, and time. Features that will be important in our investigation includes the crime code, which indicates the severity of the crime, the area and area name and information about the victims. General information such as age, sex, and descent are presented in the data, however, no information on the offender is given. This Public Safety Data is released by the LAPD which comes with a certain credibility. We obtained the data from Kaggle, which is community based. This dataset was updated 7 months ago and uploaded by a Kaggle contributor. As this data is transcribed from the original crime reports from the LAPD, it is likely that the data collection is government funded. The data allows for crime mapping which highlights areas that are more prone to crime and this information is made available to the public in the hopes that they will make decisions to be safer. While the data may lead us to believe that it includes all crimes in Los Angeles, it only includes crimes with records in the LAPD's database. Unreported crime is potentially missing from the data and can create a large gap between the models created using this data and the real world. It is possible that victims choose to not report crimes due to various reasons and crimes such as rape often go unreported. This gap in one type of crime has the power to alter the public’s view of the world around them. Journalists or news that use this data for their statistics in their reports might be using accurate data, but the data is not necessarily an accurate representation of the population. Consumers of the articles could potentially be indirectly impacted by this data. Another important aspect of visualizing crime rates is the ratio between crime and population density in an area. Without context, areas may seem safe or unsafe just based on simple visualizations such as a basic crime map. Although it provides certain useful information, it is not all there is to it."),
  p("
    "),
  h2("Findings"),
  p(""),
)