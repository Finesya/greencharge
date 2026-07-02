test_that("ringkasan_energi mengembalikan data frame dengan kolom yang benar", {
  transaksi <- data.frame(
    id_stasiun   = c("ST001", "ST001", "ST002"),
    energi_kwh   = c(20, 30, 25),
    pendapatan   = c(50000, 75000, 62500),
    status       = c("Selesai", "Selesai", "Gagal")
  )
  result <- ringkasan_energi(transaksi)
  expect_s3_class(result, "data.frame")
  expect_true(all(c("id_stasiun", "total_sesi", "total_kwh", "total_pendapatan") %in% names(result)))
})
