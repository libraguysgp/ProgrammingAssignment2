# Example usage:
source("cachematrix.R")
x = matrix(c(1,2,3,4), nrow=2, ncol=2)
m <- makeCacheMatrix(x)
m$get()         # Returns original matrix
#[,1] [,2]
#[1,]    1    3
#[2,]    2    4
cacheSolve(m)   # Computes, caches, and returns matrix inverse
#[,1] [,2]
#[1,]   -2  1.5
#[2,]    1 -0.5
m$getinverse()  # Retrieve matrix inverse
#[,1] [,2]
#[1,]   -2  1.5
#[2,]    1 -0.5
cacheSolve(m)   # Returns cached matrix inverse using previously computed matrix inverse getting cached data
#Getting cached data
#[,1] [,2]
#[1,]   -2  1.5
#[2,]    1 -0.5
m$set(matrix(c(2,4,3,1), nrow=2, ncol=2)) # Modify existing matrix
m$get()
#       [,1] [,2]
# [1,]    2    3
# [2,]    4    1
#Inversing the matrix in R
cacheSolve(m)
#      [,1] [,2]
# [1,] -0.1  0.3
# [2,]  0.4 -0.2
m$getinverse()  # Retrieve matrix inverse
#      [,1] [,2]
# [1,] -0.1  0.3
# [2,]  0.4 -0.2
cacheSolve(m)   # Returns cached matrix inverse using previously computed matrix inverse getting cached data
#Getting cached data
#      [,1] [,2]
# [1,] -0.1  0.3
# [2,]  0.4 -0.2
