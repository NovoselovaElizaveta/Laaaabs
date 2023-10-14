library(igraph)
library(tidyverse)

set.seed(123) 
n = 15 
data = tibble(d = paste(1:n)) 

relations = tibble( 
  from = sample(data$d), 
  to = lead(from, default=from[1]) 
) 

graph = graph_from_data_frame(relations, directed = T, vertices = data)  

V(graph)$color <- ifelse(data$d == relations$from[1], "red", "orange") 

plot(graph, layout = layout.circle, edge.arrow.size = 0.2) 

legend("bottomright", legend = c("from", "to"), 
       col = c("red", "orange"),
       pch = c(21, 21), 
       pt.bg = c("red", "orange"),
       cex = 0.8, 
       title = "Условные обозначения")