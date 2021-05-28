Azure mendukung banyak skenario autentikasi dan otorisasi, termasuk dukungan untuk berbagai penyedia identitas. Namun, untuk penyebaran SAP ada 3 relevansi utama:

* **Active Directory Domain Services (AD DS)**

* **Azure Active Directory (Azure AD)**

* **Azure Active Directory Domain Services (Azure AD DS)**

## <a name="active-directory-domain-services-ad-ds"></a>Active Directory Domain Services (AD DS)
AD DS menawarkan berbagai manfaat bisnis dan teknologi. Ini berfungsi sebagai solusi manajemen identitas dan akses untuk lingkungan yang dikelola secara independen dan terisolasi. 

Mekanisme autentikasi AD DS sebagian besar bergantung pada komputer anggota domain yang bergabung secara permanen ke domain. Komunikasi dengan pengontrol domain melibatkan protokol seperti:

- Protokol Akses Direktori Ringan (LDAP) untuk pencarian layanan direktori
- Kerberos untuk autentikasi
- Blok Pesan Server (SMB) untuk interaksi berbasis Kebijakan Grup dengan pengontrol domain AD DS

Protokol ini tidak cocok untuk lingkungan internet. 

Jika Ingin menyediakan fungsionalitas yang setara di Azure, Anda dapat menyebarkan pengontrol domain AD DS sebagai Azure VM. Beberapa alasan yang lebih umum untuk menempatkan pengontrol domain di Azure meliputi:

* Memberikan autentikasi ke aplikasi dan layanan yang bergantung pada AD DS dalam lingkungan Azure.

* Memperluas cakupan AD DS lokal ke satu atau beberapa wilayah Azure, untuk pemulihan bencana.

* Menerapkan lebih banyak pengontrol domain AD DS di Azure untuk meningkatkan ketahanan sinkronisasi direktori dengan penyebaran Azure AD dan gabungan Azure AD.

Ada 3 skenario utama yang melibatkan AD DS dan Azure VM:

* **AD DS disebarkan ke Azure VM tanpa konektivitas lintas lokasi**. Penyebaran ini menghasilkan pembuatan area baru, dengan semua pengontrol domain berada di Azure. Gunakan pendekatan ini jika Anda berencana untuk menghosting beban kerja resident Azure di Azure VM, yang bergantung pada autentikasi Kerberos atau Kebijakan Grup tetapi tidak memiliki dependensi lokal.

* **Penyebaran AD DS lokal yang ada dengan konektivitas lintas lokasi ke jaringan virtual Azure, tempat Azure VM berada**. Skenario ini menggunakan lingkungan Active Directory lokal yang ada untuk menyediakan autentikasi untuk beban kerja resident Azure VM. Saat mempertimbangkan desain ini, Anda harus mempertimbangkan latensi yang terkait dengan lalu lintas jaringan lintas tempat.

* **Penyebaran AD DS lokal yang ada dengan konektivitas lintas lokasi ke jaringan virtual Azure, menghosting lebih banyak pengontrol domain di Azure VM**. Tujuan utama dari skenario ini adalah mengoptimalkan performa beban kerja dengan melokalkan lalu lintas autentikasi. 

Saat merencanakan penerapan pengontrol domain AD DS ke Azure VM, Anda harus mempertimbangkan hal berikut:

* **Konektivitas lintas tempat**. Jika Anda ingin memperluas lingkungan AD DS yang ada ke Azure, konektivitas antara lingkungan lokal Anda dan jaringan virtual Azure adalah elemen rancangan utama. Ini diperlukan untuk menyiapkan jaringan privat virtual (VPN) situs ke situs atau Microsoft Azure ExpressRoute. 

* **Topologi Active Directory**. Dalam skenario lintas lokasi, Anda harus mengonfigurasi situs AD DS untuk mencerminkan infrastruktur jaringan lintas lokasi Anda. Topologi ini akan memungkinkan Anda untuk melokalkan lalu lintas autentikasi dan mengontrol lalu lintas replikasi antara pengontrol domain berbasis lokal dan Azure VM. Replikasi intrasitus menjalankan bandwidth tinggi dan koneksi yang tersedia secara permanen. Sebaliknya, replikasi antarsitus memungkinkan penjadwalan dan pembatasan lalu lintas replikasi. Selain itu, rancangan situs yang tepat memastikan bahwa pengontrol domain dalam permintaan autentikasi penanganan situs tertentu yang berasal dari situs tersebut. 

