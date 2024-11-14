library("readxl")



df=read_excel("C:/Users/91812/Downloads/insurance_data_2023.xlsx")
df()







dataset.cor() 
cor(dataset$Price, dataset$AGE)
# correlation for all variables
round(cor(dataset),
      digits = 2 # rounded to 2 decimals
)