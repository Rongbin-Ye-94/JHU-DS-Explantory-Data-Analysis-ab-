makeCacheMatrix <- function(x = matrix()) {
  hidden <- NULL
  set <- function(y){
    x <<- y
    hidden <<- NULL
  }
  get <- function() x
  setInverse <- function(solveMatrix) hidden <<- solveMatrix
  getInverse <- function() hidden
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

cachemean <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(hidden)) {
    message("getting cached data")
    return(hidden)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setInverse(hidden)
  hidden
}