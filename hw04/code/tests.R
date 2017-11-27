# title: Tests
# description: Testing all of our functions
# ======================================================

# test script
library(testthat)
# source in functions to be tested
source('functions.R')
setwd("C://Users/macbookpro/Downloads/hw04")
sink('../output/test-reporter.txt')
test_file('tests.R')
sink()


# Testing remove_missing
context("remove_missing")
test_that("remove_missing correct",{
  expect_equal(remove_missing(c(1, 2, NA)), c(1, 2))
  expect_equal(remove_missing(c(1, NA)), c(1))
  expect_equal(remove_missing(c(1, 2, NA, NA)), c(1, 2))
  expect_equal(remove_missing(c(1, NA, NA)), c(1))
})

# Testing get_minimum
context("get_minimum")
test_that("get_minimum correct",{
  expect_equal(get_minimum(c(1, 2, NA)), c(1))
  expect_equal(get_minimum(c(1, NA)), c(1))
  expect_equal(get_minimum(c(1, 2, NA, NA)), c(1))
  expect_equal(get_minimum(c(3,1,NA, NA)), c(1))
})

# Testing get_maximum
context("get_maximum")
test_that("get_minimum correct",{
  expect_equal(get_maximum(c(1, 2, NA)), c(2))
  expect_equal(get_maximum(c(1, NA)), c(1))
  expect_equal(get_maximum(c(1, 2, NA, NA)), c(2))
  expect_equal(get_maximum(c(3,1,NA, NA)), c(3))
})

# Testing get_range
context("get_range")
test_that("get_range correct",{
  expect_equal(get_range(c(1, 2, NA)), c(1))
  expect_equal(get_range(c(1, NA)), c(1))
  expect_equal(get_range(c(1, 2, NA, NA)), c(1))
  expect_equal(get_range(c(3,1,NA, NA)), c(2))
})



# Testing get_quartile1
context("get_quartile1")
test_that("get_quartile1 correct",{
  expect_equal(get_quartile1(c(1, 2, 3, 4, 5)), c(2))
  expect_equal(get_quartile1(c(1, 2, 10, 12, 14)), c(2))
  expect_equal(get_quartile1(c(1, 2, 5, 6, 7, 8)), c(2.75))
  expect_equal(get_quartile1(c(3,1,22, 122113, 120)), c(3))
})

# Testing get_quartile3
context("get_quartile3")
test_that("get_quartile3 correct",{
  expect_equal(get_quartile3(c(1, 2, 3, 4, 5)), c(4.5))
  expect_equal(get_quartile3(c(1, 2, 10, 12, 14)), c(13))
  expect_equal(get_quartile3(c(1, 2, 5, 6, 7, 8)), c(7))
  expect_equal(get_quartile3(c(3,1,10, 12, 120)), c(66))
})

# Testing get_median
context("get_median")
test_that("get_median correct",{
  expect_equal(get_median(c(1, 2, 3, 4, 5)), c(3))
  expect_equal(get_median(c(1, 2, 10, 12, 14)), c(10))
  expect_equal(get_median(c(1, 2, 5, 6, 7, 8, 9)), c(6))
  expect_equal(get_median(c(3,1,10, 12, 120)), c(10))
})

# Testing get_average
context("get_average")
test_that("get_average correct",{
  expect_equal(get_average(c(1, 2, 3, 4, 5)), c(3))
  expect_equal(get_average(c(1, 2, 10, 12, 14)), c(7.8))
  expect_equal(get_average(c(1, 2, 5, 6, 7)), c(4.2))
  expect_equal(get_average(c(3,1,10, 12, 120)), c(29.2))
})

# Testing get_stdev
context("get_stdev")
test_that("get_average correct",{
  expect_equal(get_stdev(c(1, 2, 3, 4, 5)), c(1.581139))
  expect_equal(get_stdev(c(1, 2, 10, 12, 14)), c(5.932959))
  expect_equal(get_stdev(c(1, 2, 5, 6, 7)), c(2.588436))
  expect_equal(get_stdev(c(3,1,10, 12, 120)), c(50.96764))
})

# Testing count_missing
context("count_missing")
test_that("count_missing correct",{
  expect_equal(count_missing(c(1, 2, 3, NA, 5)), c(1))
  expect_equal(count_missing(c(1, NA, NA, 12, 14)), c(2))
  expect_equal(count_missing(c(1, 2, 5, 6, 7)), c(0))
  expect_equal(count_missing(c(NA, NA, NA, 12, 120)), c(3))
})

# Testing summary_stats, NEED TO FIX
context("summary_stats")
test_that("summary_stats correct",{
  expect_equal(summary_stats(c(1, 2, 3, NA, 5)), c(1))
  expect_equal(summary_stats(c(1, NA, NA, 12, 14)), c(2))
  expect_equal(summary_stats(c(1, 2, 5, 6, 7)), c(0))
  expect_equal(summary_stats(c(NA, NA, NA, 12, 120)), c(3))
})

# Testing print_stats, NEED TO FIX
context("print_stats")
test_that("print_stats correct",{
  expect_equal(print_stats(c(1, 2, 3, NA, 5)), c(1))
  expect_equal(print_stats(c(1, NA, NA, 12, 14)), c(2))
  expect_equal(print_stats(c(1, 2, 5, 6, 7)), c(0))
  expect_equal(print_stats(c(NA, NA, NA, 12, 120)), c(3))
})

# Testing drop_lowest
context("drop_lowest")
test_that("drop_lowest correct",{
  expect_equal(drop_lowest(c(1, 2, 3, 4, 5)), c(2, 3, 4, 5))
  expect_equal(drop_lowest(c(1, 4, 10, 12, 14)), c(4, 10, 12, 14))
  expect_equal(drop_lowest(c(1, 2, 5, 6, 7)), c(2, 5, 6, 7))
  expect_equal(drop_lowest(c(4, 12, 120)), c(12, 120))
})

# Testing score_homework
context("score_homework")
test_that("score_homework correct",{
  expect_equal(score_homework(c(1, 2, 3, 4, 5)), c(3))
  expect_equal(score_homework(c(1, 4, 10, 12, 14)), c(8.2))
  expect_equal(score_homework(c(1, 2, 5, 6, 7)), c(4.2))
  expect_equal(score_homework(c(4, 12, 120), drop = TRUE), c(66))
})

# Testing score_quiz
context("score_quiz")
test_that("score_quiz correct",{
  expect_equal(score_quiz(c(1, 2, 3, 4, 5), drop = FALSE), c(3))
  expect_equal(score_quiz(c(1, 4, 10, 12, 14),drop = TRUE), c(10))
  expect_equal(score_quiz(c(1, 2, 5, 6, 7), drop = TRUE), c(5))
  expect_equal(score_quiz(c(4, 12, 120), drop = TRUE), c(66))
})

# Testing score_lab
context("score_lab")
test_that("score_lab correct",{
  expect_equal(score_lab(10), c(80))
  expect_equal(score_lab(6), c(0))
  expect_equal(score_lab(2), c(0))
  expect_equal(score_lab(12), c(100))
})