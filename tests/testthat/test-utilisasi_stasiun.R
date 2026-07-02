test_that("utilisasi_stasiun mengembalikan data frame dengan kolom yang benar", {
  konsumsi_harian <- data.frame(
    id_stasiun       = c("ST001", "ST001", "ST002"),
    nama_stasiun     = c("Test A", "Test A", "Test B"),
    utilisasi_persen = c(30, 40, 25)
  )
  result <- utilisasi_stasiun(konsumsi_harian)
  expect_s3_class(result, "data.frame")
  expect_true("utilisasi_rata" %in% names(result))
})
