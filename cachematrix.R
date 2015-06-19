

########## USAGE ##########################
#  To create a sample matrix, do some thing like this:
# t <- matrix(rnorm(9),3,3)   

# Then create a Cache matrix object like this:
# tt <- makeCacheMatrix(t)
##########################################

# Function to construct an object that holds a  matrix in a private scope 
# and exposes functionality (public scope) to set and retrieve that matrix. 
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL # internal variable that holds the matrix.
        
        # setter function; initializes x to hold the function y, and M to NULL.
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        
        # getter function; retrieves the value of x.
        get <- function() x
        
        # function that stores the inverted matrix in cache
        setinverse <- function(solve) m <<- solve
        
        # function that retrieves the inverted matrix from cache
        getinverse <- function() m
        
        # return value is a list of four properties.
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}



########## USAGE ##########################
# Make sure you have created a matrix and use the
# makeCacheMatrix  from the previous step.  
# Assuming a cached matrix called 't' do the following:
# cacheSolve(tt)
##########################################

 ## Return a matrix that is the inverse of 'x'. 
 ## Be sure to create a matrix first from makeCacheMatrix
cacheSolve <- function(x, ...) {
      
					# Retrieve the inverted matrix from cache (if it exists there)      
           		m <- x$getinverse()
        
        # This block returns matrix from cache   		
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }        
        
        # Otherwise, we need to compute the inverse.
        
        # Invert the matrix
        data <- x$get()
        m <- solve(data, ...)        
        message("solving (inverting) the matrix...")
        
        # Place the inverted matrix in cache.
        x$setinverse(m)
        message("...and placing the result in the cache")
        
        # return the inverted matrix
        m
}