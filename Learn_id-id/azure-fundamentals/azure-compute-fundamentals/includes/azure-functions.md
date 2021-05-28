Setelah berkonsultasi dengan beberapa rekan pengembang Anda di Tailwind Traders, Anda menentukan bahwa beberapa logika aplikasi berbasis peristiwa. Dengan kata lain, untuk sebagian besar waktu, aplikasi Anda sedang menunggu masukan tertentu sebelum melakukan pemrosesan apa pun. Untuk mengurangi biaya, Anda perlu menghindari keharusan membayar waktu yang ditunggu oleh aplikasi Anda untuk input. Dengan memperhatikan hal itu, Anda telah memutuskan untuk menyelidiki Azure Functions guna melihat apakah solusi ini dapat membantu.

:::row:::
  :::column span="3":::

Komputasi *tanpa server* adalah abstraksi server, infrastruktur, dan sistem operasi. Dengan komputasi tanpa server, Azure menangani pengelolaan infrastruktur server dan alokasi dan pembatalan alokasi sumber daya berdasarkan permintaan. Infrastruktur bukanlah tanggung jawab Anda. Penskalaan dan performa ditangani secara otomatis. Anda ditagih hanya untuk sumber daya tepat yang Anda gunakan. Bahkan tidak perlu mencadangkan kapasitas.

  :::column-end:::
  :::column:::
    :::image type="icon" source="../media/serverless.png" border="false":::
  :::column-end:::
:::row-end:::

Komputasi tanpa server mencakup abstraksi server, skala berbasis peristiwa, dan penagihan mikro:

* **Abstraksi server**: Komputasi tanpa server mengabstraksi server yang Anda jalankan. Anda tidak pernah secara eksplisit memesan instans server. Platform mengelolanya untuk Anda. Setiap eksekusi fungsi dapat berjalan pada instans komputasi yang berbeda. Konteks eksekusi ini transparan terhadap kode. Dengan arsitektur tanpa server, Anda menerapkan kode Anda, yang kemudian dijalankan dengan ketersediaan tinggi.
* **Skala berbasis peristiwa**: Komputasi tanpa server sangat cocok untuk beban kerja yang merespons peristiwa masuk. Peristiwa mencakup pemicu dengan:
   * Timer, misalnya, jika fungsi perlu berjalan setiap hari pada pukul 10.00 UTC.
   * HTTP, misalnya, skenario API dan webhook.
   * Antrean, misalnya, dengan pemrosesan pesanan.
   * Dan banyak lagi.

  Alih-alih menulis seluruh aplikasi, pengembang menulis fungsi, yang berisi kode dan metadata tentang pemicu dan pengikatannya. Platform secara otomatis menjadwalkan fungsi untuk menjalankan dan menskalakan jumlah instans komputasi berdasarkan tingkat peristiwa masuk. Pemicu menentukan bagaimana sebuah fungsi dipanggil. Pengikatan menyediakan cara deklaratif untuk terhubung ke layanan dari dalam kode.
* **Micro-billing**: Tagihan komputasi tradisional untuk satu blok waktu seperti membayar tarif bulanan atau tahunan untuk hosting situs web. Metode penagihan ini nyaman tetapi tidak selalu hemat biaya. Meskipun situs web pelanggan hanya mendapat satu hasil dalam sehari, namun masih membayar ketersediaan sehari penuh. Dengan komputasi tanpa server, mereka hanya membayar untuk waktu selama kodenya berjalan. Jika tidak ada eksekusi fungsi aktif yang terjadi, maka tidak akan dikenakan biaya. Misalnya, jika kode berjalan sekali sehari selama dua menit, maka kode akan ditagih untuk satu eksekusi dan dua menit waktu komputasi.

#### <a name="serverless-computing-in-azure"></a>Komputasi tanpa server di Azure

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE2yzjL]

Azure memiliki dua implementasi komputasi tanpa server:

- **Azure Functions**: Fungsi dapat menjalankan kode dalam hampir semua bahasa modern.
- **Azure Logic Apps**: Aplikasi logika dirancang dalam desainer berbasis web dan dapat menjalankan logika yang dipicu oleh layanan Azure tanpa menulis kode apa pun.

## <a name="azure-functions"></a>Azure Functions

Ketika Anda hanya khawatir tentang kode yang menjalankan layanan Anda, dan bukan platform atau infrastruktur yang mendasarinya, menggunakan Azure Functions adalah pilihan yang sangat ideal. Fungsi umumnya digunakan saat Anda perlu melakukan pekerjaan sebagai respons terhadap suatu peristiwa (seringkali melalui permintaan REST), timer, atau pesan dari layanan Azure lain, dan kapan pekerjaan tersebut dapat diselesaikan dengan cepat, dalam hitungan detik atau kurang.

Fungsi diskalakan secara otomatis berdasarkan permintaan, sehingga merupakan pilihan solid saat permintaannya berubah-ubah. Sebagai contoh, Anda mungkin menerima pesan dari solusi IoT yang digunakan untuk memantau armada kendaraan pengiriman. Anda mungkin akan mendapatkan lebih banyak data yang tiba selama jam kerja.

