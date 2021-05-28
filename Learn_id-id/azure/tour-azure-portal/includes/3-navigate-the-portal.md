Dengan akun Azure, kita dapat masuk ke **portal Microsoft Azure**. Portal ini adalah situs administrasi berbasis web yang memungkinkan Anda berinteraksi dengan semua langganan serta sumber daya yang telah Anda buat. Hampir semua yang Anda lakukan dengan Azure dapat dilakukan melalui antarmuka web ini.

## <a name="azure-portal-layout"></a>Tata letak portal Microsoft Azure

Portal Azure adalah antarmuka pengguna grafis utama (GUI) untuk mengontrol Microsoft Azure. Anda dapat melakukan sebagian besar tindakan manajemen di portal, serta biasanya antarmuka terbaik untuk melakukan tugas tunggal atau di mana Anda ingin melihat opsi konfigurasi secara rinci.

![Cuplikan layar dari portal Microsoft Azure memperlihatkan bar samping kiri dan dasbor kanan.](../media/3-portal.png)

:::row:::
    :::column:::
    ![Cuplikan layar panel sumber daya serta favorit.](../media/3-favorites.png)
    :::column-end:::
    :::column span="3":::
    **Panel sumber daya**

    Di bilah sisi kiri portal adalah panel sumber daya, yang mencantumkan jenis sumber daya utama. Perhatikan bahwa Azure memiliki lebih banyak tipe sumber daya daripada yang ditampilkan. Sumber daya yang tercantum adalah bagian dari _favorit_ Anda.

    Anda dapat mengkostumisasi ini dengan jenis sumber daya tertentu yang paling sering Anda buat atau berikan.
    :::column-end:::
:::row-end:::

Sisa tampilan portal adalah untuk elemen spesifik yang sedang Anda kerjakan. Halaman default (utama) adalah **Beranda** tetapi Anda dapat mengubah tampilan default Anda menjadi **Dasbor** yang dapat disesuaikan dari **Pengaturan**. Kami akan membahas pengaturan nanti di unit ini.

## <a name="what-is-the-azure-marketplace"></a>Apa itu Marketplace Azure?

_Marketplace Azure_ sering kali menjadi tempat Anda memulai saat membuat sumber daya baru di Azure. Marketplace memungkinkan pelanggan untuk menemukan, mencoba, membeli, dan menyediakan aplikasi serta layanan dari ratusan penyedia layanan terkemuka, semuanya bersertifikat untuk dijalankan di Azure.

Katalog solusi mencakup beberapa kategori industri, termasuk namun tidak terbatas pada platform kontainer sumber terbuka, gambar komputer virtual, basis data, perangkat lunak pembuatan serta penyebaran aplikasi, alat pengembang, deteksi ancaman, dan blockchain. Menggunakan Azure Marketplace, Anda dapat menyediakan solusi end-to-end dengan cepat serta andal, yang dihosting di lingkungan Azure Anda sendiri. Pada saat penulisan, daftar ini mencakup lebih dari 8.000 daftar.

Meskipun Azure Marketplace dirancang untuk profesional TI dan pengembang cloud yang tertarik dengan perangkat lunak komersial serta TI, Mitra Microsoft juga menggunakannya sebagai titik peluncuran untuk semua aktivitas Bersama Go-To-Market.

## <a name="configuring-settings-in-the-azure-portal"></a>Mengonfigurasi pengaturan di portal Microsoft Azure

Portal Microsoft Azure menampilkan beberapa opsi konfigurasi, sebagian besar di bilah status di kanan atas layar.

Jika Anda melihat portal Microsoft Azure di layar dengan ruang horizontal yang berkurang, maka ikon berikut ini mungkin tersedia melalui menu elipsis (**...**).

### <a name="cloud-shell"></a>Cloud Shell

Jika Anda memilih ikon **Cloud Shell** (>_), Anda akan membuat sesi Azure Cloud Shell yang baru. Ingatlah bahwa Azure Cloud Shell adalah shell interaktif yang dapat diakses dengan browser untuk mengelola sumber daya Azure. Ini memberikan fleksibilitas memilih pengalaman shell yang paling sesuai dengan cara Anda bekerja. Pengguna Linux dapat memilih pengalaman Bash, sementara pengguna Windows dapat memilih PowerShell. Terminal berbasis browser ini memungkinkan Anda untuk mengontrol dan mengelola semua sumber daya Azure Anda dalam langganan saat ini melalui antarmuka baris perintah yang dibangun langsung ke dalam portal.

### <a name="directory-and-subscription"></a>Direktori dan langganan

Pilih ikon **Buku dan Filter** untuk menampilkan panel **Direktori + langganan**.

Azure memungkinkan Anda untuk memiliki lebih dari satu langganan yang terkait dengan satu direktori. Pada panel **Direktori + langganan**, Anda dapat beralih antar langganan. Di sini, Anda dapat mengubah langganan atau mengubah ke direktori lain.

![Cuplikan layar dari panel Direktori dan langganan.](../media/3-directory-pane.png)

### <a name="notifications"></a>Pemberitahuan

Memilih ikon bel yang menampilkan panel **Pemberitahuan**. Panel ini mencantumkan tindakan terakhir yang telah dilakukan, bersama dengan statusnya.

