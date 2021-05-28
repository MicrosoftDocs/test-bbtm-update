Sebagai pengembang Tailwind Traders, Anda mungkin memiliki keahlian membuat aplikasi. Saat bermigrasi ke Azure, banyak langakah yang akan Anda ikuti untuk mengatur situs web di cloud dan sejajar dengan langkah yang diikuti saat membuat situs web si pusat data Perusahaan Anda. Contoh, Anda harus memilih tempat membuat situs web, kemudian mengalokasikan sumber daya yang diperlukan. In Azure, the physical hardware is managed for you, so your tasks are to choose where your website will be located and which resources to provide.

Pada latihan ini, Anda akan membuat Azure App Service instance untuk menghost situs web WordPress

## <a name="azure-terminology-and-concepts"></a>Konsep dan terminologi Azure

sebelum dimulai, silahkan review dan deskripsikan beberapa konsep dan hal hal mendasar yang akan dibutuhkan ketika membuat website Anda.

### <a name="what-is-app-service"></a>Apa App service itu?

App Service adalah layanan berbasis sebuah HTTP yang memungkinkan anda untuk membangun dan menghosting banyak jenis solusi tanpa mengatur infrastruktur Misalnya, Anda dapat menghosting aplikasi web, back ends seluler, dan RESTful APIs di beberapa bahasa pemrograman yang mendukung Aplikasi yang berkembang in .NET, .NET Core, Java, Ruby, Node.js, PHP, or Python dapat menjalankan dan menskalakan dengan mudah di lingkungan Windows-based dan Linux-based

Untuk latihan ini, kami akan membuat sebuah situs web dalam waktu singkat. Jadi, kami tidak akan menulis kode apapun. Sebagai gantinya, Anda akan menerapkan aplikasi yang telah di tentukan dari Azure Marketplace.

### <a name="what-is-azure-marketplace"></a>Apa itu Azure Marketplace?

Azure Marketplace adalah toko online yang menghosting aplikasi yang bersertifikat dan di optimalkan untuk dijalankan di Azure. Banyak jenis aplikasi yang tersedia, mulai dari Al dan machine learning hingga aplikasi web. Seperti yang Anda lihat dalam beberapa menit, penyebaran dari toko diselesaikan via Aportal Azure dengan menggunakan pengguna antarmuka wizard-style Antarmuka pengguna ini membuat mudah solusi penilaian yang berbeda

Kita akan menggunakan pilihan aplikasi WordPresss dari Azure marketplace untuk situs web

### <a name="create-resources-in-azure"></a>Buat sumber daya di Azure

Pada umumnya, hal pertama yang dilakukan adalah membuat *grup sumber daya* untuk mengatur semua hal yang kita buat. Grup sumber daya memungkinkan untuk mengelola semua layanan, disk, gangguan jaringan dan elemen lain yang berpotensi memberi solusi sebagai unit. Kita dapat menggunakan portal Azure untuk membuat dan mengatur grup sumber daya solusi kami. Ingat bahwa Anda juga dapat mengatur sumber daya via command-line dengan menggunakan Azure CLI Azure CLI adalah pilihan berguna jika anda butuh proses otomatis di masa mendatang.

Pada lingkungan Azure sandbox gratis, Anda akan menggunakan grup sumber daya yang telah di buat **<rgn>[nama grup sumber daya sandbox]</rgn>**, dan Anda tidak membutuhkan langkah ini.

### <a name="choose-a-location"></a>Pilih lokasi

[!include [Sandbox regions](../../../includes/azure-sandbox-regions-first-mention-note.md)]

## <a name="create-a-wordpress-website"></a>buatlah situs web Wordpress

1. Jika Anda belum selesai, verifikasilah yang sudah di aktifasi sandbox.

    Mengaktifkan sandbox mengalokasikan grup langganan dan sumber daya yang akan Anda gunakan dalam latihan ini. Langkah ini diperlukan untuk setiap latihan Microsoft Learn yang menggunakan sandbox.

