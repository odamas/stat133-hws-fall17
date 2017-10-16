# title: NBA data Prep
# description:data preparation phase. The primary goal of this stage is to create a csv data file nba2017-teams.csv 
# that will contain the required variables to be used in the ranking analysis.
# input(s): nba2017-stats.csv, nba2017-roster .csv
# output(s): teams.csv, teams_star_plot.pdf,teams-summary.txt, experience_salary.pdf


## Download the files
library(dplyr)
setwd('/Users/macbookpro/stat133/stat133-hws-fall17/hw03')
nba_stats <- read.csv('../hw03/data/nba2017-stats.csv', stringsAsFactors = FALSE)
nba_roster <- read.csv('../hw03/data/nba2017-roster .csv', stringsAsFactors = FALSE)

##Adding new variables
nba_stats <- mutate(nba_stats, missed_fg = field_goals_atts - field_goals_made)
nba_stats <- mutate(nba_stats, points = 3*points3_made + 2*points2_made + points1_made)
nba_stats <- mutate(nba_stats, rebounds = off_rebounds + def_rebounds)
nba_stats <- mutate(nba_stats,  missed_ft = points1_atts - points1_made)
nba_stats <- mutate(nba_stats, efficiency = (points + rebounds + assists + steals + blocks - missed_fg - missed_ft - turnovers) / games_played)

                    

##Merging Tables
nba2017_teams <- merge(nba_stats,nba_roster,by="player")
nba2017_teams
sink(NULL)
nba2017_teams <- merge(nba_stats,nba_roster,by="player")

##summarize
nba2017_teams <-summarise(group_by(nba2017_teams, team),experience = sum(experience), salary = sum(salary)/1000000,points3 = sum(points3_made), points2 = sum(points2_made), free_throws = sum(points1_made), points = sum(points), off_rebounds = sum(off_rebounds), 
                          def_rebounds =sum(def_rebounds), assists = sum(assists), steals = sum(steals), blocks = sum(blocks), turnovers = sum(turnovers),  fouls = sum(fouls), efficiency = sum(efficiency))
is.data.frame(nba2017_teams)
nba2017_teams
summary(nba2017_teams[ ,c('experience','salary', 'points3','points2','free_throws','points','off_rebounds','efficiency', 'def_rebounds', 'assists','steals','blocks','turnovers','fouls')])

##Use sink() to send the R output of the teams summary to a text file named teams-summary.txt inside the data/ folder.
sink(file = '../hw03/data/teams-summary.txt ')
summary(nba2017_teams[ ,c('experience','salary', 'points3','points2','free_throws','points','off_rebounds','efficiency', 'def_rebounds', 'assists','steals','blocks','turnovers','fouls')])
sink()

## export the teams table to a csv file named nba2017-teams.csv, inside the data/ folder
write.csv(nba2017_teams, file = "../hw03/data/nba2017_teams.csv")

##star plot of the teams.
setwd('/Users/macbookpro/stat133/stat133-hws-fall17/hw03')
pdf("images/teams_star_plot.pdf")
stars(nba2017_teams[ ,-1], labels = nba2017_teams$team)
dev.off()

## scatter plot
pdf("images/experience_salary.pdf")
ggplot(data = nba2017_teams , aes(x = experience, y = salary)) +
  geom_point() + geom_text(aes(label=team),hjust=0, vjust=0)
dev.off()

