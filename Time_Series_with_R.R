## Time Series Analysis with R

## Task 1: Introduction to Time Series 

## Task 2:

# Load data - good time series example EuStockMarkets
data('EuStockMarkets')
?EuStockMarkets

# Covert data to time series format
tsData = EuStockMarkets[,1]
plot(tsData)

# ARIMA Model

# Exploratory Analysis for time series components:
# Trend + Seasonality + Cyclicity

components.ts = decompose(tsData)
plot(components.ts)

# Does it satisfy the core assumptions?

# Remove non-stationary part of the data - Unit Root Test
library("urca")
?ur.kpss

kpss_test<-ur.kpss(tsData, type = c("tau"), 
                   lags = c("short"), use.lag = NULL)
summary(kpss_test)

tsstationary = diff(tsData, differences=1)
plot(tsstationary)

# Remove seasonality
timeseriesseasonallyadjusted <- tsstationary - components.ts$seasonal
tsstationary <- diff(timeseriesseasonallyadjusted, differences=1)
plot(tsstationary)


# Model Fit
acf(tsstationary, lag.max=40)
pacf(tsstationary, lag.max=40)

# Decide on the type of process

# Sample test (p,d,q) = (1,1,1)

fitARIMA = arima(tsData, order=c(1,1,1),
                 seasonal = list(order = c(1,0,0), period = 12),
                 method="ML")#Maximum Likelihood
res=fitARIMA$residuals
plot(res)

# Best Fit Model

library(forecast)
model<-auto.arima(tsData, trace=TRUE)
plot(model$residuals)

# Forecast

predicted_values = forecast(model,h=200, level=c(99.5))
plot(predicted_values)

