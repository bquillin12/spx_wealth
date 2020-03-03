############################################
### Draw the wealth path for the S&P 500 ###
############################################

# packages
# install.packages(c("quantmod", "PerformanceAnalytics", "ggplot2"))
library(quantmod)
library(PerformanceAnalytics)
library(ggplot2)
library(dygraphs)

# load data
sp500_fred <- na.omit(getSymbols("SP500", src = "FRED", auto.assign = FALSE, method = "curl")) 

sp500 <- na.omit(getSymbols("SPY", src = "yahoo", auto.assign = FALSE, method = "curl"))

# calculate daily returns 
sp500_d <- dailyReturn(sp500)

# subset for 2016 returns as we want this year's returns
sp500_d.subset <- sp500_d["2020-01-01/2020-03-02"] 

# draw wealth path
cumret <- cumprod(1+sp500_d.subset)

# Plot with dygraph
autoplot.zoo(cumret, color = "red") +
  ggtitle("S&P 500 Wealth Path (Jan 1 2020 = $1.00)") +
  ylab("") +
  xlab("") +
  theme_minimal() +
  theme(legend.position = "none") +
  theme(plot.title = element_text(hjust = 0.5))
