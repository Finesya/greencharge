#' @importFrom magrittr %>%
#' @importFrom utils read.csv
#' @importFrom stats sd
utils::globalVariables(c(
  "id_stasiun", "nama_stasiun", "total_kwh", "total_sesi",
  "total_pendapatan", "rata_kwh_sesi", "utilisasi_persen",
  "utilisasi_rata", "energi_kwh", "pendapatan", "status",
  "tanggal", "kwh_harian", "rata", "status_anomali"
))
