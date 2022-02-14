#Class 5 Data Visualization

plot(1:5)

library(ggplot2)

#Built-in dataset in R: cars 
cars 

#Function View() allows you to visualize the actual table in a separate R tab
View(cars)

plot(cars)

#Each ggplot funtion needs at least 3 layers: data, aesthetic, geometry
#ggplot(data= ) + aes() + geom_something()

ggplot(data=cars) + aes(x=speed, y=dist) + geom_point()

#Common aesthetics: position, size, line type, line width, color, shape...
#i.e. geom_line(), geom_col()
#SEE GGPLOT CHEAT SHEET FOR OTHER AESTHETICS AND GEOMETRIES!!! 

p <- ggplot(data=cars) + aes(x=speed, y=dist) + geom_point()
p

p + geom_line() 
#this would be the same as adding + geom_line() in addition to geom_point() in the
#original ggplot line of code 

p + geom_smooth() #adds a best fit curve to the graph (smoooths things out)

p + geom_smooth(method='lm') #this makes it into a best fit LINE 

#Add labels
#Use shift+enter to make multi-line code! 
p + labs(title = 'Speed and Stopping Distances of Cars', 
         subtitle = 'Using the built-in R dataset') + 
  xlab('Speed (MPH)') + ylab('Stopping Distance (ft)')



#NOW DO THE RNA-SEQ DATA
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)
View(genes)

#Number of genes in the dataset? - number of rows with nrow() 
nrow(genes) #5196 genes
colnames(genes)
ncol(genes) #4

#Tabulate the number of genes belonging to the categories 
table(genes['State'])

#Now graph condition1 vs condition2 expression values
rnaseq <- ggplot(data = genes) + aes(x = Condition1, y = Condition2) + geom_point()

#Change color based on another categorical variable on the same data (State!)
#can also change transparency of the points (fill) with geom_point(alpha=[insert value])
rnaseq_col <- ggplot(data = genes) + aes(x = Condition1, y = Condition2, col = State) + geom_point(alpha=0.5)

#Default colors are ugly, change them! 
#Red will be what's upregulated, blue will be what's downregulated 
final <- rnaseq_col + scale_colour_manual(values=c("blue","gray","red"))

#Now add annotations 
final + labs(title = 'Gene Expression Changes Upon Drug Treatment') + 
  xlab('Control') + ylab('Treatment') + theme_bw()


