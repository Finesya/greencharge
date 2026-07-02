test_that("kpi_stasiun mengembalikan data frame dengan kolom yang benar", {
  transaksi <- data.frame(
    id_stasiun   = c("ST001", "ST001", "ST002"),
    energi_kwh   = c(20, 30, 25),
    pendapatan   = c(50000, 75000, 62500),
    status       = c("Selesai", "Selesai", "Selesai")
  )
  konsumsi_harian <- data.frame(
    id_stasiun       = c("ST001", "ST002"),
    nama_stasiun     = c("Test A", "Test B"),
    utilisasi_persen = c(30, 25)
  )
  result <- kpi_stasiun(transaksi, konsumsi_harian)
  expect_s3_class(result, "data.frame")
  expect_true("utilisasi_rata" %in% names(result))
})
