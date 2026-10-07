""" in this exercise a python script was created to calculate the taxes of a country.
    the tax brackets for income can be found in "tax_income.csv" and "tax_assets.csv".
    the names, income, and assests of the citizen can be found in "taxpayer.csv".
    for the first part of this challenge the citizen data shoul be converted into a nested dictionary.
    next the taxes should be calculated and printed as a string following this rule: "Citizen "given name" "last name" has to pay "X" ducats as tax for this year"
    X is the amount of income tax outstanding.
    second, an asset tax should be calculated, as well as the overall taxes gained.
    for an added challenge the citizen "El Presidente" is exempt from paying taxes. """

import pandas as pd

taxes = pd.read_csv("taxpayer.csv", sep=",", header=0)                  # check your directory if error message occur
tax_brackets_income = pd.read_csv("tax_income.csv", sep=",", header=0)
tax_brackets_assets = pd.read_csv("tax_assets.csv", sep=",", header=0)

# convert the taxpayer.csv into a nested dictionary
taxpayer = {}
taxpayer = taxes.to_dict(orient="index")

# now we calculate the income and assets tax by looping through the nested dictionary.
# this loop uses an if statement to exempt "El Presidente" from paying taxes.
# Beware the floating point arithmetic.

for n in taxpayer.keys():
    if taxpayer[n]['First name'] == "El" and taxpayer[n]['Last name'] == "Presidente":
        income_tax = 0
        assets_tax = 0
        taxpayer[n]['Outstanding income tax'] = income_tax
        taxpayer[n]['Outstanding assets tax'] = assets_tax
    else:
        income = taxpayer[n]['Income']
        tax_perc = tax_brackets_income["Tax"]
        income = float(income)
        if income <= 10000:
            tax = tax_perc[0]
        elif income <= 30000:
            tax = tax_perc[1]
        elif income <= 70000:
            tax = tax_perc[2]
        else:
            tax = tax_perc[3]
        income_tax = income * tax
        income_tax = round(income_tax,2)
        taxpayer[n]['Outstanding income tax'] = income_tax
    
        assets = taxpayer[n]['Assets']
        tax_perc = tax_brackets_assets["Tax"]
        assets = float(assets)
        if assets <= 100000:
            tax = tax_perc[0]
        elif assets <= 500000:
            tax = tax_perc[1]
        elif assets <= 1000000:
            tax = tax_perc[2]
        else:
            tax = tax_perc[3]
        assets_tax = assets * tax
        assets_tax = round(assets_tax,2)
        taxpayer[n]['Outstanding assets tax'] = assets_tax
        
    total_tax = assets_tax + income_tax
    taxpayer[n]['Tax total'] = round(total_tax,2)
    print(f"Citizen {taxpayer[n]['First name']} {taxpayer[n]['Last name']} has to pay {taxpayer[n]['Tax total']} ducats as taxes this year")
