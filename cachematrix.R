## makeCacheMatrix  creates a special "matrix" object that can cache its inverse.
## cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve retrives the inverse from the cache. 


## makeCacheMatrix creates a special "matrix" object. It hase 4 methods: 
## set to set matrix (optional), 
## get get to get matrix,
## setsolve to cache inversion of the matrix (saves into "inversion" variable)
## getsolve to retrive cached inversed matrix 

## How to use: cm <- makeCacheMatrix(matrix)

makeCacheMatrix <- function(matrix = matrix()) {
  inversion <- NULL
  set <- function(nm) {
    matrix <<- nm
    inversion <<- NULL
  }
  get <- function() {matrix}
  setsolve <- function(s) inversion  <<- s
  getsolve  <- function() inversion
  
  list(
    set = set, get = get,
    setsolve = setsolve,
    getsolve = getsolve
  )
  
}


## cacheSolve computes the inverse of the special "matrix". 
## Is cacheMatrix already has computed inversion of the matrix it would be returned without new computation.
## 
## How to use: cacheSolve(cm),
## runt it the second time to check, that data comes from a cache (message "getting cached data")

cacheSolve <- function(cacheMatrix, ...) {
  ## Return a matrix that is the inverse of 'x'
  inversion <- cacheMatrix$getsolve()
  if(!is.null(inversion)) {
    message("getting cached data")
    return(inversion)
  }
  data <- cacheMatrix$get()
  inversion <- solve(data, ...)
  cacheMatrix$setsolve(inversion)
  inversion
}
