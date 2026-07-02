#' Deteksi Anomali Konsumsi Energi
#'
#' Memberi peringatan jika konsumsi harian stasiun berada di luar
#' rentang rata-rata +/- 2 standar deviasi
#'
#' @param konsumsi_harian Dataframe konsumsi harian
#' @return Dataframe baris-baris yang terdeteksi anomali
#' @export
deteksi_anomali <- function(konsumsi_harian) {
  stats <- konsumsi_harian %>%
    dplyr::group_by(id_stasiun) %>%
    dplyr::summarise(
      rata  = mean(total_kwh),
      sd    = sd(total_kwh),
      .groups = "drop"
    )

  konsumsi_harian %>%
    dplyr::left_join(stats, by = "id_stasiun") %>%
    dplyr::filter(total_kwh > rata + 2 * sd | total_kwh < rata - 2 * sd) %>%
    dplyr::mutate(
      status_anomali = dplyr::case_when(
        total_kwh > rata + 2 * sd ~ "Konsumsi Sangat Tinggi",
        total_kwh < rata - 2 * sd ~ "Konsumsi Sangat Rendah"
      )
    ) %>%
    dplyr::select(id_stasiun, nama_stasiun, tanggal, total_kwh, status_anomali)
}
