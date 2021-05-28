Selain tantangan yang dihadapi Tailwind Traders dengan skala aplikasi, manajer Anda meminta Anda untuk mengumpulkan tim pengembangan baru yang terdiri dari pekerja jarak jauh. 

Tugas ini biasanya memerlukan pengaturan beberapa komputer baru dengan semua alat pengembangan yang diperlukan untuk tim baru Anda. Selanjutnya, Anda harus mengirim komputer-komputer tersebut ke pengembang masing-masing di seluruh negeri. Waktu untuk mendapatkan, menyiapkan, dan mengirim tiap-tiap komputer ini akan mahal. Selain itu, semua pengembang baru Anda memiliki perangkat komputasinya sendiri yang menjalankan campuran sistem operasi Windows, Android, dan macOS. 

Anda ingin menemukan cara untuk mempercepat proses penyebaran bagi pekerja jarak jauh Anda. Anda juga ingin menjaga biaya manajemen Anda pada taraf minimal. Dengan mengingat hal itu, Anda ingin melihat bagaimana Windows Virtual Desktop dapat membantu organisasi Anda.

## <a name="what-is-windows-virtual-desktop"></a>Apa itu Windows Virtual Desktop?

Windows Virtual Desktop di Azure adalah layanan virtualisasi desktop dan aplikasi yang berjalan di cloud. Layanan ini memungkinkan pengguna Anda untuk menggunakan versi Windows yang dihosting di cloud dari lokasi mana pun. Windows Virtual Desktop berfungsi di seluruh perangkat seperti Windows, Mac, iOS, Android, dan Linux. Ini berfungsi dengan aplikasi yang dapat Anda gunakan untuk mengakses desktop dan aplikasi jarak jauh. Anda juga dapat menggunakan sebagian besar browser modern untuk mengakses pengalaman dengan hosting Windows Virtual Desktop.

Video berikut memberi Anda gambaran umum tentang Windows Virtual Desktop.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4LRpC]

## <a name="why-should-you-use-windows-virtual-desktop"></a>Mengapa Anda harus menggunakan Windows Virtual Desktop?

### <a name="provide-the-best-user-experience"></a>Memberikan pengalaman pengguna terbaik

Pengguna memiliki kebebasan untuk terhubung ke Windows Virtual Desktop dengan perangkat apa pun melalui internet. Mereka menggunakan klien Windows Virtual Desktop untuk menyambungkan ke desktop dan aplikasi Windows yang telah dipublikasikan. Klien ini bisa berupa aplikasi asli pada perangkat atau klien web Windows Virtual Desktop HTML5.

Anda dapat memastikan bahwa komputer virtual host sesi (VM) Anda berjalan di dekat aplikasi dan layanan yang terhubung ke pusat data atau cloud Anda. Dengan cara ini pengguna Anda tetap produktif dan tidak mengalami waktu muat yang lama.

Pengguna masuk ke Windows Virtual Desktop dengan cepat karena profil pengguna ditampung menggunakan FSLogix. Saat masuk, kontainer profil pengguna secara dinamis melekat pada lingkungan komputasi. Profil pengguna segera tersedia dan muncul di sistem persis seperti profil pengguna asli.

Anda bisa memberikan kepemilikan individual melalui desktop pribadi (persisten). Misalnya, Anda mungkin ingin menyediakan desktop jarak jauh pribadi bagi anggota tim teknik. Selanjutnya mereka dapat menambahkan atau menghapus program tanpa berdampak pada pengguna lain di desktop jarak jauh itu.

### <a name="enhance-security"></a>Memperkuat keamanan

Windows Virtual Desktop menyediakan manajemen keamanan terpusat untuk desktop pengguna dengan Azure Active Directory (Azure AD). Anda bisa mengaktifkan autentikasi multifaktor untuk mengamankan masuk pengguna. Anda juga dapat mengamankan akses ke data dengan menetapkan kontrol akses berbasis peran granular (RBAC) kepada pengguna.

Dengan Windows Virtual Desktop, data dan aplikasi dipisahkan dari perangkat keras lokal. Windows Virtual Desktop menjalankannya dan bukan pada server jarak jauh. Risiko data rahasia yang ditinggalkan pada perangkat pribadi juga berkurang.

