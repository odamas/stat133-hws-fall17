# Reading the CSV of the raw scores.
df = read.csv("desktop/stat-133/stat133-hws-fall17/hw04/data/rawdata/rawscores.csv")

# Sinking the structure of the data grame to a file inside the output folder.
sink(file = 'desktop/stat-133/stat133-hws-fall17/hw04/output/summary-rawscores.txt')
str(df)
apply(df, 2, summary_stats)
print_stats(df)
sink()

# Replacing NA's with zeros.
for (i in  names(df)) {
  df[i][is.na(df[i])] <- 0
}
# Rescaling QZ1
df$QZ1 <- rescale100(df$QZ1, 0, 12)

# Rescaling QZ2
df$QZ2 <- rescale100(df$QZ2, 0, 18)

# Rescaling QZ3
df$QZ3 <- rescale100(df$QZ3, 0, 20)

# Rescaling QZ4
df$QZ4 <- rescale100(df$QZ4, 0, 20)

# Rescaling and adding Test1 by rescaling ex1
df$test1 <- rescale100(df$EX1, 0, 80)

# Rescaling and adding Test2 by rescaling ex1
df$test2 <- rescale100(df$EX2, 0, 90)

# Adding variable homework to score data frame.
# Contains the overall homework score obtained by 
# dropping the lowest HW and then aversaging the 
# remaining scores.
df$homework[1] <- 100
for (i in c(2:334)) {
  df$homework[i] <- score_homework(unlist(
    df[i, 1:9], use.names = FALSE), drop = TRUE) 
}

# Adding quiz variable
df$quiz[1] <- 100
for (i in c(2:334)) {
  df$quiz[i] <- score_homework(unlist(
    df[i, 11:14], use.names = FALSE), drop = TRUE) 
}
# Adding lab variable
df$lab[1] <- 100
for (i in c(2:334)) {
  df$lab[i] <- score_lab(unlist(
    df[i, 10], use.names = FALSE)) 
}
# Adding overall
for (i in c(1:334)) {
  df$overall[i] <- .20 * unlist(df[i, 17]) + .25 * unlist(
    df[i, 18]) + .30*unlist(df[i, 19]) + .15*unlist(
      df[i, 20]) + .1*unlist(df[i, 21])
}
# Adding grades
score_overall <- function(n){
  if (n <= 50) {
    'F'
  }
  else if (n <= 60 && n > 50) {
    'D'
  }
  else if (n <= 70 && n > 60) {
    'C-'
  }
  else if (n <= 77.5 && n > 70) {
    'C'
  }
  else if (n <= 79.5 && n > 77.5) {
    'C+'
  }
  else if (n <= 82 && n > 79.5) {
    'B-'
  }
  else if (n <= 86 && n > 82) {
    'B'
  }
  else if (n <= 88 && n > 86) {
    'B'
  }
  else if (n <= 88 && n > 86) {
    'B+'
  }
  else if (n <= 90 && n > 88) {
    'A-'
  }
  else if (n <= 95 && n > 90) {
    'A'
  }
  else if (n <= 100 && n > 95) {
    'A+'
  }
}
# Adding grade
for (i in c(1:334)) {
  df$Grade[i] <- score_overall(
    unlist(df[i, 22], use.names = FALSE)) 
}

# Writing a for loop in which you use summary_stats and print_stats
# to export, via sink(), the summary statistics for Lab, Homework, Quiz
# Test1, Test2, and overall. They will all go inside of the output folder.

#coln = c("ATT", "Homework", "Quiz", "EX1", "EX2", "Overall")
#filen = c("Lab", "Homework", "Quiz", "Test1", "Test2", "Overall")
#for (i in 1:length(coln)) {
#  colname = coln[i]
#  filename = filen[i]
#  sink(paste('desktop/stat-133/stat133-hws-fall17/hw04/output/', filename, "stats.txt"))
#  summary_stats(unlist(df[,filename]))
#  print_stats(summary_stats(unlist(df[,filename])))
#  sink()
#}

sink(file = 'desktop/stat-133/stat133-hws-fall17/hw04/output/Lab-stats.txt')
summary_stats(df$lab)
#print_stats(df$lab)
sink()

sink(file = 'desktop/stat-133/stat133-hws-fall17/hw04/output/Homework-stats.txt')
summary_stats(df$homework)
#print_stats(df$lab)
sink()

sink(file = 'desktop/stat-133/stat133-hws-fall17/hw04/output/Quiz-stats.txt')
summary_stats(df$quiz)
#print_stats(df$lab)
sink()

sink(file = 'desktop/stat-133/stat133-hws-fall17/hw04/output/Test1-stats.txt')
summary_stats(df$test1)
#print_stats(df$lab)
sink()

sink(file = 'desktop/stat-133/stat133-hws-fall17/hw04/output/Test2-stats.txt')
summary_stats(df$test2)
#print_stats(df$lab)
sink()

sink(file = 'desktop/stat-133/stat133-hws-fall17/hw04/output/Overall-stats.txt')
summary_stats(df$overall)
#print_stats(df$lab)
sink()






