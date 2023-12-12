library(forecast)

sales_data<-data.frame(
  Month = seq(as.Date("2023-01-01"), as.Date("2023-12-01"), by = "months"),
  Sales = c(12000, 15000, 18000, 16000, 20000, 22000, 25000, 28000, 30000, 32000, 35000, 38000)
)
print(sales_data)
print(sales_data$Month)
print(sales_data$Sales)

# Convert to time series data/object for use with R functions for time series data analysis (Function: ts())
# Frequency 12 makes it a monthly time series (Jan-Dec due to 12 values of sales).
sales_ts <- ts(sales_data$Sales, frequency = 12)

print(sales_ts)

# Fit ARIMA model (From forecast package)
arima_model <- auto.arima(sales_ts)

# Forecast sales for the next 4 months
forecast_result <- forecast(arima_model, h = 4)

# Display forecast results
print(forecast_result)
plot(forecast_result)
