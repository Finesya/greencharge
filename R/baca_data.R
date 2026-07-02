#' Baca Data CSV Green Charge
#'
#' @param path Path folder tempat file CSV disimpan
#' @return List berisi dataframe stasiun, transaksi, konsumsi_harian, historis
#' @export
baca_data <- function(path) {
  if (!endsWith(path, "/")) path <- paste0(path, "/")
  list(
    stasiun         = read.csv(paste0(path, "data_stasiun.csv")),
    transaksi       = read.csv(paste0(path, "data_transaksi.csv")),
    konsumsi_harian = read.csv(paste0(path, "data_konsumsi_harian.csv")),
    historis        = read.csv(paste0(path, "data_historis_bulanan.csv"))
  )
}
