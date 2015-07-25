## makeCacheMatrix creates a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of inverse of the matrix
## 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
	im <- NULL
	set <- function(y) {
		x <<- y       	## This is storing the values of x into the global enviorment.
		im <<- Null
	}
	get <- function()x
	setinverse <- function(inverse) im <<- inverse
	getinverse <- function()im
					## This makes the list of the four functions.
	list( set=set, get=get, setinverse=setinverse, getinverse=getinverse)
	
}

##The following function returns the inverse of the matrix. It first checks if
##the inverse has already been computed. If so, it gets the result and skips the
##computation. If not, it computes the inverse, sets the value in the cache via
##setinverse function.

cacheSolve <- function(x, ...) {
	im <- x$getinverse()
	if(!is.null(im)) {   	## This line checks if the matrix already exists or not.
		message("getting cached data")		
		return(im) 		## This returns the inverse matrix if it already exists in the cache.
}
	data <- x$get() 		## If the matrix does not exists it will make the matrix and return it. 
	im <- solve(data)
	x$setinverse(im)
	im
        
}


