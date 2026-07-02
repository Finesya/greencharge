#' Hitung Utilisasi Stasiun
#'
#' @param konsumsi_harian Dataframe konsumsi harian
#' @return Dataframe utilisasi rata-rata per stasiun
#' @export
utilisasi_stasiun <- function(konsumsi_harian) {
  konsumsi_harian %>%
    dplyr::group_by(id_stasiun, nama_stasiun) %>%
    dplyr::summarise(
      utilisasi_rata   = round(mean(utilisasi_persen), 1),
      utilisasi_max    = round(max(utilisasi_persen), 1),
      utilisasi_min    = round(min(utilisasi_persen), 1),
      .groups = "drop"
    ) %>%
    dplyr::arrange(dplyr::desc(utilisasi_rata))
}
