Pertimbangkan skenario berikut. Kemudian pilih respons terbaik untuk setiap pertanyaan yang berikut. Lalu pilih **Periksa jawaban Anda**.

Tailwind Traders memindahkan sistem pembayaran online dari pusat datanya ke cloud. Sistem pembayaran terdiri dari komputer virtual (VM) dan database SQL Server.

Berikut adalah beberapa persyaratan keamanan yang diidentifikasi perusahaan saat merencanakan migrasi:

* Hal ini ingin memastikan postur keamanan yang baik di semua sistemnya, baik di Azure maupun secara lokal.
* Di pusat data, akses ke VM memerlukan sertifikat TLS. Perusahaan membutuhkan tempat untuk menyimpan dan mengelola sertifikatnya dengan aman.

Berikut adalah beberapa persyaratan tambahan yang berkaitan dengan kepatuhan terhadap peraturan:

* Trader Tailwind harus menyimpan data pelanggan tertentu secara lokal, di pusat datanya.
* Untuk beban kerja tertentu, perusahaan harus menjadi satu-satunya pelanggan yang menjalankan VM pada perangkat keras fisik.
* Perusahaan hanya boleh menjalankan aplikasi bisnis yang disetujui pada setiap VM.

Lihat diagram berikut yang memperlihatkan arsitektur yang diusulkan.

:::image type="content" source="../media/7-architecture.png" alt-text="Diagram yang memperlihatkan arsitektur yang diusulkan. Komputer virtual berjalan baik di Azure maupun di pusat data." border="false":::

Di Azure, Tailwind Traders akan menggunakan VM standar dan VM yang berjalan pada perangkat keras fisik khusus. Di pusat data, perusahaan akan menjalankan VM yang dapat tersambung ke database dalam jaringan internalnya.
