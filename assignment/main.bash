#!/bin/bash

# Prompt the user to enter employee name, hours worked, and rate per hour
read -p "Enter employee name: " name
read -p "Enter hours worked: " hours_worked
read -p "Enter rate per hour: " rate_per_hour

# Calculate basic pay
basic_pay=$(echo "$hours_worked * $rate_per_hour" | bc)

# Calculate tax based on basic pay
if [ $(echo "$basic_pay > 70000" | bc) -eq 1 ]; then
    tax=$(echo "0.25 * $basic_pay" | bc)
elif [ $(echo "$basic_pay >= 15000" | bc) -eq 1 ]; then
    tax=$(echo "0.15 * $basic_pay" | bc)
else
    tax=0
fi

# Calculate net pay
net_pay=$(echo "$basic_pay - $tax" | bc)

# Display results
echo "Employee Name: $name"
echo "Basic Pay: $basic_pay"
echo "Tax: $tax"
echo "Net Pay: $net_pay"



