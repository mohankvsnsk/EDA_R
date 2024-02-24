#Venkata Satya Nagendra Sai Krishna Mohan Kocherlakota 09/30/2023 ALY6000: -Project-2
cat("\014") # clears console
rm(list = ls()) # clears global environment
try(dev.off(dev.list()["RStudioGD"]), silent = TRUE) # clears plots
try(p_unload(p_loaded(), character.only = TRUE), silent = TRUE) # 
clears packages
options(scipen = 100) # disables scientific notion for entire R session
setwd("C:/Users/kvsns/OneDrive/Documents/Rprojects/Intro to Analytics/Week-2")
#Countries GDP Part-1 
#1
data_2015 <- read_csv("2015.csv") #Reading the data using tidyverse package
head(data_2015) # First 6 values of the data frame.
#2
names(data_2015) #Columns of data frame
#3
view(data_2015) #Viewing of data frame
#4
glimpse(data_2015) #Giving some total information regarding data frame.
#5
data_2015 <- clean_names(data_2015) #Clean name is used for better structure of data frame.
data_2015
#6
happy_df <- select(data_2015, country, region, happiness_score, freedom) #Selecting necessary columns and creating a new data frame using select function.
happy_df
#7
top_ten_df <- slice(happy_df, 1:10) #Selecting top 10 values using slice function.
top_ten_df
#8
no_freedom_df <- filter(happy_df, freedom < 0.20) #Filtering values using filter function
no_freedom_df
#9
best_freedom_df <- arrange(happy_df, desc(freedom))# Sorting using arrange function
best_freedom_df
#10
data_2015 <- mutate(data_2015, gff_stat= family+freedom+generosity) #Creating a new column using mutate function.
head(data_2015)
names(data_2015)
#11
happy_summary <- happy_df %>% summarise(mean_happiness = mean(happiness_score), max_happiness = max(happiness_score), mean_freedom = mean(freedom), max_freedom = max(freedom)) #Summary of all the columns of calculated on top and putting it into data frame.
happy_summary
#12
regional_stats_df <- happy_df %>% group_by(region) %>%
  summarise(country_count= n(), mean_happiness = mean(happiness_score), mean_freedom = mean(freedom)) #Creating a new data frame by using group by, pipeline summarise the rest of the value.
regional_stats_df
#13
europe <- data_2015 %>% group_by(region) %>% 
  filter(region %in% "Western Europe") %>%
  arrange(desc(happiness_rank)) %>%
  slice(1:10)
europe  #Creating Europe data frame to calculate mean of least Europe countries mean

eurpoe_gdp  = round(mean(europe$economy_gdp_per_capita),digits = 2)
eurpoe_gdp #Mean of Europe GDP

africa <- data_2015 %>% group_by(region) %>% 
  filter(region %in% "Sub-Saharan Africa") %>%
  slice(1:10)
africa #Creating Africa data frame to calculate mean of least Africa countries mean

africa_gdp =round(mean(africa$economy_gdp_per_capita), digits = 3)
africa_gdp #Calculation of mean of Africa GDP

gdp_df <- tibble(europe_gdp,africa_gdp)
gdp_df #Insertion of European and Africa GDP
#14
ggplot(regional_stats_df, aes(x = mean_happiness, y = mean_freedom,color = region)) +
  geom_point() +  # Scatter plot
  geom_smooth(method = "lm", color = "red", se = FALSE) +  # Regression line
  labs(title = "Scatter Plot with Regression Line", x = "Mean_happiness", y = "Mean_freedom", color = "region")

#Baseball Part-2
#1
baseball <- read.csv("baseball.csv") #Reading the data using tidyverse package
baseball
#2
names(baseball)
head(baseball)
str(baseball)
view(baseball)
#3
class(baseball) # Class of Data frame.
#4 Creating a data frame with age and many more mean of Home runs, etc
age_stats_df <- baseball %>% 
  group_by(Age) %>%
  summarise(count = n(), HR =mean(HR), H=mean(H), R=mean(R))
age_stats_df
#5
baseball <- baseball %>% filter(AB != 0) #Filtering values from Baseball data frame
baseball 
#6 & #7
baseball <- baseball %>% mutate(BA = round((H)/(AB), digits = 3))
baseball # Creating Batting average and rounding off the value of BA in Baseball data frame.
#8 & #9
baseball <- baseball %>% mutate(OBP = round((H+BB)/(AB+BB),digits = 3))
baseball #Calculating on-base percentage and rounding off it's value
#10
strikeout_artist <- baseball %>% arrange(desc(SO)) %>% slice(1:10)
strikeout_artist #Top 10 most strikeout players 
#11
ggplot(baseball, aes(x = HR, y = RBI)) +
  geom_point() +
  labs(x = "Number of Home Runs (HRs)", y = "Number of RBIs") +
  ggtitle("Scatterplot of HRs vs RBIs") # Create the scatter plot
#12
eligible_df <- baseball %>% filter(AB >= 300 | G >= 100)
eligible_df #Filtering 300 bats and played in 100 games players
#13  
hist_graph <- ggplot(eligible_df, aes(x = BA)) +
  geom_histogram(binwidth = 0.025, color = "blue", fill = "green") +
  labs(x = "BA", y = "Count") +
  ggtitle("Histogram of Batting Average")
hist_graph
#14
eligible_df <- eligible_df |> mutate(RankHR = rank(-1 * HR, ties.method = "min"))
eligible_df #Ranking and adding the columns of home runs
#15
eligible_df <- eligible_df |> mutate(RankRBI = rank(-1 * RBI, ties.method = "min"),RankOBP = rank(-1 * OBP, ties.method = "min"))
eligible_df #Ranking and adding the columns of runs batted in and on-base percentage.
#16
eligible_df <- eligible_df |> mutate(TotalRank = RankHR + RankRBI + RankOBP)
eligible_df #Ranking and adding the columns of home runs
#17
mvp_candidates <- eligible_df %>%
  arrange(TotalRank)%>%
  slice(1:20)
mvp_candidates #Top 20 ranks of the baseball 
#18
mvp_candidates_abbreviated <- mvp_candidates %>%
  select(First,Last,RankHR,RankRBI, RankOBP,TotalRank)
mvp_candidates_abbreviated #Creating a new data frame based on MVP_List                                                                   