* **Pengontrol domain baca-saja (RODC)**. Beberapa pelanggan berhati-hati tentang penyebaran pengontrol domain yang dapat ditulis ke Azure VM karena masalah keamanan. Salah satu cara untuk menanggulangi masalah ini adalah menggunakan RODC sebagai gantinya. RODC dan pengontrol domain yang dapat ditulis memberikan pengalaman pengguna yang serupa. Namun, RODC menurunkan volume lalu lintas keluar dan biaya yang sesuai. Pendekatan ini adalah pilihan yang baik jika beban kerja resident Azure tidak memerlukan akses tulis yang sering ke AD DS. 

* **Penempatan katalog global**. Apa pun topologi domain Anda, Anda harus mengonfigurasi semua pengontrol domain berbasis Azure VM Sebagai server katalog global. Pengaturan ini mencegah pencarian katalog global melintasi tautan jaringan lintas tempat yang akan berdampak negatif pada performa.

## <a name="integrating-linux-with-ad-ds"></a>Mengintegrasikan Linux dengan AD DS

Ada beberapa cara untuk mengintegrasikan VM Linux dengan Active Directory. Ada 3 opsi utama berdasarkan komponen bawaan atau tersedia secara bebas:

* **Autentikasi / Otorisasi LDAP**

* **Autentikasi Kerberos 5 / Otorisasi LDAP**

* **Autentikasi / Otorisasi Winbind**

Autentikasi dan Otorisasi LDAP menggunakan kepatuhan Autentikasi dengan standar LDAP. Aplikasi yang mengimplementasikan NSS (Name Service Switch) dan PAM (Pluggable Authentication Module), dapat menggunakan modul LDAP untuk berkomunikasi dengan titik akhir LDAP dari Active Directory. Dengan Autentikasi LDAP, pengguna tidak dapat mengubah kata sandi mereka dari klien Linux. Anda harus menerapkan proses perubahan kata sandi yang sesuai dengan kebijakan kedaluwarsa kata sandi Anda. Anda dapat melakukan ini baik dengan memberikan pengguna metode alternatif untuk mengubah kata sandi mereka, atau dengan memiliki mekanisme penyegaran kata sandi otomatis.

Dengan Autentikasi Kerberos, NSS tetap menggunakan LDAP dan berfungsi sama seperti dengan Autentikasi LDAP. Namun, PAM menggunakan modul pam_krb5 untuk mengautentikasi terhadap Kerberos Key Distribution Center (KDC) yang diterapkan di Active Directory. Konfigurasi ini populer karena bekerja dengan komponen tidak biasa dengan cara yang aman, dan menyediakan kemampuan perubahan kata sandi.

Winbind adalah solusi yang lebih kompleks, membutuhkan daemon Winbind untuk dijalankan pada sistem Linux. Winbind menyediakan kemampuan teknis yang lebih canggih, seperti dukungan untuk RPC dan NTLM. Ini tidak memerlukan komponen tertentu (seperti Services for UNIX) untuk dipasang pada autentikasi pengontrol domain AD DS. Winbind adalah bagian dari set interoperabilitas Samba yang juga menyediakan kemampuan berbagi file menggunakan protokol SMB. Jika Anda berencana menggunakan SMB, menggunakan Winbind adalah pilihan yang logis.

## <a name="azure-active-directory-azure-ad"></a>Azure Active Directory (Azure AD)
Azure AD adalah solusi manajemen akses, berbasis cloud, identitas, dan akses yang dikelola Microsoft. Azure AD menyediakan akses aman kepada organisasi dan individu ke berbagai layanan cloud-resident, termasuk Azure, Microsoft 365, Microsoft Dynamics CRM Online, dan Microsoft Intune. Ini juga dapat digunakan untuk memberikan autentikasi bebas hambatan ke aplikasi lokal. 

Azure AD menawarkan multipenyewaan dan skalabilitas:

