getwd()
setwd("C:/PERSONAL STORAGE/Software Devlopment Tools/R Studio/gg plot")
getwd()

#-------------------------------DATA-----------------------------------#


movies <- read.csv("MovieRatings.csv")
head(movies)
colnames(movies)  <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions","Year")
summary(movies)

#str(movies)

#movies$Year <- factor(movies$Year)

#movies$Film <- factor(movies$Film)

#summary(movies)

#str(movies)

#---------------------------------AESTHETICS-----------------------------#


library(ggplot2)
ggplot(data = movies, aes(x = CriticRating, y=AudienceRating))


#----------------------------------ADDING GEOMETRY-----------------------------#

ggplot(data= movies, aes(x = CriticRating, y = AudienceRating)) + geom_point()


#------------------------------------ADD COLOUR--------------------------------#

ggplot(data= movies, aes(x= CriticRating, y =AudienceRating, colour = Genre)) + geom_point()


#------------------------------------ADD SIZE ------------------------------#

ggplot(data = movies, aes(x= CriticRating, y=AudienceRating, colour = Genre, size= BudgetMillions)) +
  geom_point()

#-------------------------------PLOTTING WITH LAYERS----------------------------#

p <- ggplot(data = movies, aes(x = CriticRating, y= AudienceRating, colour = Genre, size=BudgetMillions)) 



#--------Point
p + geom_point()

#-------Lines

p + geom_line()

#-------Multiple Layers

p + geom_point() + geom_line()
p + geom_line() + geom_point() 

#-------------OVERWRITING AESTHETICS

q <- ggplot(data = movies, aes(x = CriticRating, y= AudienceRating, colour = Genre, size=BudgetMillions)) 

q + geom_point(aes(size= CriticRating))


q + geom_point(aes(color = BudgetMillions))

q  + geom_line(size = 1) + geom_point()

q + geom_point(aes(x = BudgetMillions)) +
  xlab("BudgetMillions")

#------------------------------MAPPING---------------------#

r <- ggplot(data= movies, aes(x = CriticRating, y = AudienceRating)) 

r + geom_point(aes(size = BudgetMillions))


#-------------------------HISTOGRAMS AND DENSITY-------------------------#

s <- ggplot(data = movies, aes(x = BudgetMillions))

s + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black")

s + geom_density(aes(fill=Genre))

s + geom_density(aes(fill=Genre), position =  "Stack")


t <- ggplot(data = movies, aes(x = AudienceRating))

t + geom_histogram(binwidth = 10, fill="white", colour = "Blue")


t + geom_density(aes(fill=Genre))


#-------------------------------------------------------------------------------#

k <- ggplot(data = movies)

k + geom_histogram(binwidth= 10, aes(x = AudienceRating), fill = "White", color = "Blue")

k + geom_histogram(binwidth= 10, aes(x = CriticRating), fill = "White", color = "Blue")


#---------------------------STATISTICAL TRANSFORMATION-----------------------#

u <- ggplot(data = movies, aes(x= CriticRating, y= AudienceRating, colour = Genre))
u +  geom_smooth(fill = NA)



#-----------------BOXPLOTS-------------#

u <- ggplot(data = movies, aes(x=Genre, y =CriticRating, colour = Genre))

u + geom_boxplot(size = 1.2)

u + geom_jitter() + geom_boxplot(size = 1.2, alpha = 0.5)


#------------------------------------------------FACETS-----------------------------#

v <- ggplot(data = movies, aes(x= BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")

# NOTE: In facet_grid(Genre~.), Genre represents: Rows and . respresents Coloumn
v + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black") + facet_grid(Genre~., scales="free")




w<- ggplot(data = movies, aes(x = CriticRating, y=AudienceRating, colour= Genre))

w + geom_point(size= 3) + facet_grid(.~Year)

w + geom_point(size= 3) + facet_grid(Genre~.)

w + geom_point(size= 3) + facet_grid(Genre~Year)


w  + geom_point(size= 3) + geom_smooth() + facet_grid(Genre~Year)


w  + geom_point(aes(size= BudgetMillions)) + geom_smooth() + facet_grid(Genre~Year)


#------------------------------------------COORDINATES---------------------------#

m<- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, size= BudgetMillions, colour = Genre))

m + geom_point() + xlim(50,100) + ylim(50,100)


w<- ggplot(data = movies, aes(x = CriticRating, y=AudienceRating, colour= Genre))


w  + geom_point(aes(size= BudgetMillions)) + geom_smooth() + facet_grid(Genre~Year) + coord_cartesian(ylim = c(0,100))


#--------------------------------------------THEME--------------------------------#

o <- ggplot(data = movies, aes(x = BudgetMillions))

h <- o + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black")

#-----LABEL  FORMATTING

h + xlab("Money Axis") +ylab("Number Of Movies") + theme(axis.title.x = element_text(colour = "DarkGreen", size= 30), axis.title.y = element_text(colour = "Red", size = 30)) 


#----Tick Mark Formatting

h + xlab("Money Axis") + ylab("Number of Movies") + theme(axis.title.x= element_text(colour = "DarkGreen", size = 30), 
                                                          axis.title.y = element_text(colour = "Red", size = 30),
                                                          axis.text.x=element_text(size=20), 
                                                          axis.text.y = element_text(size = 20))


#--------------------------------------------LEGEND FORMATTING-------------------------------#


h + 
  xlab("Money Axis") + 
  ylab("Number of Movies") + 
  theme(axis.title.x= element_text(colour = "DarkGreen", size = 30), 
        axis.title.y = element_text(colour = "Red", size = 30),
        axis.text.x=element_text(size=20), 
        axis.text.y = element_text(size = 20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size = 20),
        legend.position = c(1,1),
        legend.justification = c(1,1))





