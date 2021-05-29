:::row:::
  :::column span="3":::
Azure Files menawarkan berbagi file yang dikelola penuh di cloud yang dapat diakses melalui protokol Blok Pesan Server dan Sistem File Jaringan (pratinjau) standar industri. Berbagi file Azure dapat dipasang bersamaan dengan penyebaran Windows, Linux, dan macOS cloud atau lokal. Aplikasi yang berjalan di komputer virtual Azure atau layanan cloud dapat memasang berbagi penyimpanan file untuk mengakses data file, sama seperti aplikasi desktop yang akan memasang berbagi SMB biasa. Sejumlah komputer virtual atau peran Azure dapat memasang dan mengakses berbagi penyimpanan file secara bersamaan. Skenario penggunaan umum adalah berbagi file di mana saja di dunia, data diagnostik, atau berbagi data aplikasi.
  :::column-end:::
  :::column:::
    :::image type="icon" source="../media/icon-azure-files.png" border="false":::
  :::column-end:::
:::row-end:::

Gunakan Azure Files untuk situasi berikut ini:

- Banyak aplikasi lokal menggunakan berbagi file. Azure Files mempermudah migrasi aplikasi yang berbagi data ke Azure. Jika Anda memasang berbagi file Azure ke huruf kandar yang sama dengan yang digunakan aplikasi lokal, bagian dari aplikasi Anda yang mengakses berbagi file harus berfungsi dengan perubahan minimal, jika ada.

- Simpan file konfigurasi di berbagi file dan akses dari beberapa komputer virtual. Alat dan utilitas yang digunakan oleh beberapa pengembang dalam grup dapat disimpan di berbagi file, yang memastikan semua orang dapat menemukannya, dan menggunakan versi yang sama.

- Tulis data ke berbagi file, dan proses atau analisis data nanti. Misalnya, Anda mungkin ingin melakukan ini dengan log diagnostik, metrik, dan crash dump.

Ilustrasi berikut memperlihatkan Azure Files yang digunakan untuk berbagi data di antara dua lokasi geografis. Azure Files memastikan data dienkripsi saat tidak digunakan, dan protokol SMB memastikan data dienkripsi saat transit.

![Diagram yang memperlihatkan kemampuan berbagi file Azure Files antara berbagi file Azure AS Barat dan berbagi file Azure Eropa, masing-masing dengan pengguna SMB mereka sendiri.](../media/azure-files.png)

Satu hal yang membedakan Azure Files dari file di berbagi file perusahaan adalah Anda dapat mengakses file dari mana saja di dunia, menggunakan URL yang mengarah ke file. Anda juga dapat menggunakan token Tanda Tangan Akses Bersama (SAS) untuk mengizinkan akses ke aset privat selama jangka waktu tertentu.

Berikut adalah contoh layanan URI SAS, yang menunjukkan URI sumber daya dan token SAS:

[![Cuplikan layar komponen layanan URI SAS.](../media/sas-storage-uri.png)](../media/sas-storage-uri.png#lightbox)