:::row:::
  :::column span="3":::
Azure SQL Database adalah layanan database hubungan yang didasarkan pada versi stabil terbaru dari mesin database Microsoft SQL Server Database. SQL Database adalah database dengan performa tinggi, andal, terkelola sepenuhnya, dan aman. Anda dapat menggunakan ini untuk membangun aplikasi dan situs web berbasis data dengan bahasa pemrograman pilihan Anda, tanpa perlu mengelola infrastruktur.
  :::column-end:::
  :::column:::
    :::image type="icon" source="../media/icon-service-SQL-Database.png" border="false":::
  :::column-end:::
:::row-end:::

## <a name="features"></a>Fitur

Azure SQL Database adalah platform mesin database platform as a service (PaaS). Layanan ini menangani sebagian besar fungsi manajemen database, seperti peningkatan, patching, pencadangan, dan pemantauan, tanpa keterlibatan pengguna. SQL Database menyediakan ketersediaan 99,99 persen. Kemampuan PaaS yang disertakan dalam SQL Database memungkinkan Anda untuk fokus pada administrasi database domain khusus dan aktivitas pengoptimalan yang penting bagi bisnis Anda. SQL Database adalah layanan terkelola penuh yang memiliki ketersediaan tinggi bawaan, pencadangan, dan operasi pemeliharaan umum lainnya. Microsoft menangani semua pembaruan untuk SQL dan kode sistem operasi. Anda tidak perlu mengelola infrastruktur yang mendasar.

Anda dapat membuat lapisan penyimpanan data dengan ketersediaan dan performa tinggi untuk aplikasi dan solusi di Azure. SQL Database dapat menjadi pilihan yang tepat untuk berbagai aplikasi cloud modern karena memungkinkan Anda memproses data relasional dan struktur non-relasional, seperti grafik, JSON, spasial, dan XML.

Anda dapat menggunakan fitur pemrosesan kueri tingkat lanjut, seperti teknologi dan memori berperforma tinggi, dan pemrosesan kueri cerdas. Bahkan, kemampuan terbaru SQL Server dirilis pertama kali pada SQL Database, lalu setelah itu ke SQL Server itu sendiri. Anda mendapatkan kemampuan SQL Server terbaru, tanpa biaya tambahan untuk pembaruan atau peningkatan, yang diuji pada jutaan database.

## <a name="migration"></a>Migration

Tailwind Traders saat ini menggunakan beberapa server lokal yang menjalankan SQL Server, dan menyediakan penyimpanan data untuk situs web publik Anda (misalnya, data pelanggan, riwayat pesanan, dan katalog produk). Selain itu, server lokal Anda yang menjalankan SQL Server juga menyediakan penyimpanan data untuk situs web portal pelatihan khusus internal. Tailwind Traders menggunakan situs web tersebut untuk materi pelatihan karyawan baru (seperti bahan pembelajaran, detail sertifikasi, dan transkrip pelatihan). Ilustrasi berikut ini menampilkan jenis data yang dapat disimpan perusahaan Anda di situs web portal pelatihan Azure SQL Database.

[![Diagram Azure SQL Database pada situs web portal pelatihan.](../media/azure-sql.png)](../media/azure-sql-expanded.png#lightbox)

Anda dapat memigrasikan database SQL Server yang ada dengan waktu henti minimal menggunakan Azure Database Migration Service. Asisten Migrasi Data Microsoft dapat membuat laporan penilaian yang memberikan rekomendasi untuk membantu memandu Anda melalui perubahan yang diperlukan sebelum melakukan migrasi. Setelah menilai dan menyelesaikan remediasi yang diperlukan, Anda siap untuk memulai proses migrasi. Azure Database Migration Service melakukan semua langkah yang diperlukan. Anda hanya perlu mengubah string koneksi di aplikasi Anda.
