# Assignment: ASSIGNMENT 4.2.1
# Name: Panda,Debasish 
# Date: 2022-07-05
#Analysis of Test Scores

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Load the pastecs package
library(pastecs)

## Set the working directory to the root of your DSC 520 directory
#setwd('C:\Users\debas\OneDrive\Desktop\Bellevue\dsc520')

## Load the `data/scores.csv` to Scores
Scores_df <- read.csv("data/scores.csv")


## 1.What are the observational units in this study?
str(Scores_df)

#There are 2 (score and count) observational units in the given study. 


## 2.Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?
str(Scores_df)
summary(Scores_df)

#Section is the categorical variable for the study.
#Count and Score are quantitative variables for the study.


#3.Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section.

reg_df <-Scores_df[which(Scores_df$Section=='Regular'),]
head(reg_df)
sport_df<-Scores_df[which(Scores_df$Section=='Sports'),]
head(sport_df)

# 4.Use the Plot function to plot each Sections scores and the number of 
# students achieving that score. Use additional Plot Arguments to label the 
# graph and give each axis an appropriate label. Once you have produced your 
# Plots answer the following questions:


plot(reg_df$Score,reg_df$Count,type='h',xaxt="n",xlab="Score in Regular Section",ylab="Count of students")
axis(1, at = seq(200, 400, by = 10), las=2)

plot(sport_df$Score,sport_df$Count,type='h',xaxt="n",xlab="Score in Sports Section",ylab="Count of students")
axis(1, at = seq(200, 400, by = 10), las=2)


# 4.a. Comparing and contrasting the point distributions between the two section, 
# looking at both tendency and consistency: Can you say that one section tended 
# to score more points than the other? Justify and explain your answer.

#By looking at the two histograms plots, it seems that sports section students
#scored more higher makes > 300.


# 4.b. Did every student in one section score more points than every student in 
# the other section? If not, explain what a statistical tendency means in this context.

stat.desc(reg_df[,1:2], basic=TRUE, desc=TRUE, norm=FALSE, p=0.95)
stat.desc(sport_df[,1:2], basic=TRUE, desc=TRUE, norm=FALSE, p=0.95)


bar <- ggplot(Scores_df, aes(Score,Count, fill = Section))
bar + stat_summary(fun = mean, geom = "bar", position="dodge",width = 8)+ facet_wrap( ~ Section)


#Total number of students in regular section is 290 and their mean score is 327.63
#Total number of students in sports section is 260 and their mean score is 307.37
#Seems like every student in sports section has not score more points than every student in regular section.



# 4.c. What could be one additional variable that was not mentioned in the narrative 
# that could be influencing the point distributions between the two sections?

#In my opinion we could have 'gender' as an additional variable that could potemtially be influencing the point 
#distributions between the two sections