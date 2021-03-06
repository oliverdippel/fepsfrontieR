context ("Correct output of SFM.generate")

library (MASS)
library (dplyr)

test_that ("sfmfep works :-)", {

  N <- 2
  Time <- 30
  beta <- c(0.5,3)
  delta <- c(0.5,2)
  sigma_u <- 2; sigma_v <- 1
  form.test <- formula(y  ~ x1 + x2 + (z1 + z2))
  test.data <- sfm.data  # package data

  # Tests if optim " N & T" works
  testSfmfep <- sfmfep(formula = form.test, N=2,Time=30, data = test.data, mu = 0, myPar = NULL)
  expect_type (object = testSfmfep, type = "list")

  # Tests if option "group"
  testSfmfep <- sfmfep(formula = form.test, group ="gr", data = test.data, mu = 0, myPar = NULL)
  expect_type (object = testSfmfep, type = "list")

  # Tests if defined starting points "myPar" works
  testSfmfep <- sfmfep(formula = form.test, group ="gr",
                       data = test.data, mu = 0,
                       myPar = c(sigma_u = 1, sigma_v=2, beta = c(1,2), delta = c(1, 2)))
  expect_type (object = testSfmfep, type = "list")

  # Tests if it works when estimates provided (estimate = F)
  testSfmfep <- sfmfep(formula = form.test, group ="gr",
                       data = test.data, mu = 0, estimate = F,
                       myPar = c(sigma_u = 1, sigma_v=2, beta = c(1,2), delta = c(1, 2)))
})


context ("Correct output of SFM.generate")
library (truncnorm)

test_that ("SFM.generate creates a correct output format", {

  N <- 2
  Time <- 5
  beta <- c(0.5, 0.5)
  delta <- c(0.5, 0.5)
  sigma_u = 0.1
  sigma_v = 0.2
  mu <- 0.5

  testSFM1 <- SFM.generate(N = N, Time = Time, beta = beta, delta = delta,
                           mu_u = mu, sigma_u = sigma_u, sigma_v = sigma_v)
  expect_type (object = testSFM1, type = "list")

  N <- "c(3,2)"
  expect_error( SFM.generate(N = N, Time = Time, beta = beta, delta = delta,
                             mu_u = mu, sigma_u = sigma_u, sigma_v = sigma_v))

  rm(list=ls(all=TRUE))
})

context ("SFM.within returns a nice output")

 test_that ("SFM.generate creates a correct output format", {
   testData <- sfm.data
   sigma_u <- 0.1
   sigma_v <- 0.1
   beta <- c(0.5, 2)
   delta <- c(0.5, 3)
   output <- SFM.within(par = c(sigma_u = sigma_u, sigma_v = sigma_v, beta = beta, delta = delta),
                        xv <- sfm.data[2:3], y <- sfm.data[4], z <- sfm.data[5:6],
                        N <- 2,  Time <- 30, mu = 0, optim = F)
   expect_type(object = output, type ="list")
})
