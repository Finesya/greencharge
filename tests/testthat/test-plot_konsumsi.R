test_that("plot_konsumsi mengembalikan objek ggplot", {
  konsumsi_harian <- data.frame(
    tanggal  = as.Date(c("2025-06-01", "2025-06-02", "2025-06-03")),
    total_kwh = c(100, 120, 110)
  )
  result <- plot_konsumsi(konsumsi_harian)
  expect_s3_class(result, "ggplot")
})
