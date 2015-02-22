# Matrix inversion is usually a costly computation and there may be some benefit
# to caching the inverse of a matrix rather than compute it repeatedly. The
# following two functions are used to cache the inverse of a matrix.

# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
      i <- NULL
      set <- function(y) {
          x <<- y
          i <<- NULL
      }
      get <- function() x
      setinverse <- function(inverse) i <<- inverse
      getinverse <- function() i
      list(set = set, 
           get = get, 
           setinverse = setinverse, 
           getinverse = getinverse)
}


# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.

# This function assumes that the matrix is always invertible.
cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
      i <- x$getinverse()
      if(!is.null(i)) {
        message("Getting cached data")
        return(i)
      }
      data <- x$get()
      i <- solve(data, ...)
      x$setinverse(i)
      i
}

#Example usage:
#Use assignment2.R (test script) to simplify the tets process
#>source("cachematrix.R")
#>x = matrix(c(1,2,3,4), nrow=2, ncol=2)
#>m <- makeCacheMatrix(x)
#>m$get()         # Returns original matrix
#[,1] [,2]
#[1,]    1    3
#[2,]    2    4
#>cacheSolve(m)   # Computes, caches, and returns matrix inverse
#[,1] [,2]
#[1,]   -2  1.5
#[2,]    1 -0.5
#>m$getinverse()  # Retrieve matrix inverse
#[,1] [,2]
#[1,]   -2  1.5
#[2,]    1 -0.5
#>cacheSolve(m)   # Returns cached matrix inverse using previously computed matrix inverse getting cached data
#Getting cached data
#[,1] [,2]
#[1,]   -2  1.5
#[2,]    1 -0.5
#>m$set(matrix(c(2,4,3,1), nrow=2, ncol=2)) # Modify existing matrix
#>m$get()
#       [,1] [,2]
# [1,]    2    3
# [2,]    4    1
#Inversing the matrix in R
#>cacheSolve(m)
#      [,1] [,2]
# [1,] -0.1  0.3
# [2,]  0.4 -0.2
#>m$getinverse()  # Retrieve matrix inverse
#      [,1] [,2]
# [1,] -0.1  0.3
# [2,]  0.4 -0.2
#>cacheSolve(m)   # Returns cached matrix inverse using previously computed matrix inverse getting cached data
#Getting cached data
#      [,1] [,2]
# [1,] -0.1  0.3
# [2,]  0.4 -0.2