* **Multipenyewaan**. Azure AD multipenyewa berdasarkan desain, memastikan isolasi antara instans direktori individualnya. Istilah *penyewa* dalam konteks ini biasanya mewakili individu, perusahaan, atau organisasi yang mendaftar untuk berlangganan layanan berbasis cloud Microsoft. Misalnya, ini dapat berupa Microsoft 365, Windows Intune, atau Microsoft Azure, yang masing-masing menggunakan Azure AD. Namun, dari sudut pandang teknis, istilah penyewa merepresentasikan instans Azure AD individual. Sebagai pelanggan Azure, Anda dapat membuat beberapa penyewa Azure AD. Membuat beberapa penyewa Azure AD berguna jika Anda ingin menguji fungsionalitas Azure AD dalam satu tanpa mempengaruhi yang lain. Setiap penyewa Azure AD berfungsi sebagai batas keamanan, dan sebagai kontainer untuk objek Azure AD seperti pengguna, grup, dan aplikasi.

* **Skalabilitas**. Azure AD adalah direktori multipenyewa terbesar di dunia. Ini menghosting lebih dari satu juta instans layanan direktori, dengan miliaran permintaan autentikasi per minggu.

Layanan bisnis Microsoft Online, seperti Microsoft 365 atau Microsoft Azure, memerlukan Azure AD untuk masuk dan membantu perlindungan identitas. Jika Anda berlangganan layanan bisnis Microsoft Online apa pun, Anda secara otomatis mendapatkan Azure AD dengan akses ke semua fitur gratis.

Untuk meningkatkan implementasi Azure AD, Anda juga dapat menambahkan kemampuan berbayar dengan meningkatkan ke lisensi Azure Active Directory Basic, Premium P1, atau Premium P2. Lisensi berbayar Azure AD dibangun di luar direktori gratis yang ada. Lisensi ini menyediakan layanan mandiri, pemantauan yang ditingkatkan, pelaporan keamanan, dan akses aman untuk pengguna seluler Anda.

* **Azure Active Directory Gratis**. Menyediakan manajemen pengguna dan grup, sinkronisasi direktori lokal, laporan dasar, dan SSO di Azure, Microsoft 365, dan banyak aplikasi SaaS populer.

* **Azure Active Directory Basic**. Selain fitur Gratis, Basic juga menyediakan akses aplikasi yang berpusat pada cloud, manajemen akses berbasis grup, reset kata sandi layanan mandiri untuk aplikasi cloud, dan Azure AD Application Proxy. Ini memungkinkan Anda menerbitkan aplikasi web lokal menggunakan Azure AD.

* **Azure Active Directory Premium P1**. Selain fitur Gratis dan Dasar, P1 juga memungkinkan pengguna hibrid Anda mengakses sumber daya lokal dan cloud. Ini juga mendukung administrasi lanjutan, seperti:

    * Grup dinamis.
    
    * Pengelolaan grup layanan mandiri.
    
    * Microsoft Identity Manager (rangkaian manajemen identitas dan akses lokal).
    
    * Kemampuan penulisan kembali cloud (yang memungkinkan reset kata sandi layanan mandiri untuk pengguna lokal Anda).

* **Azure Active Directory Premium P2**. Selain fitur Gratis, Dasar, dan P1, P2 juga menawarkan:

    * Perlindungan Azure Active Directory Identity Protection untuk membantu menyediakan Akses Bersyarat berbasis risiko ke aplikasi dan data perusahaan penting Anda.
    
    * Privileged Identity Management (PIM) untuk membantu menemukan, membatasi, dan memantau administrator dan akses mereka ke sumber daya, dan untuk menyediakan akses tepat waktu saat diperlukan.

Setiap langganan Azure terhubung dengan satu, dan hanya satu, penyewa Azure AD. Selain memberikan autentikasi, keterkaitan ini juga mempermudah otorisasi. Ini memungkinkan Anda untuk memberikan izin ke sumber daya di langganan Azure kepada pengguna, grup, dan prinsip layanan yang ada di penyewa Azure AD tertentu, melalui Kontrol Akses Berbasis Peran. Anda dapat mengaitkan penyewa Azure AD yang sama dengan beberapa langganan Azure. Anda kemudian dapat menggunakan pengguna, grup, dan prinsip layanan yang sama untuk mengakses dan mengelola sumber daya di beberapa langganan Azure.

