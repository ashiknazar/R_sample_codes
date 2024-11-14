#Variable plotting with ggplot
#install.packages("ggplot2")
#install.packages("ggplot2movies")
library(ggplot2)
library(ggplot2movies)

df <- movies
df


#q plot
qplot(x=year,y=rating,data=df,geom='density2d')


pl<-ggplot(movies,aes(x=year,y=rating))
pl

#2d bin chart
pl + geom_bin2d()
# control bin sizes
pl + geom_bin2d(binwidth=c(2,1))
#2d density plot
pl + geom_density2d()
#2d hex plot
#install.packages("hexbin")

pl + geom_hex()
#giving preferred color
pl + geom_hex() + scale_fill_gradient(high = 'red',low = 'blue')


#Bar plots with ggplot2
mpg

g <- ggplot(mpg,aes(class))
g
g + geom_bar()
g + geom_bar(aes(fill=drv))
g + geom_bar(aes(fill=drv),position = 'fill')

g + geom_bar(aes(fill=drv),position = 'dodge')

#BOXPLOTS WITH GGPLOT2
df <- mtcars
head(df)
qplot(factor(cyl),mpg,data=mtcars,geom='boxplot')

p1 <- ggplot(mtcars,aes(factor(cyl),mpg))
p1
p1 + geom_boxplot()
p1 + geom_boxplot() + coord_flip()
p1 + geom_boxplot(aes(fill=factor(gear)))
p1 +geom_boxplot(fill='red',color='black')
p1 +geom_line()

mpg
#scatter plot with ggplot
#coordinates and faceting with ggplot2
pl <- ggplot(mpg,aes(x=displ,y=hwy)) + geom_point()
pl

#setting x and y limits
pl + coord_cartesian(xlim = c(1,4),ylim = c(15,30))

p <- ggplot(mpg,aes(displ,cty)) + geom_point()
p
p + facet_grid(.~cyl)# all w.r.t. cyl
p + facet_grid(drv~.)# drv w.r.t all
p + facet_grid(drv ~ cyl) #drv w.r.t cyl


ibrary(ggplot2)#install.packages("ggplot2")

df<-mtcars
head(df)

p1<-ggplot(df,aes(x=mpg,y=hp))+geom_point()
p1

p1+theme_bw()
p1+theme_classic()
p1+theme_dark()
p1+theme_get()
p1+theme_light()
p1+theme_linedraw()
p1+theme_minimal()
p1+theme_void()

#ggthemes

library(ggthemes)
p1+theme_excel()
p1+theme_economist()
