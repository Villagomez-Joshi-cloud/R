# Input load. Please do not change #
`dataset` = read.csv('C:/Users/Owner/data.csv', check.names = FALSE, encoding = "UTF-8", blank.lines.skip = FALSE);
# Original Script. Please update your script content here and once completed copy below section back to the original editing window #
library(ggplot2)

p <- ggplot(data = dataset, aes(x = Week, y = Meetings, fill=factor(Department) )) + geom_bar(stat = "identity", width=.5, position="dodge")

# define multi chart column and number of columns
p <- p + facet_wrap(~Department, ncol=2) 
# Define Legend
p <- p + theme(legend.position="bottom", legend.title = element_blank()) 
p <- p + theme(legend.text = element_text(colour="black", size = 16))

p <- p + theme(strip.text.x = element_text(size=16)) 
p <- p + theme(panel.background = element_rect(fill='white', colour='grey')) 
p <- p + theme(panel.grid.major.y = element_line(colour = 'grey')) 
# Define Title
p + ggtitle("Number of Meetings By Week and Department")

remove('dataset')
