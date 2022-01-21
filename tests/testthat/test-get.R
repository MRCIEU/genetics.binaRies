test_that("Test get_bcftools_binary()", {
  skip_on_cran()
  skip_on_os(os = "windows")
  bcftools_exe <- get_bcftools_binary()
  expect_true(file.exists(bcftools_exe))
})

test_that("Test get_plink_binary()", {
  skip_on_cran()
  plink_exe <- get_plink_binary()
  expect_true(file.exists(plink_exe))
})

test_that("Test get_gcta_binary()", {
  skip_on_cran()
  gcta_exe <- get_gcta_binary()
  expect_true(file.exists(gcta_exe))
})
