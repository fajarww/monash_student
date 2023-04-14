#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
?round()
?mean()
?max()
?min()

revenue_in_K <- round((revenue/1000),0)
expenses_in_K <- round((expenses/1000),0)

profit <- revenue - expenses
profit
profit_in_K <- round((profit/1000),0)

profit_after_tax <- profit - (0.3*profit)
#tax rate is 30%
profit_after_tax
profit_after_tax_in_K <- round((profit_after_tax/1000),0)

profit_margin_in_percent <- round((profit_after_tax*100 / revenue), digits=0)
#equals to profit after tax divided by revenue
profit_margin_in_percent

good_months <- rep(NA,12)
#where the profit after tax was greater than the mean for the year
mean_profit_after_tax <- mean(profit_after_tax)
compare_mean_profit_after_tax <- rep(mean_profit_after_tax,12)
good_months <- profit_after_tax > compare_mean_profit_after_tax
good_months

bad_months <- rep(NA,12)
#where the profit after tax was greater than the mean for the year
bad_months <- profit_after_tax <= compare_mean_profit_after_tax
bad_months

best_month <- profit_after_tax == rep(max(profit_after_tax),12)
best_month

worst_month <- profit_after_tax == rep(min(profit_after_tax),12)
worst_month

?rbind()
Monthly_Report <- rbind(revenue_in_K,
                        expenses_in_K,
                        profit_in_K,
                        profit_after_tax_in_K,
                        profit_margin_in_percent,
                        good_months,
                        bad_months,
                        best_month,
                        worst_month)

Monthly_Report