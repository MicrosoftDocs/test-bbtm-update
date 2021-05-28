Mari kita lihat cara membuat dan memodifikasi dasbor menggunakan portal Microsoft Azure, serta dengan mengedit file JSON yang mendasarinya secara langsung. Di unit ini, Anda akan belajar menavigasi di sekitar portal. Dan di unit berikutnya, Anda akan mencoba hal-hal yang telah Anda pelajari.

## <a name="what-is-a-dashboard"></a>Apa itu dasbor?

_Dasbor_ adalah kumpulan ubin antarmuka pengguna yang dapat disesuaikan yang ditampilkan di portal Microsoft Azure. Anda menambahkan, menghapus, dan memosisikan ubin untuk membuat tampilan persis yang Anda inginkan, lalu menyimpan tampilan itu sebagai dasbor. Beberapa dasbor didukung, serta Anda dapat beralih di antara dasbor sesuai kebutuhan. Anda bahkan dapat berbagi dasbor dengan anggota tim lain.

Dasbor memberi Anda fleksibilitas yang cukup besar mengenai cara Anda mengelola Azure. Misalnya, Anda dapat membuat dasbor untuk peran tertentu dalam organisasi, lalu menggunakan kontrol akses berbasis peran (RBAC) untuk mengontrol siapa yang dapat mengakses dasbor tersebut. Oleh karena itu, administrator database Anda akan memiliki dasbor yang berisi tampilan layanan database SQL, sedangkan administrator Azure Active Directory Anda akan memiliki tampilan pengguna serta grup dalam Azure AD. Anda bahkan dapat mengkostumisasi portal antara lingkungan produksi dan pengembangan Anda di dalam portal - membuat dasbor khusus untuk setiap lingkungan yang Anda kelola.

Dasbor disimpan sebagai file JavaScript Object Notation (JSON). Format ini berarti mereka dapat diunggah serta diunduh ke komputer lain, atau dibagikan dengan anggota direktori Azure. Azure menyimpan dasbor dalam grup sumber daya, sama seperti komputer virtual atau akun penyimpanan yang dapat Anda kelola di dalam portal.

