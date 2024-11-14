library(dplyr)
d=read.csv("C:\\Users\\user\\Downloads\\penguins_size.csv")
d

glimpse(d)
head(d)
tail(d)
summary(d)

#find column names
names(d)

#find the null values
null=is.na(d)
null

#find the total count of null values
count=colSums(is.na(d))
count

#find the null val of specific column
null_cl=is.na(d$ body_mass_g )
null_cl

#total count of null values in specific column 
total_nulls <- sum(is.na(d$body_mass_g))
total_nulls

#arrange
head(arrange(d,culmen_length_mm))

#filter
head(filter(d,island=='Biscoe'))
 
#select
select(d,species,island,sex)



#creating a random subset of the penguins dataset
set.seed(4)
f=sample_n(d,12)
f

#arrange body_mass_g of subset
arrange(f, species)

#numeric data arranged in descending order
arrange(f,desc(culmen_length_mm))

#character data arranged in descending 
arrange(f,desc(island))

#filter with a single numeric condition
filter(f,culmen_depth_mm > 16.2)

# filter with a single character condition
filter(f,island == "Dream")

# filter with a single numeric condition between two values
filter(f,between(culmen_depth_mm, 16.2, 18.1 ))

#selecting species, flipper_length_mm, and sex columns
select(f,species, flipper_length_mm, sex)

# selecting all character data
select(f,where(is.character))

#selecting all numeric data
select(f,where(is.numeric))

# selecting all character data by using "where not numeric" data
select(f,!where(is.numeric))

#summarising the average body mass of penguins
summarise(f,avg_body_mass = mean(body_mass_g))

#mutate(new col-(body_mass_g / 453.59237 )values are placed)
y=mutate(f,body_weight_pounds = body_mass_g / 453.59237)
y$body_weight_pounds
y
select(y,species, body_mass_g,everything())