Banyak aplikasi yang dibangun pada platform yang berbeda seperti .NET, Java, Node.js, dan PHP dapat menggunakan protokol standar industri untuk berintegrasi dengan manajemen identitas yang disediakan Azure AD. Protokol ini termasuk Security Assertion Markup Language (SAML) 2.0, Web Services Federation (WS-Federation), dan OpenID Connect. Dengan dukungan Open Authorization (OAuth 2.0), developer dapat mengembangkan aplikasi layanan seluler dan web yang menggunakan Azure AD untuk autentikasi cloud dan manajemen akses. Mereka juga dapat memanfaatkan dukungan untuk Azure AD di beberapa layanan PaaS, seperti aplikasi Azure Web atau Azure SQL Database. 

Azure AD tersedia dalam 3 edisi: Gratis, Dasar, dan Premium (P1 dan P2). 

Organisasi yang menggunakan AD DS dapat menyinkronkan pengguna dan grup dari domain Direktori Aktif mereka dengan Azure AD. Ini memungkinkan mereka untuk mengaktifkan pengalaman SSO bagi pengguna mereka ketika mereka mengakses aplikasi lokal dan berbasis cloud.



## <a name="azure-active-directory-domain-services-azure-ad-ds"></a>Azure Active Directory Domain Services (Azure AD DS)
Bagaimana jika Anda perlu menerapkan beban kerja yang bergantung pada AD DS di Azure, tetapi Anda ingin meminimalkan overhead yang terkait dengan penyebaran dan pengelolaan pengontrol domain Active Directory yang dihosting di Azure VMs? Anda harus mempertimbangkan untuk menerapkan Azure AD DS. Azure AD DS adalah layanan AD DS yang dikelola Microsoft. Ini menyediakan fitur Direktori Aktif standar seperti Kebijakan Grup, bergabung dengan domain, dan juga dukungan untuk protokol seperti Kerberos, NTLM, dan LDAP. 

Layanan ini terdiri dari dua pengontrol domain Active Directory di hutan domain tunggal yang baru. Saat Anda menyediakan layanan, platform Azure secara otomatis menerapkan kedua pengontrol domain ini ke jaringan virtual Azure yang Anda pilih. Selain itu, AD DS yang dikelola secara otomatis menyinkronkan pengguna dan grupnya dari penyewa Azure AD yang terkait dengan langganan Azure yang menghosting jaringan virtual. Secara efektif, domain Azure AD DS akan berisi pengguna dan grup yang sama dengan mitra Azure AD-nya. Ini menyediakan kapabilitas berikut:

* Anda dapat bergabung dengan Azure VM ke domain AD DS terkelola jika mereka berada di jaringan virtual yang sama atau jaringan virtual lain yang terhubung ke domain tersebut.

* Pengguna Azure AD bisa menggunakan kredensial mereka yang sudah ada untuk masuk ke Azure VM ini.

Jika Anda memiliki domain AD DS lokal yang disinkronkan dengan penyewa Azure AD yang sama, pengguna AD DS lokal Anda bisa masuk ke domain Azure AD DS dengan kredensial yang sudah ada. 

Namun, dalam skenario ini domain Active Directory lokal terpisah dari domain Active Directory yang diterapkan Azure AD DS. Dua domain Active Directory memiliki nama domain yang berbeda dan sekumpulan objek pengguna, grup, dan komputer yang terpisah. Namun, objek pengguna dan grup dalam lingkup sinkronisasi Azure AD Connect memiliki atribut yang cocok.

Azure AD DS menawarkan dukungan untuk set protokol yang sama dengan AD DS lokal. Dengan Azure AD DS, Anda dapat memigrasikan aplikasi yang bergantung pada AD DS ke Azure VM. Anda tidak perlu menyebarkan dan memelihara pengontrol domain tambahan atau membangun konektivitas dengan infrastruktur lokal. 

Ada beberapa perbedaan penting antara AD DS dan Azure AD DS. Misalnya, Azure AD DS tidak memungkinkan Anda membuat hubungan kepercayaan atau memperluas skema. Bergantung pada asal, pengguna dan objek grup mungkin harus dikelola di tempat atau di penyewa Azure AD terkait. Dukungan untuk Kebijakan Grup dibatasi, dengan hanya dua Objek Kebijakan Grup yang dibuat sebelumnya—satu berisi pengaturan komputer dan objek lain yang berisi pengaturan pengguna. Selain itu, meskipun Anda dapat melakukan ikatan LDAP dan baca LDAP terhadap Azure AD DS, tidak ada dukungan untuk penulisan LDAP.