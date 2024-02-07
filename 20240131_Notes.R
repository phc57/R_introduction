# Data structures
cats_df <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2), 
                   likes_strings = c(1, 0, 1))
rm(cats)

cats_df
# structure of cats dataframe
str(cats_df)
cats_df$weight + 2
# $ pulls vector of data from data frame


# paste will print out words andvalue from vector
paste("My cat is ", cats_df$coat)

# typeofwill tell the type of variable or weight
typeof(cats_df$weight) # double
typeof(TRUE) # logical 
typeof(cats_df$coat) # character 

# Writing Files
write.csv(x = cats_df, file = "cats_df.csv",
          row.names = FALSE)
# Matrix
example_mat <- matrix(0, ncol = 6, nrow = 3)
example_mat

# dim gives the dimensions of rows and columns 
dim(example_mat)
dim(cats_df)

# Subsetting
head(cats_df)
str(cats_df[1])  #gives 3rd column in the data frame
str(cats_df$coat) # gives a character
cats_df[1,] # first is row, second is column, but since column is not indicated all of the columns are shown
cats_df[1,2] # gives first row second column
cats_df[1:2,2] # gives second and third row in second column

cats_df[c(1,3),c(1:3)]

# row.names shows the numbers of the row
?data.frame

# what software do i have 
# make sure to identify which version of R we're using, can add to the end of the file 
sessionInfo()

# control-enter sends commands to console 
# c combines values into a vector or list
# can use ls or cat to look at file 

# install package 
install.packages("ggplot2")
library("ggplot2")

# can also install by clicking on the packages tab
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_data.csv", destfile = "gapminder_data.csv")

gapminder_df <-read.csv(file = "gapminder_data.csv")
str(gapminder_df)
dim(gapminder_df)

# Plot the data
ggplot(data = gapminder_df, 
       mapping = aes(x = gdpPercap, y = lifeExp)) +
    geom_point(alpha = 0.5) +
    labs(x = "GDP Per Capita", y = "Life Expectancy (yrs)") +
    scale_x_log10() + 
    geom_smooth(method = "lm")

    # make multiple plots by the continent
    # facet_wrap(.~continent)


# modify the colors, modify the shapes of the points

ggplot(data = gapminder_df, 
       mapping = aes(x= gdpPercap, y=lifeExp)) +
    geom_point(alpha = 0.5, 
               aes(color = continent, 
                   shape = continent, 
                   size = pop)) +
    labs(x = "GDP Per Capita", y = "Life Expectancy (yrs)")+
    scale_x_log(10) +
    geom_smooth(method = "lm")

head(gapminder_df)
 
ggplot(data = gapminder_df, 
       mapping = aes(x= year, y= lifeExp, 
                     # grouping the data
                     group = country))+
    geom_line()+
    geom_point( aes(color = continent))


# aes is aesthetics, can write names axes using 'x=', 'y='
# geom identifies the type of plot and executes the plot w/o +. geom_ then it would not return plot
# alpha gives transparency
