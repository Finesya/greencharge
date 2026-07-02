#' Visualisasi Tren Konsumsi Energi Harian
#'
#' @param konsumsi_harian Dataframe konsumsi harian
#' @return ggplot object
#' @export
plot_konsumsi <- function(konsumsi_harian) {
  konsumsi_harian$tanggal <- as.Date(konsumsi_harian$tanggal)

  tren <- konsumsi_harian %>%
    dplyr::group_by(tanggal) %>%
    dplyr::summarise(kwh_harian = sum(total_kwh), .groups = "drop")

  ggplot2::ggplot(tren, ggplot2::aes(x = tanggal, y = kwh_harian)) +
    ggplot2::geom_area(fill = "#a8d5b5", alpha = 0.5) +
    ggplot2::geom_line(color = "#1a6b3c", linewidth = 1.2) +
    ggplot2::geom_point(color = "#1a6b3c", size = 2) +
    ggplot2::scale_x_date(date_labels = "%d %b", date_breaks = "5 days") +
    ggplot2::scale_y_continuous(labels = scales::comma) +
    ggplot2::labs(
      title    = "Tren Konsumsi Energi Harian",
      subtitle = "Total kWh Tersalurkan",
      x = "Tanggal", y = "Energi (kWh)"
    ) +
    ggplot2::theme_minimal(base_size = 12) +
    ggplot2::theme(
      plot.title  = ggplot2::element_text(face = "bold", color = "#1a6b3c"),
      axis.text.x = ggplot2::element_text(angle = 45, hjust = 1)
    )
}
