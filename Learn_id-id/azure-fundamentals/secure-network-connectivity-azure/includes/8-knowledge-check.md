Pertimbangkan skenario berikut. Kemudian pilih respons terbaik untuk setiap pertanyaan selanjutnya, lalu pilih **Periksa jawaban Anda**.

Tailwind Traders memindahkan sistem pembayaran online ke Azure. Pemrosesan pesanan online dimulai melalui situs web, yang dikelola Tailwind Traders melalui Azure App Service. (App Service adalah cara untuk menghosting aplikasi web di Azure.)

Aplikasi web yang menjalankan situs web meneruskan informasi pesanan ke komputer virtual (VM), yang selanjutnya memproses setiap pesanan. VM ini tersedia di jaringan virtual Azure, tetapi perlu mengakses internet untuk mengambil paket perangkat lunak dan pembaruan sistem.

Berikut adalah diagram yang menunjukkan arsitektur dasar sistem pembayaran perusahaan:

:::image type="content" source="../media/8-architecture.png" alt-text="Diagram arsitektur yang memperlihatkan lalu lintas jaringan yang mengalir ke Azure. Azure App Service menerima lalu lintas jaringan publik ke komputer virtual yang berjalan di jaringan virtual." border="false":::

Tim keamanan ingin memastikan bahwa hanya lalu lintas jaringan yang valid yang mencapai sumber daya Azure milik perusahaan. Sebagai lapisan pertahanan ekstra, tim juga ingin memastikan bahwa VM hanya dapat menjangkau host tepercaya di port tertentu.
