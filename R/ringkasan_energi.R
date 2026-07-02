#' Ringkasan Konsumsi Energi per Stasiun
#'
#' @param transaksi Dataframe transaksi
#' @return Dataframe ringkasan energi per stasiun
#' @export
ringkasan_energi <- function(transaksi) {
  transaksi %>%
    dplyr::filter(status == "Selesai") %>%
    dplyr::group_by(id_stasiun) %>%
    dplyr::summarise(
      total_sesi       = dplyr::n(),
      total_kwh        = round(sum(energi_kwh), 2),
      total_pendapatan = sum(pendapatan),
      rata_kwh_sesi    = round(mean(energi_kwh), 2),
      .groups = "drop"
    ) %>%
    dplyr::arrange(dplyr::desc(total_kwh))
}
