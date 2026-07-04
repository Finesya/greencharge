test_that("baca_data mengembalikan list", {
  data <- baca_data()
  expect_type(data, "list")
})

test_that("baca_data memiliki komponen yang benar", {
  data <- baca_data()
  expect_true(all(c("stasiun", "transaksi", "konsumsi_harian", "historis") %in% names(data)))
})
