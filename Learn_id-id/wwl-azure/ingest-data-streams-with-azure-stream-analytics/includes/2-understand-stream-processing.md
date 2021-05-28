Pemrosesan stream mengacu pada penyerapan, transformasi, dan analisis aliran data yang berkelanjutan yang dihasilkan oleh aplikasi, perangkat dan sensor IoT, dan sumber lain untuk memperoleh wawasan yang dapat ditindaklanjuti hampir secara real-time. Analisis aliran data sering melibatkan penggunaan operasi temporal, seperti agregat berjendela, gabungan sementara, dan fungsi analisis sementara untuk mengukur perubahan atau perbedaan dari waktu ke waktu. Tujuannya untuk:

- Terus memantau data menggunakan jendela kotak waktu untuk lebih memahami bagaimana bidang minat tertentu berubah atau berfluktuasi dari waktu ke waktu
- Mengidentifikasi dan bereaksi terhadap anomali atau penyimpangan dalam data secara real-time
- Terus menganalisis data baru untuk mengidentifikasi dan menanggapi masalah secara real-time
- Memicu tindakan tertentu saat ambang batas tertentu diidentifikasi

Propagasi eksponensial aplikasi, perangkat, dan sensor yang tersambung telah mendorong kebutuhan organisasi untuk menganalisis data streaming saat tiba dan menggunakan pengetahuan laten yang terdapat dalam data untuk membuat keputusan bisnis hampir secara real-time. Beberapa contoh kasus penggunaan analisis data streaming meliputi:

- Deteksi anomali untuk mengidentifikasi transaksi yang berpotensi menipu di industri keuangan
- Membuat rekomendasi produk kepada pelanggan online secara real-time
- Memantau alur dan sistem distribusi oleh perusahaan minyak
- Menghasilkan jadwal pemeliharaan prediktif untuk peralatan industri dan manufaktur
- Analisis sentimen dari posting media sosial

## <a name="approaches-to-data-stream-processing"></a>Pendekatan untuk pemrosesan aliran data

Pendekatan utama untuk pemrosesan streaming adalah menganalisis data baru secara terus-menerus, mengubah data masuk saat tiba untuk memfasilitasi wawasan hampir secara real-time. Komputasi dan agregasi dapat dijalankan terhadap data menggunakan analisis sementara dan dikirim ke dasbor Power BI untuk visualisasi dan analisis real-time. Pendekatan ini biasanya melibatkan penyimpanan data streaming ke penyimpanan data, seperti Azure Data Lake Storage (ADLS) Gen2, untuk pemeriksaan lebih lanjut atau beban kerja analitik yang lebih canggih.

Pendekatan alternatif untuk memproses data streaming adalah dengan menyimpan data masuk di penyimpanan data, seperti Azure Data Lake Storage (ADLS) Gen2. Kemudian Anda dapat memproses data _statis_ dalam batch pada lain waktu. Pendekatan ini sering digunakan untuk memanfaatkan biaya komputasi lebih rendah saat memproses sekumpulan besar data yang ada.
