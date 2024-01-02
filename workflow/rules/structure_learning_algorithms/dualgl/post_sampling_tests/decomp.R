library(igraph)


## example 1
edge_list = c(1, 2, 1, 3, 1, 4, 2, 3, 2,4, 3, 4, 2, 5, 2, 6, 4,5, 4, 6, 5, 6, 6, 7, 6, 8, 4, 7, 4, 8, 7, 8)


g <-graph_from_edgelist(matrix(edge_list, ncol=2, byrow=TRUE), directed = FALSE)

plot(g)


is_chordal(g)


g1<-add_edges(g,c(1, 8))

plot(g1)

is_chordal(g1, fillin=TRUE)


g2<-add_edges(g1, c(6,1,7,1))
plot(g2)

is_chordal(g2)


plot(g)
decompose(g2)

max_cardinality(g2)
is_chordal(g2)
plot(g2)


## example 2

edge_list = c(1, 2, 1, 3, 1, 4, 2, 3, 2,4, 3, 4, 2, 5, 2, 6, 4,5, 4, 6, 5, 6, 6, 7, 6, 8, 4, 7, 4, 8, 7, 8, 7, 9, 7, 10, 8, 9, 8, 10, 9, 10,
              9, 11, 9, 12, 10, 11, 10, 12, 11, 12)

g <-graph_from_edgelist(matrix(edge_list, ncol=2, byrow=TRUE), directed = FALSE)

plot(g)


is_chordal(g)
g1<-add_edges(g,c(1, 12))

plot(g1)

is_chordal(g1, fillin=TRUE, newgraph=TRUE)

max_cliques(g)

generate_a_chain_graph<-function(n) {
    index = c(combn(1:4,2))
    square_n = floor(n/2)*2

    a = sapply(seq(0, square_n, by=2), function(x) index + x, simplify=FALSE)
    ed = matrix(unlist(a), ncol=2, byrow=TRUE)
    ed = ed[ed[,1]!=ed[,2],]
    graph_from_edgelist(ed, directed = FALSE)
}

size_of_largest_clique<-function(graph1) {
    max(sapply(max_cliques(graph1), function(x) length(x)))
}


create_a_fillin<-function(graph1) {
    is_chordal(graph1, fillin=TRUE, newgraph=TRUE)$newgraph
}



number_of_fillin<-function(graph1) {
    length(is_chordal(graph1, fillin=TRUE)$fillin)
}


add_an_edge<-function(graph) {
    v = length(V(graph))
    edge = sample.int(v, 2)
    g<-add_edges(graph, edge)
    g
}



g<-generate_a_chain_graph(100)

size_of_largest_clique(g)
plot(g)
g

s = sapply(1:1000, function(x) {
    g1<-add_an_edge(g)
    fill <- create_a_fillin(g1)
    size_of_largest_clique(fill) 
})

hist(s)
plot(fill)




z = lapply(1:100, function(i) {
    g<-generate_a_chain_graph(i)
    sapply(1:1000, function(x) {
        g2 = permute.vertices(g, sample(vcount(g)))
        g3 = union(g, g2)
        number_of_fillin(g3)
        #fill <- create_a_fillin(g3)
        #size_of_largest_clique(fill) 
    })
})

y = lapply(1:100, function(i) {
    g<-generate_a_chain_graph(i)
    sapply(1:1000, function(x) {
        g2 = permute.vertices(g, sample(vcount(g)))
        g3 = intersection(g, g2)        
        fill <- create_a_fillin(g3)
        c(C=size_of_largest_clique(fill), E=length(E(g3)))
    })
})


E(generate_a_chain_graph(12))
16*4

p = vcount(g)
p*(p-1)/2
size_of_largest_clique(g)

hist(z/4)
4*p

y


plot(1:100, sapply(z, mean))
lines(1:100,0.4*(1:100+4), col='red')


sapply(z, mean)/(1:100+4)

b = sapply(y, function(x) mean(unlist(x[2,])))

       
plot(1:100,  sapply(y, function(x) mean(unlist(x[1,]))), ylim=c(0,13))
lines(1:100, sapply(y, function(x) mean(unlist(x[2,]))), col='red')



y[[1]][1, ]
mean(unlist(y[[1]][2, ]))
y[[1]]
plot(g)


n = 1:p
plot(n, n*(p - (n+1)/2))

n*(p - (n+1)/2)
n

a = 100 + 4
(a+1)*a/2


x = seq(0, 1, 0.1)
n = 50
p = 0

plot(x, dbeta(x, 1/2, (n-p-2)/2), type='l')
for (p in 1:n) {
    lines(x, dbeta(x, 1/2, (n-p-2)/2), type='l', col ='red')
    Sys.sleep(0.5)
}


