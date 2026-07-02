test_that("deteksi_anomali mengembalikan data frame dengan kolom yang benar", {
  konsumsi_harian <- data.frame(
    id_stasiun   = rep("ST001", 10),
    nama_stasiun = rep("Test A", 10),
    tanggal      = seq(as.Date("2025-06-01"), by = "day", length.out = 10),
    total_kwh    = c(100, 105, 98, 102, 99, 200, 101, 97, 103, 100)
  )
  result <- deteksi_anomali(konsumsi_harian)
  expect_s3_class(result, "data.frame")
  expect_true("status_anomali" %in% names(result))
})
