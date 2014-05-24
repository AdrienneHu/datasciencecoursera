makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    # set the value of the matrix
    set<-function(y){
          x<<- y
          m<<-NULL
    }
    # get the value of the matrix
    get <- function() x
    # set the inverse of the matrix
    setinverse <- function(solve) m <<-solve
    # get the inverse of the matrix
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}
    
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)){
              message("getting cached data")
              return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m       
}

#test
a <- makeCacheMatrix()  #initialize
a$set(matrix(1:4,2,2))  #set the square invertible matrix
a$get() #get the matrix
cacheinverse(a) #calculate the inverse 

