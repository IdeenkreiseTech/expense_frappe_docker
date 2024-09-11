openssl pkcs7 -print_certs -in yourfile.p7b -out ca_bundle.crt

cat __eastern_in.crt ca_bundle.crt > fullchain.crt

#remove the extra lines from fullchain.crt. All lines other than between begin and end