### <a name="settings"></a>Pengaturan

Pilih ikon **roda gigi** untuk mengubah pengaturan portal Microsoft Azure. Pengaturan ini meliputi:

- Penundaan keluar tidak aktif
- Tampilan default saat Anda pertama kali masuk
- Opsi flyout atau ditambatkan untuk menu portal
- Tema warna dan kontras
- Pemberitahuan roti panggang (ke perangkat seluler)
- Format bahasa dan kawasan

![Cuplikan layar dari panel pengaturan portal Microsoft Azure.](../media/3-settings-pane.png)

### <a name="help-pane"></a>Panel bantuan

Pilih ikon **tanda tanya** untuk menampilkan panel **Bantuan**. Di sini Anda memilih dari beberapa opsi, termasuk:

- Bantuan + Dukungan
- Apa yang baru
- Peta strategi Azure
- Luncurkan tur berpemandu
- Pintasan keyboard
- Tampilkan diagnostik
- Pernyataan privasi

#### <a name="help-and-support-options"></a>Opsi bantuan dan dukungan

**Bantuan + dukungan** membuka area bantuan serta dukungan utama untuk portal Microsoft Azure dan menyertakan opsi dokumentasi untuk berbagai pertanyaan umum. Salah satu area tersembunyi di sini adalah tautan **Permintaan dukungan baru**, yang ada di laman ini. Tautan ini adalah cara Anda dapat membuka tiket dukungan dengan tim Azure.

Semua pelanggan Azure dapat mengakses dukungan penagihan, kuota, serta manajemen langganan. *Ketersediaan dukungan untuk masalah lain bergantung pada paket dukungan yang Anda miliki*.

Saat Anda membuka tiket dukungan, Anda akan mengisi formulir dengan menggunakan daftar tarik turun yang disediakan dan bidang entri teks.

Setelah Anda mengisi formulir, pilih **Buat** untuk mengirimkan permintaan dukungan Anda. Tim dukungan Azure akan menghubungi Anda setelah Anda mengirimkan permintaan Anda.

Anda kemudian dapat memeriksa status dan detail permintaan dukungan Anda, dengan membuka **Bantuan** > **Bantuan + dukungan** > **Semua permintaan dukungan**.


### <a name="feedback-pane"></a>Panel umpan balik

Ikon **wajah tersenyum** membuka panel **Kirim masukan kepada kami**. Di sini Anda dapat mengirim umpan balik ke Microsoft tentang Azure. Anda dapat memutuskan sebagai bagian dari umpan balik Apakah Microsoft bisa menanggapi umpan balik Anda melalui email.

### <a name="profile-settings"></a>Pengaturan profil

Jika Anda memilih nama Anda di sudut kanan atas, menu akan terbuka dengan beberapa opsi:

- Masuk dengan akun lain, atau keluar sepenuhnya
- Melihat profil akun Anda, tempat Anda dapat mengubah kata sandi

Pilih tombol "..." di sisi kanan untuk opsi:

- Memeriksa izin Anda
- Menampilkan tagihan Anda
- Memperbarui informasi kontak Anda

Jika Anda memilih "..." lalu **Menampilkan tagihan Anda**, Azure akan membawa Anda ke laman **Azure Cost Management + Billing - Faktur**, yang membantu Anda untuk menganalisis di mana Azure menghasilkan biaya.

Azure merupakan produk besar, dan antarmuka pengguna portal Microsoft Azure (UI) mencerminkan lingkup ini. Pendekatan panel geser memungkinkan Anda menavigasi bolak-balik melalui berbagai tugas administratif dengan mudah. Mari kita bereksperimen sedikit dengan UI ini sehingga Anda mendapatkan beberapa latihan.

### <a name="azure-advisor"></a>Azure Advisor

Terakhir, Azure Advisor adalah layanan gratis yang disertakan dalam Azure yang memberikan rekomendasi tentang ketersediaan tinggi, keamanan, kinerja, keunggulan operasional, serta biaya. Advisor menganalisis layanan yang Anda terapkan serta mencari cara untuk meningkatkan lingkungan Anda di seluruh area tersebut. Anda dapat melihat rekomendasi di portal atau mengunduhnya dalam format PDF atau CSV.

Dengan Azure Advisor, Anda dapat:

- Dapatkan rekomendasi praktik terbaik yang proaktif, dapat digunakan, serta dipersonalisasi.
- Tingkatkan kinerja, keamanan, serta ketersediaan sumber daya yang tinggi saat Anda mengidentifikasi peluang untuk mengurangi biaya Azure Anda secara keseluruhan.
- Dapatkan rekomendasi dengan tindakan yang diusulkan sebaris.

Anda dapat mengakses Azure Advisor dengan memilih **Advisor** dari menu navigasi, atau mencarinya di menu **Semua layanan**.

![Dasbor Azure Advisor ditampilkan di portal Microsoft Azure yang menampilkan rekomendasi untuk Ketersediaan Tinggi, Keamanan, Kinerja, dan Biaya.](../media/3-advisordashboard.png)

Mari kita coba beberapa fitur ini!
