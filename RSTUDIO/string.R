str<-"hello"
print(str)

str1<-'gfdhyftyudfgtsdf,
sdfgsdfghjxcvbn,
  fdghytresdfg,
ghjydscvbjuytresdfgh'
print(str1)

#removing \n
cat(str1)

strr<-"hello word!"
nchar(strr)



#arithemetics
#addition
#subtraction
#division

#comparison
#basic lists

v<-c(1,2,3,4,5) #vector
m<-matrix(1:10,nrow=2)
df<-women
print(v)
print(m)
print(df)

l <-list(v,m,df)
print(l)

li<-list(vector=v,metrix=m,dataframe=df)
print(li)
li[1]
li['vector']
li[['vector']]
li$vector

class(li['vector'])

li[['vector']][1]
li[['metrix']][2]
li[['vector']][4]

li[['metrix']][1:2,2:3]

double_list<-c(li,li)
double_list
str(double_list)

1:10
v<-1:10
matrix(v)
matrix(v,nrow=2)

matrix(1:12,byrow=TRUE,nrow=4)
matrix(1:12,byrow=FALSE,nrow=4)

google<-c(600,400,550,320,420)
mcsf<-c(300,150,400,350,280)
stocks<-c(google,mcsf)
stock.matrix<-matrix(stocks,byrow=TRUE,nrow=2)
stock.matrix


ord.cat<-c('cold','med','hot')
temps<-c('cold','med','cold','med','hot','cold','cold')
fact.temps<-factor(temps,ordered=TRUE,levels=ord.cat)
fact.temps
summary(temps)
summary(fact.temps)

math<-matrix(1:50,byrow=TRUE,nrow=5)
math

2*math
1/math
math^2
math<17



matrix<-matrix(1:9,nrow=3)
matrix