1. Masuk ke [Portal Azure](https://portal.azure.com/learn.docs.microsoft.com?azure-portal=true) menggunakan akun yang sama dengan Anda mengaktifkan sandbox.

1. Pada kiri atas panel portal Azure, pilih **Buat Sumber Daya**.

    [![Cuplikan layar portal Azure memperlihatkan panel kiri dengan opsi Buat sumber daya disorot.](../media/create-resource.png)](../media/create-resource-expanded.png#lightbox)

    Pilihan ini membawamu ke **Azure Marketplace**.

    [![Cuplikan layar portal Azure memperlihatkan kategori Azure Marketplace di kolom kiri dan opsi populer di kolom kanan.](../media/azure-marketplace.png)](../media/azure-marketplace-expanded.png#lightbox)

1. Azure Marketplace memiliki banyak layanan, solusi, dan sumber daya yang tersedia untuk Anda gunakan. Kami tahu bahwa kami ingin menginstal WordPress, sehingga kami dapat melakukan pencarian cepat untuk itu. Pada kotak **Cari Marketplace** dengan opsi aplikasi yang tercantum, masukkan **WordPress**. Pilih opsi **WordPress** default dari daftar opsi yang tersedia.

    [![Cuplikan layar portal Azure memperlihatkan hasil pencarian untuk istilah WordPress dengan opsi WordPress disorot.](../media/search-select-wordpress.png)](../media/search-select-wordpress-expanded.png#lightbox)

1. Pada panel **WordPress** yang muncul, Anda biasanya akan menemukan informasi selengkapnya tentang item yang akan Anda instal, seperti penerbit, deskripsi singkat sumber daya, dan link ke informasi selengkapnya. Pastikan untuk meninjau informasi ini. Pilih **Buat** untuk memulai proses untuk membuat aplikasi WordPress. Panel **WordPress/Buat** muncul.

    [![Cuplikan layar portal Azure memperlihatkan ringkasan jenis sumber daya WordPress.](../media/create-site.png)](../media/create-site-expanded.png#lightbox)

1. Beberapa opsi muncul untuk mengonfigurasi penyebaran Anda. Masukkan nilai berikut untuk setiap pengaturan.

    | Pengaturan  | Nilai  |
    |---|---|
    | Nama aplikasi | Choose a unique value for the app name. Ini akan menjadi bagian dari nama domain yang sepenuhnya memenuhi syarat (FQDN). |
    | Langganan | Pastikan **Langganan Concierge** dipilih. |
    | Grup Sumber Daya | Pilih opsi **Gunakan yang ada**, dan pilih **<rgn>[nama grup sumber daya sandbox]</rgn>** grup sumber daya dari menu tarik-turun. |
    | Penyedia Basis Data | Dari menu tarik-turun, pilih **MySQL di Aplikasi**. |
    | Paket Layanan Aplikasi/Lokasi | Anda akan mengubah paket Layanan Aplikasi di langkah berikutnya. |
    | Application Insights | Biarkan di konfigurasi default. |

    Konfigurasi Anda akan terlihat seperti contoh ini.

    :::image type="content" source="../media/config-info-create.png" alt-text="Cuplikan layar portal Azure yang menunjukkan layanan aplikasi WordPress baru dikonfigurasi seperti yang diinstruksikan.":::
    
    > [!NOTE]
    > Jika Anda masih menemukan bagian yang disebut **Database**, pastikan Anda memilih **Penyedia Basis Data yang benar** yang digambarkan pada konfigurasi sebelumnya.

1. Sekarang, mari kita konfigurasi rencana Layanan Aplikasi untuk menggunakan tingkat harga tertentu. Paket Layanan Aplikasi menentukan sumber daya komputasi dan lokasi untuk aplikasi web. Pilih **paket Layanan Aplikasi/Lokasi**. Panel **paket Layanan Aplikasi** muncul.

    :::image type="content" source="../media/config-app-service-plan.png" alt-text="Cuplikan layar portal Azure memperlihatkan pembuatan Layanan Aplikasi WordPress dengan paket Layanan Aplikasi / tombol Lokasi disorot.":::

1. Pilih **Buat baru**.

    [![Cuplikan layar portal Azure memperlihatkan panel paket Layanan Aplikasi dengan tombol Buat baru disorot.](../media/new-app-service-plan.png)](../media/new-app-service-plan-expanded.png#lightbox)

    Panel **Paket Layanan Aplikasi Baru** muncul.

1. Masukkan nilai berikut untuk setiap pengaturan.

    | Pengaturan  | Nilai  |
    |---|---|
    | Paket Layanan Aplikasi | Pilih nama unik untuk paket layanan aplikasi baru. |
    | Lokasi | Pilih **AS** Pusat untuk memastikan kami memilih wilayah yang memungkinkan paket layanan yang akan Anda pilih. Biasanya, Anda akan memilih wilayah yang paling dekat dengan pelanggan Anda sambil menawarkan layanan yang Anda butuhkan. |
    | Tingkatan harga | Pilih opsi ini untuk melihat opsi kinerja dan fitur dari berbagai jenis paket layanan aplikasi. Panel **Spec Picker** muncul.

    [![Cuplikan layar portal Azure memperlihatkan konfigurasi paket Layanan Aplikasi Baru dengan tombol tingkat Harga disorot](../media/new-service-plan-config.png)](../media/new-service-plan-config-expanded.png#lightbox)

1. **Spec Picker** memungkinkan kami untuk memilih tingkat harga baru untuk aplikasi kami. Panel terbuka ke tab **Produksi** , dengan tingkatan harga S1 dipilih. Pilih tingkat harga baru dari tab **Dev / Test** untuk website kami.

1. Pilih tab **Dev / Test**, lalu pilih **F1** tingkat harga, lalu pilih **Terapkan**.

    [![Cuplikan layar portal Azure memperlihatkan panel Pemilih Spesifikasi paket Layanan Aplikasi dengan bagian Dev / Test dipilih dan tingkat F1 gratis dan tombol Terapkan disorot.](../media/select-pricing-tier.png)](../media/select-pricing-tier-expanded.png#lightbox)

1. Kembali ke panel **Paket Layanan Aplikasi Gratis** , pilih **OK** untuk membuat paket baru.

1. Terakhir, **pilih Buat** untuk memulai penyebaran situs baru Anda.

    > [!NOTE]
    > Jika Anda mengalami masalah saat membuat sumber daya, verifikasi Anda telah memilih tingkat harga **F1** pada paket Layanan Aplikasi baru. Menggunakan tingkat harga F1 adalah persyaratan sistem sandbox ketika Anda membuat situs WordPress ini.

## <a name="verify-your-website-is-running"></a>Memverifikasi bahwa situs web Anda sedang berjalan

Penyebaran situs web baru dapat memakan waktu beberapa menit untuk diselesaikan. Anda dipersilakan untuk menjelajahi portal lebih jauh sendiri.

Kita dapat melacak kemajuan penyebaran kapan saja.

1. Pilih **ikon bel** Pemberitahuan di bagian atas portal. Jika lebar jendela browser Anda lebih kecil, itu mungkin ditampilkan ketika Anda memilih ikon elipsis (**...**) di sudut kanan atas.

    [![Cuplikan layar portal Azure memperlihatkan menu kanan atas dengan tombol bel Pemberitahuan disorot.](../media/notification-bell.png)](../media/notification-bell-expanded.png#lightbox)

1. Pilih **Penyebaran sedang berangsung** untuk melihat detail tentang semua sumber daya yang dibuat.

    [![Cuplikan layar portal Azure memperlihatkan pemberitahuan penyebaran di daftar Pemberitahuan.](../media/notification-bell-info.png)](../media/notification-bell-info-expanded.png#lightbox)

    Perhatikan bagaimana sumber daya dicantumkan saat dibuat dan status berubah menjadi tanda centang hijau saat setiap komponen dalam penyebaran selesai.

    [![Cuplikan layar portal Azure memperlihatkan detail pemberitahuan penyebaran yang menyatakan, "Penyebaran Anda sedang berlangsung."](../media/deployment-progress.png)](../media/deployment-progress-expanded.png#lightbox)

1. Setelah pesan status penyebaran berubah menjadi **Penyebaran Anda selesai**, Anda akan sadar status kotak dialog **Pemberitahuan** berubah menjadi **Penyebaran berhasil**. Pilih **Buka sumber daya** untuk masuk ke gambaran umum Layanan Aplikasi.

    [![Cuplikan layar portal Azure memperlihatkan pemberitahuan penyebaran yang menyatakan, "Penyebaran berhasil."](../media/deployment-complete.png)](../media/deployment-complete-expanded.png#lightbox)

1. Temukan **URL** di bagian **Gambaran Umum**.

    [![Cuplikan layar portal Azure memperlihatkan panel Gambaran Umum Layanan Aplikasi dengan lokasi URL disorot.](../media/website-url.png)](../media/website-url-expanded.png#lightbox)

1. Salin informasi **URL** dengan memilih ikon **Salin ke clipboard** di akhir URL.

1. Buka tab baru di browser Anda , tempel URL ini, dan tekan <kbd>Masukkan</kbd> untuk menelusuri ke situs WordPress baru Anda. Anda sekarang dapat mengkonfigurasi situs WordPress Anda, dan menambahkan konten.

    :::image type="content" source="../media/configure-wordpress.png" alt-text="Cuplikan layar memperlihatkan situs web WordPress yang telah dikonfigurasi sebelumnya menunggu pilihan bahasa / lokasi." loc-scope="third-party":::
