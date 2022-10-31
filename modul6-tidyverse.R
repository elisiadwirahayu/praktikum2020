# Manipulasi data frame

library(tidyverse)
library(dslabs)
data("murders")

murders <- mutate(murders, rate = total / population * 100000)

head(murders)

filter(murders, rate <= 0.71)
filter(murders, rate <= 5, region == "South", total > 100)

new_table <- select(murders, state, region, rate)
filter(new_table, rate <= 0.71)
filter(new_table, rate <= 8, region == "South")


# Operator Pipe: %>%

murders %>% select(state, region, rate) %>% filter(rate <= 0.71)

16 %>% sqrt()

16 %>% sqrt() %>% log2()


# Menyimpulkan data

library(dplyr)
library(dslabs)
data("heights")

s <- heights %>%
filter(sex == "Female") %>%
summarize(average = mean(height), standard_deviation = sd(height))
s

s$average
s$standard_deviation

heights %>% group_by(sex)

heights %>%
  group_by(sex) %>%
  summarize(average = mean(height), standard_deviation = sd(height))


# Sorting Data Frames

murders %>%
  arrange(population) %>%
  head()

murders %>%
  arrange(rate) %>%
  head()

murders %>%
  arrange(desc(rate))

murders %>%
  arrange(region, desc(rate))

murders %>%
  arrange(region, rate) %>%
  head()

murders %>% top_n(5, rate)

murders %>%
  arrange(region, desc(rate)) %>%
  top_n(5)