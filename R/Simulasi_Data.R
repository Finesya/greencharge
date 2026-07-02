### Panggil Package
library(dplyr)

### Set Seed
set.seed(42)

### Data Stasiun Pengisian
stasiun <- data.frame(
  id_stasiun     = paste0("ST", sprintf("%03d", 1:10)),
  nama_stasiun   = c("Green Charge Sudirman", "Green Charge Kuningan",
                     "Green Charge Gatot Subroto", "Green Charge TB Simatupang",
                     "Green Charge Kemang", "Green Charge Senayan",
                     "Green Charge Kelapa Gading", "Green Charge Puri Indah",
                     "Green Charge Cibubur", "Green Charge Bekasi"),
  kota           = c("Jakarta Pusat", "Jakarta Selatan", "Jakarta Selatan",
                     "Jakarta Selatan", "Jakarta Selatan", "Jakarta Pusat",
                     "Jakarta Utara", "Jakarta Barat", "Jakarta Timur", "Bekasi"),
  jumlah_charger = c(8, 6, 10, 12, 5, 9, 7, 6, 8, 10),
  tarif_per_kwh  = rep(2500, 10)
)

### Data Transaksi Harian

## Rentang Tanggal 
tanggal_mulai <- as.Date("2026-01-01")
tanggal_akhir <- as.Date("2026-06-30")
daftar_tanggal <- seq(tanggal_mulai, tanggal_akhir, by = "day")

## Total Transaksi 
n_transaksi <- 1500

## Data Transaksi 
set.seed(42)
transaksi <- data.frame(
  id_transaksi  = paste0("TRX", sprintf("%05d", 1:n_transaksi)),
  id_stasiun    = sample(stasiun$id_stasiun, n_transaksi, replace = TRUE,
                         prob = c(0.12,0.10,0.13,0.14,0.07,0.11,0.09,
                                  0.08,0.08,0.08)),
  tanggal       = sample(daftar_tanggal, n_transaksi, replace = TRUE),
  durasi_menit  = round(rnorm(n_transaksi, mean = 45, sd = 15)),
  energi_kwh    = round(runif(n_transaksi, min = 5, max = 60), 2),
  status        = sample(c("Selesai", "Selesai", "Selesai", "Gagal"), 
                         n_transaksi, replace = TRUE)
)

## Pengolahan Data Transaksi 
transaksi <- transaksi %>%
  left_join(stasiun %>% select(id_stasiun, tarif_per_kwh), 
            by = "id_stasiun") %>%
  mutate(
    pendapatan = ifelse(status == "Selesai", energi_kwh * tarif_per_kwh, 0),
    durasi_menit = pmax(durasi_menit, 10)
  ) %>%
  select(-tarif_per_kwh)

### Data Konsumsi Energi Harian Per Stasiun 
konsumsi_harian <- transaksi %>%
  filter(status == "Selesai") %>%
  group_by(id_stasiun, tanggal) %>%
  summarise(
    total_sesi     = n(),
    total_kwh      = sum(energi_kwh),
    total_pendapatan = sum(pendapatan),
    .groups = "drop"
  ) %>%
  left_join(stasiun %>% select(id_stasiun, nama_stasiun, jumlah_charger), 
            by = "id_stasiun") %>%
  mutate(
    utilisasi_persen = round((total_sesi / 
                                (jumlah_charger * 24 / 1)) * 100, 2)
  )

### Data Historis 6 Bulan

## Agegasi Data
historis_agregat <- transaksi %>%
  filter(status == "Selesai") %>%
  mutate(bulan_nama = format(tanggal, "%B"),
         bulan_periode = floor_date(tanggal, "month")) %>%
  group_by(bulan_periode) %>%
  summarise(
    total_kwh = sum(energi_kwh),
    total_sesi = n(),
    total_pendapatan = sum(pendapatan),
    .groups = "drop"
  ) %>%
  arrange(bulan_periode)

## Kolom Nama Bulan 
bulan_historis <- historis_agregat %>%
  mutate(
    bulan = format(bulan_periode, "%B"),
    periode = bulan_periode
  ) %>%
  select(bulan, periode, total_kwh, total_sesi, total_pendapatan)

### Export CSV

## Path Folder
path_folder <- 
  '/Users/finesyaaura/Documents/coolyeah/Semester 4/Prak Komstat/Data Eval 4/'

## Export CSV
write.csv(stasiun,          paste0(path_folder, "data_stasiun.csv"),         
          row.names = FALSE)
write.csv(transaksi,        paste0(path_folder, "data_transaksi.csv"),         
          row.names = FALSE)
write.csv(konsumsi_harian,  paste0(path_folder, "data_konsumsi_harian.csv"),   
          row.names = FALSE)
write.csv(bulan_historis,   paste0(path_folder, "data_historis_bulanan.csv"),  
          row.names = FALSE)

