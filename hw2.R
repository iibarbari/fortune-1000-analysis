getwd()
setwd('/Users/ilknurul/Desktop/data-project')
getwd()

data <- read.csv('fortune1000.csv')

library('ggplot2')

data$Sector <- as.factor(data$Sector)
data$Industry <- as.factor(data$Industry)

str(data)

qplot(
  x = Employees,
  data = data,
  xlab = "Employees",
  ylab = "",
  main = ("Distribution of Employee Count"),
  geom = "histogram",
  binwidth = 10000,
  fill = I("lightblue"),
  col = I("darkblue")
) +
  scale_x_continuous(limits = c(1000, 100000),
                     breaks = seq(1000, 100000, 10000))

qplot(
  x = Revenue,
  data = data,
  xlab = "Revenue (million)",
  ylab = "Number of companies",
  main = ("Distribution of Revenue"),
  geom = "histogram",
  binwidth = 1000,
  fill = I("lightblue"),
  col = I("darkblue")
) +
  scale_x_continuous(limits = c(1000, 100000),
                     breaks = seq(1000, 100000, 10000))

ggplot(data.frame(data$Sector), aes(x = data$Sector)) +
  geom_bar(color = "darkblue", fill = "lightblue") +
  ggtitle("Distribution of Sector") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggplot(data = data) +
  aes(x = Employees) +
  aes(y = Industry) +
  geom_point() +
  geom_smooth(method = "lm", se = T) +
  scale_x_continuous(limits = c(1000, 100000)) +
  scale_color_manual(values = c("black", "yellow")) +
  labs(col = "") +
  labs(title = "Distribution of Industry by Employees") +
  theme_bw()

qplot(
  x = Sector,
  y = Revenue,
  data = data,
  main = ('Distribution of Revenue by Sector'),
  geom = 'boxplot',
  color = 'purple'
) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  scale_y_continuous(limits = c(1000, 50000),
                     breaks = seq(1000, 50000, 10000))

library(dplyr)

first_quarter <-
  select(filter(data, Rank <= 250), c(Rank, Revenue, Sector))

qplot(
  x = Sector,
  y = Revenue,
  data = first_quarter,
  main = ('Distribution of Revenue by Sector for First 250 Companies'),
  geom = 'boxplot',
  color = 'purple'
) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  scale_y_continuous(limits = c(-1000, 50000),
                     breaks = seq(-1000, 50000, 10000))
