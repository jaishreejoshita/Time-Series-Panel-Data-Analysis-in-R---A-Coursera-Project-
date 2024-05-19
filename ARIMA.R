## Time Series Analysis with R

## Task 1: Introduction to Time Series 

## Task 2:

# Load data - good time series example EuStockMarkets
data('EuStockMarkets')
?EuStockMarkets

# Covert data to time series format


# ARIMA Model

# Exploratory Analysis for time series components:
# Trend + Seasonality + Cyclicity



# Does it satisfy the core assumptions?

# Remove non-stationary part of the data - Unit Root Test
library("urca")
?ur.kpss



# Remove seasonality



# Model Fit


# Decide on the type of process

# Sample test (p,d,q) = (1,1,1)

#Maximum Likelihood


# Best Fit Model

library(forecast)


# Forecast



