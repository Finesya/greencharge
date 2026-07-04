#' Baca Data Internal Green Charge
#'
#' @return List berisi dataframe stasiun, transaksi, konsumsi_harian, historis
#' @export
baca_data <- function() {
  list(
    stasiun         = greencharge::stasiun,
    transaksi       = greencharge::transaksi,
    konsumsi_harian = greencharge::konsumsi_harian,
    historis        = greencharge::bulan_historis
  )
}
