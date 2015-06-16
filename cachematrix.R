
## The makeCacheMatrix function takes in a matrix as an argument
## and defines a list of 4 functions that can be applied to the matrix.

makeCacheMatrix - function(x = matrix()) {
    inv - NULL
    set - function(y = matrix()) {
        x - y
        inv - NULL
    }
    get - function() x
    setinv - function(inverse) inv - inverse
    getinv - function() inv
    
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}



## The cacheSolve function checks to see if an inverse matrix has been 
## created and stored. If it has, the matrix is returned from cache, if 
## not it creates the inverse using the solve function and adds it to the
## cache.

cacheSolve - function(x, ...) {
    ## Check to see if the inverse has already been created and if it
    ## has then return the value.
    inv - x$getinv()
    if(!is.null(inv)){
        message(Getting cached data.)
        return(inv)
    }
    ## If no inv value was cached, need to calculate the inverse of the
    ## matrix.
    data - x$get()
    inv - solve(data, ...)
    x$setinv(inv)
    inv
}
