
# INTRODUCTION
In this project, I worked with two datasets and performed various functions and operators. I also created plots and graphs as part of the project. Exploring packages such as tidyverse, janitor, and ggplot expanded my toolkit and enhanced the efficiency of data analysis. My main objective in completing this project was to gain a thorough understanding of all the packages and operators I used. Graphical visualization played a pivotal role in presenting my findings effectively.
## KEY-FINDINGS
## Part-1: - Countries GPD
### Problem 5: -
In this code, I have loaded the janitor package, in which I have used the "clean_names" function. Janitor is used for initial data exploration and cleaning, particularly for restructuring the data frame and addressing problematic variable names.
#### Clean column names for better structure of the data frame
data_2015 <- clean_names(data_2015)
#### A tibble: 158 × 13
   country      region     happiness_rank happiness_score standard_error economy_gdp_per_capita family health_life_expectancy
   <chr>        <chr>                 <dbl>           <dbl>           <dbl>                  <dbl> <dbl>                  <dbl>
 1 Switzerland  Western Europe          1             7.59            0.0341                  1.40  1.35                  0.941
 2 Iceland      Western Europe          2             7.56            0.0488                  1.30  1.40                  0.948
 3 Denmark      Western Europe          3             7.53            0.0333                  1.33  1.36                  0.875
 4 Norway       Western Europe          4             7.52            0.0388                  1.46  1.33                  0.885
 5 Canada       North America           5             7.43            0.0355                  1.33  1.32                  0.906
 6 Finland      Western Europe          6             7.41            0.0314                  1.29  1.32                  0.889
 7 Netherlands  Western Europe          7             7.38            0.0280                  1.33  1.28                  0.893
 8 Sweden       Western Europe          8             7.36            0.0316                  1.33  1.29                  0.911
 9 New Zealand  Australia & NZ          9             7.29            0.0337                  1.25  1.32                  0.908
10 Australia    Australia & NZ         10             7.28            0.0408                  1.33  1.31                  0.932
#### ℹ 148 more rows
#### ℹ 5 more variables: freedom <dbl>, trust_government_corruption <dbl>, generosity <dbl>, dystopia_residual <dbl>, gff_stat <dbl>

### Problem 11: -
In this code, I have utilized the pipeline operator "%>%" to efficiently execute multiple operators. This operator is a component of the dplyr package. Additionally, I have employed the "summarize" and "mutate" functions within the code.
#### Summary of the happiness data, calculating mean and max values for happiness score and freedom
happy_summary <- happy_df %>%
  summarise(
    mean_happiness = mean(happiness_score),
    max_happiness = max(happiness_score),
    mean_freedom = mean(freedom),
    max_freedom = max(freedom)
  )

#### View the summary data
happy_summary
#### A tibble: 1 × 4
  mean_happiness max_happiness mean_freedom max_freedom
            <dbl>          <dbl>         <dbl>       <dbl>
1            5.38           7.59         0.429       0.670
### Problem 13: -
In this section of the code, I have calculated a new variable called "Europe and Africa" and then separately computed their respective GDPs based on the economy's GDP per capita.

#### A tibble: 1 × 2
  europe_gdp africa_gdp
       <dbl>      <dbl>
1        1.23       0.523
### Problem 14: -
I used the ggplot2 package to create a scatter plot that visualizes the relationship between the mean happiness and mean freedom for each region. The data for this plot was extracted from the regional_stats_df data frame, which was created by grouping the original data frame by the "region" variable and calculating the mean happiness and freedom for each group.
Here’s the resulting scatter plot:

![image](https://github.com/user-attachments/assets/5ec54d66-47e5-44f6-83aa-10068c7c93d8)

## Part-2: - Baseball analysis
### Problem 6-9
I have used mutate and the formulae to calculate batting average and on-base percentage.
Last       | First | BA
--------------------------
Acker      | Jim   | 0.107
Adduci     | Jim   | 0.091
Aguayo     | Luis  | 0.211

Last       | First | OBP
--------------------------
Acker      | Jim   | 0.107
Adduci     | Jim   | 0.167
Aguayo     | Luis  | 0.255

### Problem 11: -
I utilized the ggplot package to create a scatter plot, providing information about the Home Runs (HR’s) and RBI’s of baseball data frame. I achieved this by utilizing the "baseball" data frame.
![image](https://github.com/user-attachments/assets/19aff4a6-06d1-488e-8905-add8219ad95d)
### Problem 13: -
I generated a histogram representing batting averages with a binwidth of 0.025. The histogram is displayed in blue with a green fill.
![image](https://github.com/user-attachments/assets/41b7b4d5-f681-4e63-8422-71bfc5625a75)
### Problem 17 & 18 : -
I have created a MVP candidates list and used rank function to sort using HR, RBI and OBP. I have calculated total rank= (RankHR + RankRBI + RankOBP). Created two new datasets “mvp_candidates” & “mvp_candidates_abbreviated”.
First	Last	RankHR	RankRBI	RankOBP	TotalRank
Don	Mattingly	7	5	8	20
Mike	Schmidt	2	2	16	20
Jesse	Barfield	1	7	45	53
Dwight	Evans	27	17	30	74
Kirby	Puckett	7	18	50	75
Jim	Rice	52	6	18	76
Pete	O'Brien	36	28	17	81
George	Bell	7	7	74	88
Kevin	McReynolds	27	18	45	90
Kirk	Gibson	19	34	41	94
### Problem 19: -
After a thorough analysis of the provided data, I recommend Mike Schmidt as the Most Valuable Player (MVP) for the league. Mike Schmidt demonstrated remarkable consistency in HR, RBI, and OBP rankings, which are vital statistics for evaluating a player's performance. His overall contribution to his team and individual excellence in multiple categories make him a strong candidate for the MVP award.
It is important to note that while Jesse Barfield also performed exceptionally well, Mike Schmidt's consistency and broader impact on his team give him the edge for the MVP title. The decision to exclude pitchers from MVP consideration is reasonable, as the dataset only provides information about position players.
## CONCLUSION
In conclusion, this project has been a valuable journey in the realm of data analysis and visualization for me. Working with two diverse datasets allowed me to apply a wide range of functions and operators, enhancing my data manipulation skills significantly. The creation of compelling plots and graphs added depth to my analysis and made my findings more accessible to a wider audience. In essence, this project has not only deepened my expertise in statistics and applied mathematics but has also reinforced the significance of data visualization as a powerful means of communication in the world of data science.
> testthat::test_file("project2_tests.R")
[ FAIL 0 | WARN 0 | SKIP 0 | PASS 39 ]
## CITATIONS

1.Overview of janitor functions. (2022, February 2).
https://cran.r-project.org/web/packages/janitor/vignettes/janitor.html#clean-dataframenames-with-clean_names
2.Zach. (2023). R: A Complete Guide to ties.method in rank Function. Statology.
https://www.statology.org/r-rank-ties-method/

---
## License

This dataset is provided under the MIT License.

---