Sesi pengguna diisolasi di lingkungan satu sesi dan multi-sesi.

Windows Virtual Desktop juga meningkatkan keamanan dengan menggunakan teknologi reverse connect. Jenis koneksi ini lebih aman daripada Protokol Desktop Jarak Jauh. Kami tidak membuka port masuk untuk VM host sesi.

## <a name="what-are-some-key-features-of-windows-virtual-desktop"></a>Apa saja fitur utama Windows Virtual Desktop?

### <a name="simplified-management"></a>Manajemen yang semakin disederhanakan

Windows Virtual Desktop adalah layanan Azure, sehingga tidak asing bagi administrator Azure. Anda menggunakan Azure AD dan RBAC untuk mengelola akses ke sumber daya. Dengan Azure, Anda juga mendapatkan alat untuk mengotomatiskan penyebaran VM, mengelola pembaruan VM, dan memberikan pemulihan bencana. Seperti halnya layanan Azure lainnya, Windows Virtual Desktop menggunakan Azure Monitor untuk pemantauan dan peringatan. Standardisasi ini memungkinkan admin mengidentifikasi masalah melalui satu antarmuka.

### <a name="performance-management"></a>Manajemen performa

Windows Virtual Desktop memberi Anda opsi untuk memuat keseimbangan pengguna pada kumpulan host VM Anda. *Kumpulan host* adalah kumpulan VM dengan konfigurasi yang sama seperti yang ditetapkan untuk beberapa pengguna. Untuk performa terbaik, Anda dapat mengonfigurasi penyeimbangan beban agar terjadi saat pengguna masuk (mode luas). Dengan mode luas, pengguna secara berurutan dialokasikan di seluruh kumpulan host untuk beban kerja Anda. Untuk menghemat biaya, Anda dapat mengonfigurasi VM untuk penyeimbangan beban mode kedalaman, yang mana pengguna sepenuhnya dialokasikan pada satu VM sebelum pindah ke VM berikutnya. Windows Virtual Desktop menyediakan alat untuk menyediakan VM tambahan secara otomatis ketika permintaan masuk melebihi ambang batas yang telah ditentukan.

### <a name="multi-session-windows-10-deployment"></a>Penyebaran Windows 10 multi-sesi

Windows Virtual Desktop memungkinkan Anda menggunakan multi-sesi Windows 10 Enterprise, satu-satunya sistem operasi berbasis klien Windows yang memungkinkan beberapa pengguna bersamaan dalam satu VM. Windows Virtual Desktop juga memberikan pengalaman yang lebih konsisten dengan dukungan aplikasi yang lebih luas jika dibandingkan dengan sistem operasi berbasis Windows Server.

## <a name="how-can-you-reduce-costs-with-windows-virtual-desktop"></a>Bagaimana Anda dapat mengurangi biaya dengan Windows Virtual Desktop?

### <a name="bring-your-own-licenses"></a>Membawa lisensi Anda sendiri

Windows Virtual Desktop tersedia untuk Anda tanpa biaya tambahan jika Anda memiliki lisensi Microsoft 365 yang telah memenuhi syarat. Cukup bayar untuk sumber daya Azure yang digunakan oleh Windows Virtual Desktop.

- Bawa lisensi Windows atau Microsoft 365 yang memenuhi syarat untuk mendapatkan desktop dan aplikasi Windows 10 Enterprise dan Windows 7 Enterprise tanpa biaya tambahan.
- Jika Anda adalah pelanggan Lisensi Akses Klien Microsoft Remote Desktop Services yang memenuhi syarat, desktop dan aplikasi Windows Server Remote Desktop Services tersedia tanpa biaya tambahan.

### <a name="save-on-compute-costs"></a>Hemat biaya komputasi

Beli Instans Komputer Virtual Azure Reserved satu tahun atau tiga tahun untuk menghemat hingga 72 persen dibandingkan harga bayar sesuai penggunaan. Anda dapat membayar reservasi di muka atau bulanan. Reservasi menyediakan diskon tagihan dan tidak memengaruhi status runtime sumber daya Anda.

