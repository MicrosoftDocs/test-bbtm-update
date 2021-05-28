Dalam latihan ini, Anda menggunakan [Power BI](https://docs.microsoft.com/power-bi/fundamentals/power-bi-overview) untuk membuat laporan yang menampilkan data anomali kendaraan yang diambil dan menyematkannya ke dasbor langsung untuk pembaruan yang hampir real-time. Power BI menyediakan platform untuk memvisualisasikan dan menganalisis data agregat dalam alur analitik hampir real-time yang dibangun di Azure Event Hubs, Azure Stream Analytics, dan Power BI.

1. Buka browser web, navigasi ke <https://powerbi.microsoft.com/>, dan pilih **Masuk** di kanan atas.

    ![Beranda Power BI diperlihatkan dengan tautan Masuk disorot.](../media/power-bi-sign-in-2.png "Beranda Power BI")

2. Masukkan kredensial Power BI yang Anda gunakan saat membuat output Power BI untuk Analisis Aliran.

3. Setelah masuk, pilih **Ruang Kerja Saya** di menu sebelah kiri.

    ![Tautan Ruang Kerja Saya dipilih di menu sebelah kiri.](../media/power-bi-my-workspace-link.png "Ruang Kerja Saya")

4. Pilih tab **Himpunan Data + aliran data** di atas ruang kerja. Temukan himpunan data bernama **ContosoAutoVehicleAnomalies**, lalu pilih tombol tindakan **Buat Laporan** di sebelah kanan nama. Jika Anda tidak melihat himpunan data, Anda mungkin perlu menunggu beberapa menit dan me-refresh halaman.

    ![Tab Himpunan Data dipilih di Ruang Kerja Saya, dan himpunan data VehicleAnomalies disorot.](../media/power-bi-my-workspace.png "Himpunan Data")

    > [!Note]
    > Perlu beberapa menit hingga himpunan data muncul. Secara berkala, Anda mungkin perlu me-refresh halaman sebelum melihat tab Himpunan Data.

5. Anda akan melihat laporan kosong baru untuk VehicleAnomalies dengan daftar bidang di ujung kanan.

    ![Laporan kosong baru ditampilkan dengan daftar bidang di sebelah kanan.](../media/power-bi-blank-report.png "Laporan kosong")

6. Pilih visualisasi **Peta** di dalam bagian Visualisasi di sebelah kanan.

    ![Visualisasi Peta disorot.](../media/power-bi-map-visualizations.png "Visualisasi")

7. Seret bidang **kota** ke **Lokasi**, dan **aggressivedriving** ke **Ukuran**. Menambahkan nilai-nilai ini ke visualisasi menempatkan titik-titik dengan ukuran yang berbeda di atas kota-kota pada peta, tergantung pada jumlah rekaman mengemudi agresif yang ada.

    ![Cuplikan layar menampilkan tempat untuk menyeret bidang ke pengaturan peta.](../media/power-bi-map-fields.png "Pengaturan peta")

8. Hasilnya akan terlihat mirip dengan gambar berikut:

    ![Peta ditampilkan pada laporan.](../media/power-bi-map-2.png "Peta")

9. Pilih area kosong pada laporan untuk membatalkan pilihan peta. Sekarang pilih visualisasi **Peta pohon**.

    ![Visualisasi Peta pohon disorot.](../media/power-bi-treemap-visualizations.png "Visualisasi")

10. Seret bidang **enginetemperature** ke **Nilai**, lalu seret bidang **transmission_gear_position** ke **Grup**. Ini akan mengelompokkan nilai suhu mesin dengan posisi roda gigi transmisi pada peta pohon sehingga Anda dapat melihat gigi mana yang terkait dengan suhu mesin terpanas atau terdingin. Peta pohon membuat ukuran grup sesuai dengan nilai, dengan yang terbesar muncul di kiri atas dan terendah di kanan bawah.

    ![Cuplikan layar menampilkan tempat untuk menyeret bidang ke pengaturan peta pohon.](../media/power-bi-treemap-fields.png "Pengaturan peta pohon")

11. Pilih panah bawah di samping bidang **enginetemperature** di bawah **Nilai**. Pilih **Rata-rata** dari menu untuk menggabungkan nilai menurut rata-rata, bukan jumlah.

    ![Opsi menu Rata-rata disorot untuk nilai enginetemperature.](../media/power-bi-treemap-average.png "Suhu mesin rata-rata")

12. Peta pohon akan terlihat mirip dengan gambar berikut:

    ![Peta pohon ditampilkan pada laporan.](../media/power-bi-treemap.png "Peta pohon")

13. Pilih area kosong pada laporan untuk membatalkan pilihan peta pohon. Sekarang pilih visualisasi **Bagan area**.

    ![Visualisasi Bagan area disorot.](../media/power-bi-areachart-visualizations.png "Visualisasi bagan area")

14. Seret bidang **wilayah** ke **Legenda**, bidang **kecepatan** ke **Nilai**, dan bidang **tanda waktu** ke **Sumbu**. Ini akan menampilkan bagan area dengan warna yang berbeda yang menunjukkan wilayah dan kecepatan pengemudi bepergian dari waktu ke waktu dalam wilayah tersebut.

    ![Cuplikan layar menampilkan tempat untuk menyeret bidang ke pengaturan bagan area.](../media/power-bi-areachart-fields.png "Pengaturan bagan area")

15. Pilih panah bawah di samping bidang **kecepatan** di bawah **Nilai**. Pilih **Rata-rata** dari menu untuk menggabungkan nilai menurut rata-rata, bukan jumlah.

    ![Opsi menu Rata-rata disorot untuk nilai kecepatan.](../media/power-bi-areachart-average.png "Kecepatan rata-rata")

16. Bagan area akan terlihat mirip dengan gambar berikut:

    ![Bagan area pada laporan.](../media/power-bi-areachart.png "Bagan area")

17. Pilih area kosong pada laporan untuk membatalkan pilihan peta pohon. Sekarang pilih visualisasi **kartu multibaris**.

    ![Visualisasi multikartu disorot.](../media/power-bi-card-visualizations.png "Visualisasi kartu multibaris")

18. Seret bidang **aggressivedriving**, **enginetempanomaly**, dan bidang **oilanomaly** ke **Bidang**.

    ![Cuplikan layar menampilkan tempat untuk menyeret bidang ke pengaturan kartu multibaris.](../media/power-bi-card-fields.png "Pengaturan kartu multibaris")

19. Pilih tab **Format** di pengaturan kartu multibaris, lalu perluas **Label data**. Atur **Ukuran teks** ke 30. Perluas **Label kategori** dan atur **Ukuran teks** ke 12.

    ![Cuplikan layar tab format.](../media/power-bi-card-format.png "Format kartu multibaris")

20. Kartu multibaris akan terlihat mirip dengan gambar berikut:

    ![Kartu multibaris pada laporan.](../media/power-bi-card.png "Kartu multibaris")

21. Pilih **Simpan** di kanan atas halaman.

    ![Tombol simpan disorot.](../media/power-bi-save.png "Simpan")

22. Masukkan nama, seperti "Anomali Kendaraan Otomatis Contoso", lalu pilih **Simpan**.

    ![Cuplikan layar dialog simpan.](../media/power-bi-save-dialog.png "Dialog Simpan")

23. Sekarang, mari kita tambahkan laporan ini ke dasbor. Pilih **Sematkan ke dasbor** di bagian atas laporan. Anda mungkin harus memilih ikon elipsis (...) untuk melihat opsi.

    ![Tombol Sematkan ke dasbor disorot.](../media/power-bi-live.png "Sematkan ke dasbor")

24. Pilih **Dasbor baru**, lalu masukkan nama, seperti "Dasbor Anomali Kendaraan Otomatis Contoso." Pilih **Sematkan langsung.** Saat diminta, pilih opsi untuk melihat dasbor. Jika tidak, Anda dapat menemukan dasbor di bawah Ruang Kerja Saya di menu sebelah kiri.

    ![Cuplikan layar dialog sematkan ke dasbor.](../media/power-bi-live-dialog.png "Dialog Sematkan ke dasbor")

25. Dasbor langsung akan di-refresh dan diperbarui secara otomatis saat data sedang diambil. Anda bisa mengarahkan kursor ke titik mana pun pada bagan untuk menampilkan informasi tentang item tersebut. Pilih salah satu wilayah di legenda di atas bagan kecepatan rata-rata. Semua bagan lainnya akan difilter menurut wilayah tersebut secara otomatis. Pilih lagi wilayah untuk menghapus filter.

    ![Tampilan dasbor langsung.](../media/power-bi-dashboard.png "Dasbor")
