# Mengaktifkan roxygen
usethis::use_roxygen_md()

# Menambahkan license
usethis::use_mit_license()

# Membuat README
usethis::use_readme_rmd()

# Membuat Vignette
usethis::use_vignette("getting-started")

# Membuat Testing infrastruktur
usethis::use_testthat()

# Setup pkgdown
usethis::use_pkgdown()

# Generate dokumentasi
devtools::document()

# Install package
devtools::install()

# Testing
devtools::test()

# Checking Package
devtools::check()

# Hapus instalasi lama
remove.packages("greencharge")

# Restart R
.rs.restartR()

# Build README
devtools::build_readme()

# Processing Vignettes
devtools::build_vignettes()

# Checking Vignettes
browseVignettes("greencharge")

# Tambahkan semua file
system("git add .")

# Commit dengan pesan
system('git commit -m "Add greencharge package:
       fungsi monitoring energi EV"')

# Push ke GitHub
system("git push")

# Tambahkan semua file
system("git add .")

# Commit
system('git commit -m "Add script simulasi data"')

# Push ke GitHub
system("git push")

# Push ke GitHub
system("git add .")
system('git commit -m "Add internal data package"')
system("git push")

system("git add .")
system('git commit -m "Add internal data rda"')
system("git push")

# Push ke GitHub
system("git add .")
system('git commit -m "Add data documentation"')
system("git push")

system("git add .")
system('git commit -m "Update baca_data: load internal data"')
system("git push")
