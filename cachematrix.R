## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


# To create a sample matrix, do some thing like this:
# t <- matrix(rnorm(9),3,3)   


makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
           		m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        message("solving (inverting) the matrix...")
        x$setinverse(m)
        message("...and placing the result in the cache")
        m
}