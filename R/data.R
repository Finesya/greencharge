#' Data Stasiun Pengisian
#'
#' Data informasi 10 stasiun pengisian kendaraan listrik
#' PT Green Charge Indonesia.
#'
#' @format Data frame dengan kolom:
#' \describe{
#'   \item{id_stasiun}{ID unik stasiun}
#'   \item{nama_stasiun}{Nama stasiun pengisian}
#'   \item{kota}{Kota lokasi stasiun}
#'   \item{jumlah_charger}{Jumlah charger tersedia}
#'   \item{tarif_per_kwh}{Tarif per kWh dalam rupiah}
#' }
"stasiun"

#' Data Transaksi Pengisian
#'
#' Data 1500 transaksi pengisian kendaraan listrik
#' periode Januari-Juni 2026.
#'
#' @format Data frame dengan kolom:
#' \describe{
#'   \item{id_transaksi}{ID unik transaksi}
#'   \item{id_stasiun}{ID stasiun pengisian}
#'   \item{tanggal}{Tanggal transaksi}
#'   \item{durasi_menit}{Durasi pengisian dalam menit}
#'   \item{energi_kwh}{Energi yang tersalurkan dalam kWh}
#'   \item{status}{Status transaksi: Selesai atau Gagal}
#'   \item{pendapatan}{Pendapatan dari transaksi dalam rupiah}
#' }
"transaksi"

#' Data Konsumsi Energi Harian
#'
#' Data agregasi konsumsi energi harian per stasiun
#' periode Januari-Juni 2026.
#'
#' @format Data frame dengan kolom:
#' \describe{
#'   \item{id_stasiun}{ID stasiun pengisian}
#'   \item{tanggal}{Tanggal}
#'   \item{total_sesi}{Total sesi pengisian}
#'   \item{total_kwh}{Total energi tersalurkan dalam kWh}
#'   \item{total_pendapatan}{Total pendapatan dalam rupiah}
#'   \item{nama_stasiun}{Nama stasiun pengisian}
#'   \item{jumlah_charger}{Jumlah charger tersedia}
#'   \item{utilisasi_persen}{Tingkat utilisasi dalam persen}
#' }
"konsumsi_harian"

#' Data Historis Bulanan
#'
#' Data agregasi historis bulanan seluruh stasiun
#' periode Januari-Juni 2026.
#'
#' @format Data frame dengan kolom:
#' \describe{
#'   \item{bulan}{Nama bulan}
#'   \item{periode}{Tanggal awal bulan}
#'   \item{total_kwh}{Total energi tersalurkan dalam kWh}
#'   \item{total_sesi}{Total sesi pengisian}
#'   \item{total_pendapatan}{Total pendapatan dalam rupiah}
#' }
"bulan_historis"
