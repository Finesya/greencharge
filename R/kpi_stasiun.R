#' KPI Lengkap per Stasiun
#'
#' @param transaksi Dataframe transaksi
#' @param konsumsi_harian Dataframe konsumsi harian
#' @return Dataframe KPI per stasiun
#' @export
kpi_stasiun <- function(transaksi, konsumsi_harian) {
  ringkasan <- ringkasan_energi(transaksi)
  utilisasi <- utilisasi_stasiun(konsumsi_harian)

  ringkasan %>%
    dplyr::left_join(utilisasi, by = "id_stasiun") %>%
    dplyr::select(
      id_stasiun, nama_stasiun,
      total_sesi, total_kwh,
      total_pendapatan, rata_kwh_sesi,
      utilisasi_rata
    )
}
