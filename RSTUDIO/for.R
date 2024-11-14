vec <- c(1,2,3,4,5)

for(var in vec){
  
  print(var)
}

for(i in 1:length(vec)){
  print(vec[i])
}

#for loop over a list

li<-list(1,2,3,4,5)
for(var in li){
  print(var)
}


#for loop with a matrix
mat<- matrix(1:25,nrow=5)
mat

for(num in mat){
  print(num)
  
}
##########USER INPUT##########


user_input <- readline("Enter your name: ")

# Print the user's input
print(user_input)









#ELSE IF

if (temp>80){
  print("hot outside!")
}else if (temp>32 & temp<80){
  print("it is cooler outside")
}else{
  print("it is really cold outside!")
}

temp<-75

if(temp>80){
  print("hot outside!")
}else if (temp>50 & temp<80){
  print("nice outside")
}else if(temp>32 & temp<50){
  print("it is cooler outside")
}else{
  print("it is really cold outside!")
}

#item sold that day
ham<-10
cheese<-10
report<-"blank"
if(ham>=10 & cheese>=10){
  report<-"strong sale of both items"
}else if(ham==0 & cheese==0){
  report<-"nothing sell"
}else{
  report<-"we had some sales"
}
print(report)





#ELSE IF

if (temp>80){
  print("hot outside!")
}else if (temp>32 & temp<80){
  print("it is cooler outside")
}else{
  print("it is really cold outside!")
}

temp<-75

if(temp>80){
  print("hot outside!")
}else if (temp>50 & temp<80){
  print("nice outside")
}else if(temp>32 & temp<50){
  print("it is cooler outside")
}else{
  print("it is really cold outside!")
}

#item sold that day
ham<-10
cheese<-10
report<-"blank"
if(ham>=10 & cheese>=10){
  report<-"strong sale of both items"
}else if(ham==0 & cheese==0){
  report<-"nothing sell"
}else{
  report<-"we had some sales"
}
print(report)


