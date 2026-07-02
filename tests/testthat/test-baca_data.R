test_that("baca_data mengembalikan list", {
  tmp <- tempdir()
  write.csv(data.frame(id_stasiun = "ST001", nama_stasiun = "Test", kota = "Jakarta",
                       jumlah_charger = 5, tarif_per_kwh = 2500),
            file.path(tmp, "data_stasiun.csv"), row.names = FALSE)
  write.csv(data.frame(id_transaksi = "TRX001", id_stasiun = "ST001",
                       tanggal = "2026-01-01", durasi_menit = 30,
                       energi_kwh = 20, status = "Selesai", pendapatan = 50000),
            file.path(tmp, "data_transaksi.csv"), row.names = FALSE)
  write.csv(data.frame(id_stasiun = "ST001", tanggal = "2026-01-01",
                       total_sesi = 5, total_kwh = 100, total_pendapatan = 250000,
                       nama_stasiun = "Test", jumlah_charger = 5, utilisasi_persen = 20),
            file.path(tmp, "data_konsumsi_harian.csv"), row.names = FALSE)
  write.csv(data.frame(bulan = "January", periode = "2026-01-01",
                       total_kwh = 42500, total_sesi = 850, total_pendapatan = 106250000),
            file.path(tmp, "data_historis_bulanan.csv"), row.names = FALSE)
  data <- baca_data(tmp)
  expect_type(data, "list")
  expect_true(all(c("stasiun", "transaksi", "konsumsi_harian", "historis") %in% names(data)))
})