Karena dasbor adalah file JSON, Anda juga dapat [menyesuaikannya secara terprogram](https://docs.microsoft.com/azure/azure-portal/azure-portal-dashboards-create-programmatically), menjadikannya alat administratif yang menarik. Selain itu, beberapa tipe ubin bisa berbasis kueri, sehingga diperbarui secara otomatis saat data sumber berubah.

## <a name="explore-the-default-dashboard"></a>Menjelajahi dasbor default

Dasbor default diberi nama "Dasbor". Saat Anda masuk ke portal untuk pertama kali dan memilih **Dasbor** dari menu portal, Anda disajikan dengan dasbor ini yang berisi lima ubin.

![Cuplikan layar memperlihatkan dasbor default dengan bagian berbeda bernomor serta disorot.](../media/6-dashboard-default-webparts.png)

Komponen web default ini

1. Kontrol dasbor

1. Semua ubin sumber daya

1. Mulai cepat + ubin tutorial

1. Ubin Azure Service Health

1. Ubin Marketplace Microsoft Azure

## <a name="creating-and-managing-dashboards"></a>Membuat dan mengelola dasbor

Di bagian atas dasbor ada kontrol yang memungkinkan Anda membuat, mengunggah, mengunduh, mengedit, serta berbagi dasbor. Anda juga dapat mengalihkan dasbor ke layar penuh, mengkloningnya, atau menghapusnya.

![Cuplikan layar yang memperlihatkan kontrol Kustomisasi dasbor.](../media/6-customise-dashboard-controls.png)

## <a name="select-dashboard"></a>Pilih dasbor

Di ujung kiri toolbar adalah kontrol tarik-turun **Pilih Dasbor**. Mengeklik kontrol ini memungkinkan Anda memilih dari dasbor yang telah Anda tentukan untuk akun Anda. Kontrol ini memudahkan Anda menentukan beberapa dasbor untuk tujuan yang berbeda dan kemudian beralih dari satu ke yang lain serta kembali lagi, tergantung pada apa yang anda coba lakukan pada saat itu.

Dasbor yang Anda buat awalnya akan bersifat pribadi; Artinya, hanya Anda yang bisa melihat mereka. Untuk membuat dasbor tersedia di seluruh perusahaan Anda, Anda perlu membagikannya. Kita akan melihat opsi itu segera.

## <a name="create-a-new-dashboard"></a>Buat dasbor baru

Untuk membuat dasbor baru, klik **Dasbor baru**. Ruang kerja dasbor muncul, tanpa ubin yang ada. Anda kemudian dapat menambah, menghapus, dan menyesuaikan ubin sesuka Anda. Setelah Anda selesai menyesuaikan dasbor, klik **Selesai menyesuaikan** untuk menyimpan dan beralih ke dasbor tersebut.

## <a name="upload-and-download"></a>Unggah dan Unduh

Tombol **Unggah** dan **Unduh** memungkinkan Anda mengunduh dasbor Anda saat ini sebagai file JSON, mengkostumisasinya, lalu mendistribusikan serta mengunggahnya atau meminta orang lain mengunggah file itu kembali ke portal Microsoft Azure, sehingga menggantikan dasbor mereka saat ini.

Jika Anda mengeklik **Unduh**, dasbor saat ini mengunduh kode JSON sebagai file yang dapat Anda edit secara lokal. Anda kemudian dapat mengunggahnya kembali ke Azure dengan mengeklik tombol **Unggah**. Mengunduh dan mengunggah dasbor dibahas lebih lanjut di bawah ini.

## <a name="edit-a-dashboard-using-the-portal"></a>Mengedit dasbor menggunakan portal

Meskipun Anda dapat mengedit dasbor dengan mengunduh file JSON, mengubah nilai dalam file, serta mengunggah file kembali ke Azure, Anda mungkin lebih suka pendekatan grafis untuk merancang antarmuka pengguna. Untuk menggunakan GUI untuk mengonfigurasi dasbor Anda saat ini, Anda dapat beralih ke mode pengeditan dalam beberapa cara:

* Klik tombol **Edit** (ikon pensil).
* Klik kanan di area latar belakang dasbor dan pilih **Edit**.
* Klik kanan pada ubin dan menu akan muncul dengan opsi edit.
* Arahkan kursor ke ubin di dasbor - menu `...` akan muncul di pojok kanan/atas dengan opsi **Kustomisasi**.

Dasbor akan beralih ke mode edit.

![Cuplikan layar memperlihatkan dasbor dalam mode Edit.](../media/6-edit-dashboard.png)

Di sisi kiri muncul **Galeri Ubin**, dengan beberapa ubin yang memungkinkan. Anda bisa memfilter Galeri Ubin menurut kategori dan tipe sumber daya.

Menambahkan ubin semudah memilih ubin dari daftar di sebelah kiri lalu menyeretnya ke area kerja. Anda kemudian dapat memindahkan setiap ubin tentang, mengubah ukurannya, atau mengubah data yang ditampilkannya.

> [!TIP]
> Salah satu fitur keren adalah Anda dapat mengambil elemen pada panel turunan dan meletakkannya di dasbor Anda. Arahkan kursor ke item dan cari ubin `...` menu edit - ini akan memiliki opsi "Sematkan ke Dasbor" yang memungkinkan Anda dengan cepat mengambil ubin dari layanan serta meletakkannya ke dasbor.

Area kerja dalam mode edit dibagi menjadi kotak. Setiap ubin harus menempati setidaknya satu persegi, serta ubin akan diposisikan ke kumpulan pembagi ubin terbesar terdekat. Ubin yang tumpang tindih dipindahkan dari jalan. Ketika Anda membuat ubin lebih kecil, ubin di sekitarnya akan bergerak kembali ke atas melawannya.

### <a name="change-tile-sizes"></a>Mengubah ukuran ubin

Beberapa ubin memiliki ukuran yang ditetapkan, serta Anda dapat mengedit ukurannya hanya secara terprogram. Namun, Anda dapat mengedit ubin dengan sudut kanan bawah abu-abu dengan menyeret indikator sudut.

![Cuplikan layar ubin dengan indikator sudut disorot.](../media/6-resizable-tile.png)

Atau, klik kanan ke menu kontekstual serta tentukan ukuran yang Anda inginkan.

![Cuplikan layar ubin dengan menu konteks menampilkan opsi ukuran yang berbeda.](../media/6-tile-size.png)

Untuk membuat dasbor Anda, tarik ubin dari Galeri Ubin ke ruang kerja lalu susun ulang.

### <a name="change-tile-settings"></a>Ubah pengaturan ubin

Beberapa ubin memiliki pengaturan yang bisa diedit. Misalnya, dengan ubin jam, saat Anda menyeretnya ke ruang kerja, ia akan membuka ubin **Edit jam**. Anda kemudian dapat mengatur zona waktu, yang ditampilkannya, serta juga mengatur apakah ditampilkan dalam format 12 atau 24 jam.

![Cuplikan layar memperlihatkan ubin Edit jam untuk jam.](../media/6-edit-clock.png)

Untuk perusahaan multi-nasional atau lintas benua, Anda dapat menambahkan beberapa jam, masing-masing di zona waktu yang berbeda.

### <a name="accepting-your-edits"></a>Menerima hasil editan Anda

Bila Anda telah mengatur ubin sesuai keinginan Anda, klik **Selesai menyesuaikan** atau klik kanan lalu klik **Selesai menyesuaikan**.

## <a name="edit-a-dashboard-by-changing-the-json-file"></a>Mengedit dasbor dengan mengubah file JSON

Anda juga dapat mengedit dasbor dengan mengubah file JSON. Pendekatan ini menyediakan lebih banyak opsi untuk mengubah pengaturan, tetapi Anda tidak dapat melihat perubahan hingga Anda mengunggah file kembali ke Azure. Titik awal termudah adalah mengunduh dasbor JSON seperti yang dijelaskan sebelumnya serta mengedit file itu.

![Cuplikan layar file JSON dasbor yang diunduh.](../media/6-json-code.png)

Sebagai contoh, di JSON yang ditunjukkan di atas, untuk mengubah ukuran ubin, Anda akan mengedit variabel **colSpan** dan **rowSpan**, lalu simpan file serta unggah kembali ke Azure.

> [!Tip]
> Anda juga dapat mendistribusikan file JSON dasbor ke pengguna lain.

## <a name="reset-a-dashboard"></a>Menyetel ulang dasbor

Anda dapat menyetel ulang dasbor apa pun ke gaya default. Dalam mode edit, klik kanan latar belakang dasbor dan pilih **Setel ulang ke kondisi default**. Kotak dialog akan meminta Anda mengonfirmasi bahwa Anda ingin menyetel ulang dasbor tersebut.

## <a name="share-or-unshare-a-dashboard"></a>Berbagi atau membatalkan berbagi dasbor

Saat Anda menentukan dasbor baru, dasbor bersifat pribadi serta hanya dapat dilihat oleh akun Anda. Untuk membuatnya terlihat oleh orang lain, Anda perlu berbagi dasbor. Namun, seperti halnya sumber daya Azure lainnya, Anda perlu menentukan grup sumber daya baru (atau menggunakan grup sumber daya yang ada) untuk menyimpan dasbor bersama. Jika Anda tidak memiliki grup sumber daya yang ada, Azure akan membuat grup sumber daya *dasbor* di lokasi mana pun yang Anda tentukan. Jika Anda memiliki grup sumber daya yang sudah ada, Anda dapat menentukan grup sumber daya tersebut untuk menyimpan dasbor.

![Tangkapan layar dari Berbagi dan panel kontrol akses sebelum dasbor dibagikan.](../media/6-share-dashboards-default.png)

Saat Anda telah membagikan template, Anda akan melihat panel **Berbagi + kontrol akses** kedua.

![Cuplikan layar dari panel Berbagi dan kontrol akses setelah dasbor dibagikan.](../media/6-share-dashboards-access-control.png)

Anda kemudian dapat mengeklik **Kelola pengguna** untuk menentukan pengguna yang memiliki akses ke dasbor itu.

### <a name="switching-to-a-shared-dashboard"></a>Beralih ke dasbor bersama

Untuk beralih ke dasbor bersama, Anda mengeklik daftar dasbor, lalu klik **Jelajahi semua dasbor**.

![Cuplikan layar memperlihatkan daftar dasbor bersama dengan tautan Telusuri semua dasbor disorot.](../media/6-browse-dashboards.png)

Anda sekarang akan melihat panel **Semua dasbor**, dengan nama dari setiap dasbor bersama yang ditampilkan. Cukup klik pada dasbor untuk menerapkannya ke portal Microsoft Azure.

![Cuplikan layar yang memperlihatkan dasbor Bersama di panel Semua dasbor.](../media/6-select-shared-dashboard.png)

## <a name="display-a-dashboard-as-a-full-screen"></a>Menampilkan dasbor sebagai layar penuh

Jika Anda menginginkan dasbor real estat terbesar, klik tombol **Layar penuh** untuk menampilkan dasbor Anda saat ini tanpa menu peramban. Jika Anda memiliki ubin di luar batas tampilan layar Anda, bilah penggeser akan muncul di kanan dan bawah layar Anda.

Setelah Anda selesai bekerja dalam mode layar penuh, tekan tombol ESC atau klik **Keluar dari Layar Penuh** di sebelah nama Dasbor di bagian atas layar.

## <a name="clone-a-dashboard"></a>Mengkloning dasbor

Mengkloning dasbor membuat salinan instan yang disebut "Klon \<dashboard name>" dan beralih ke salinan itu sebagai dasbor saat ini. Kloning juga merupakan cara mudah untuk membuat dasbor sebelum membagikannya. Misalnya, jika Anda memiliki dasbor yang hampir seperti yang Anda inginkan, kloning, buat perubahan yang Anda butuhkan, lalu bagikan.

## <a name="delete-a-dashboard"></a>Menghapus dasbor

Menghapus dasbor akan menghapusnya dari daftar dasbor yang tersedia. Anda diminta untuk mengonfirmasi bahwa Anda ingin menghapus dasbor, tetapi tidak ada fasilitas untuk memulihkan dasbor yang telah dihapus.

Mari kita coba beberapa opsi ini dengan membuat dasbor baru.