Dengan menggunakan pendekatan berbasis komputer virtual, Anda akan dikenai biaya meskipun komputer virtual sedang menganggur. Dengan fungsi, Azure menjalankan kode Anda saat terpicu dan secara otomatis menangani sumber daya saat fungsi selesai. Dalam model ini, Anda hanya akan dikenai biaya untuk waktu CPU yang digunakan saat fungsi Anda berjalan.

Fungsi bisa stateless atau dengan stateful. Saat tanpa stateless (default), fungsi berperilaku seolah-olah dimulai ulang setiap kali menanggapi suatu peristiwa. Saat dinyatakan stateful (disebut Durable Functions), suatu konteks diteruskan melalui fungsi untuk melacak aktivitas sebelumnya.

Fungsi adalah komponen kunci komputasi tanpa server. Fungsi-fungsi tersebut juga merupakan platform komputasi umum untuk menjalankan semua jenis kode. Jika kebutuhan aplikasi pengembang berubah, Anda dapat menyebarkan proyek di lingkungan yang bukan tanpa server. Dengan Fleksibilitas ini, Anda dapat mengelola penskalaan, menjalankan jaringan virtual, dan bahkan mengisolasi fungsi sepenuhnya.

## <a name="azure-logic-apps"></a>Azure Logic Apps

Aplikasi logika mirip dengan fungsi. Keduanya memungkinkan Anda memicu logika berdasarkan peristiwa. Sementara fungsi mengeksekusi kode, aplikasi logika mengeksekusi _alur kerja_ yang dirancang untuk mengotomatiskan skenario bisnis dan dibangun dari blok logika yang telah ditentukan sebelumnya.

Setiap alur kerja aplikasi logika Azure dimulai dengan pemicu, yang aktif saat peristiwa tertentu terjadi atau saat data yang baru tersedia memenuhi kriteria tertentu. Banyak pemicu mencakup kemampuan penjadwalan dasar, sehingga pengembang dapat menentukan seberapa teratur beban kerja mereka akan berjalan. Setiap kali pemicu diterapkan, mesin Logic Apps membuat contoh aplikasi logika yang menjalankan tindakan di alur kerja. Tindakan ini juga dapat mencakup konversi data dan kontrol aliran, seperti pernyataan bersyarat, pernyataan switch, loop, dan branching.

Anda membuat alur kerja aplikasi logika menggunakan desainer visual di portal Azure atau di Visual Studio. Alur kerja tetap ada sebagai file JSON dengan skema alur kerja yang telah dikenali.

Azure menyediakan lebih dari 200 konektor dan blok pemrosesan yang berbeda untuk berinteraksi dengan layanan yang berbeda. Sumber daya ini mencakup aplikasi perusahaan paling populer. Anda juga dapat menyusun konektor kustom dan langkah-langkah alur kerja jika layanan yang perlu berinteraksi dengan Anda tidak tercakup. Anda selanjutnya menggunakan desainer visual untuk menautkan konektor dan memblokir bersama-sama. Anda meneruskan data melalui alur kerja untuk melakukan pemrosesan kustom, seringkali semua tanpa menulis kode apa pun.

Sebagai contoh, katakanlah tiket tiba di Zendesk. Anda bisa:

- Mendeteksi maksud pesan dengan layanan kognitif.
- Membuat item di SharePoint untuk melacak masalah tersebut.
- Menambahkan pelanggan ke sistem Dynamics 365 CRM Anda jika belum ada di database Anda.
- Mengirim email tindak lanjut untuk mengonfirmasi permintaan mereka.

Semua tindakan tersebut dapat dirancang dalam sebuah desainer visual, yang mempermudah melihat alur logikanya. Untuk alasan ini, ini sangat ideal untuk peran analis bisnis.

## <a name="functions-vs-logic-apps"></a>Functions vs. Logic Apps

Functions dan Logic Apps dapat menciptakan orkestrasi yang kompleks. Orkestrasi adalah kumpulan fungsi atau langkah-langkah yang dijalankan untuk menyelesaikan tugas yang kompleks.

- Dengan Functions, Anda menulis kode untuk menyelesaikan setiap langkah.
- Dengan Logic Apps, Anda menggunakan GUI untuk menentukan tindakan dan bagaimana tindakan-tindakan itu berhubungan satu sama lain.

Anda dapat mencampur dan mencocokkan layanan saat membuat orkestrasi, memanggil fungsi dari aplikasi logika, dan memanggil aplikasi logika dari fungsi. Berikut adalah beberapa perbedaan umum antara keduanya.

| | Fungsi | Logic Apps |
|---|---|---|
| Provinsi | Biasanya stateless, tetapi Durable Functions menyediakan status. | Stateful. |
| Pengembangan | Code-first (imperatif). | Designer-first (deklaratif). |
| Konektivitas | Sekitar selusin jenis pengikatan bawaan. Tulis kode untuk pengikatan kustom. | Koleksi konektor dalam jumlah besar. Paket Integrasi Perusahaan untuk skenario B2B. Buat konektor kustom. |
| Tindakan | Setiap aktivitas adalah fungsi Azure. Tulis kode untuk fungsi aktivitas. | Banyak koleksi tindakan siap saji. |
| Pemantauan | Azure Application Insights. | Portal Azure, Log Analytics. |
| Manajemen | REST API, Visual Studio. | Portal Azure, REST API, PowerShell, Visual Studio. |
| Konteks eksekusi | Dapat berjalan secara lokal maupun cloud. | Hanya berjalan di cloud. |
