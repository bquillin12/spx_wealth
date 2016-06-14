############################################
### Draw the wealth path for the S&P 500 ###
############################################

# packages
# install.packages(c("quantmod", "PerformanceAnalytics", "plotly"))
library(quantmod)
library(PerformanceAnalytics)
library(ggplot2)

# load data
sp500_fred <- na.omit(getSymbols("SP500", src = "FRED", auto.assign = FALSE, method = "curl")) 

# calculate daily returns 
sp500_fred.r <- dailyReturn(sp500_fred)

# subset for 2016 returns as we want this year's returns
sp500.subset <- sp500_fred.r["2016-01-01/2016-06-09"] 

# draw wealth path
cumret <- cumprod(1+sp500.subset)

# Plot with ggplot2
autoplot.zoo(cumret) +
  ggtitle("S&P 500 Wealth Path (Jan 2016 = $1.00)") +
  ylab("") +
  xlab("")

