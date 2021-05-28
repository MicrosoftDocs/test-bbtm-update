VPN menggunakan terowongan terenkripsi dalam jaringan lain. Terowongan ini biasanya disebarkan untuk menghubungkan dua atau lebih jaringan pribadi tepercaya satu sama lain melalui jaringan yang tidak tepercaya (biasanya internet publik). Lalu lintas akan dienkripsi saat bergerak melintasi jaringan tidak tepercaya guna mencegah pengintaian atau serangan lainnya.

Untuk skenario Tailwind Traders, VPN dapat memungkinkan kantor cabang untuk berbagi informasi sensitif antar lokasi. Misalnya, kantor Anda di wilayah Pantai Timur Amerika Utara perlu mengakses data pelanggan pribadi perusahaan yang disimpan di server yang secara fisik terletak di wilayah Pantai Barat. VPN yang menghubungkan kantor Pantai Timur ke server Pantai Barat memungkinkan perusahaan Anda untuk mengakses data pelanggan pribadi dengan aman.

## <a name="vpn-gateways"></a>Gateway VPN

Gateway VPN adalah tipe gateway jaringan virtual. Instans Azure VPN Gateway disebarkan di instans Azure Virtual Network dan mengaktifkan konektivitas berikut:

- Sambungkan pusat data lokal ke jaringan virtual melalui koneksi *situs ke situs*.
- Sambungkan perangkat individual ke jaringan virtual melalui koneksi *titik-ke-situs*.
- Sambungkan jaringan virtual ke jaringan virtual lainnya melalui koneksi *jaringan-ke-jaringan*.

[ ![Visualisasi koneksi VPN ke Azure](../media/vpngateway-site-to-site-connection-diagram.png)](../media/vpngateway-site-to-site-connection-diagram-expanded.png#lightbox)

Semua data yang ditransfer akan dienkripsi di terowongan pribadi saat melintasi internet. Anda hanya dapat menyebarkan satu gateway VPN di setiap jaringan virtual, tetapi dapat menggunakan satu gateway untuk menyambungkan ke beberapa lokasi, yang mencakup jaringan virtual atau pusat data lokal lainnya.

Saat menyebarkan gateway VPN, tentukan jenis VPN: _berbasis kebijakan_ atau _berbasis rute_. Perbedaan utama antara kedua jenis VPN ini adalah bagaimana lalu lintas yang akan dienkripsi ditentukan. Di Azure, kedua jenis gateway VPN menggunakan kunci yang telah dibagikan sebelumnya sebagai satu-satunya metode autentikasi. Kedua jenis ini juga bergantung pada Internet Key Exchange (IKE) baik dalam versi 1 atau versi 2 dan Internet Protocol Security (IPSec). IKE digunakan untuk menyiapkan asosiasi keamanan (perjanjian enkripsi) antara dua titik akhir. Asosiasi ini kemudian diteruskan ke suite IPSec, yang mengenkripsi dan mendekripsi paket data yang dienkapsulasi di terowongan VPN.

### <a name="policy-based-vpns"></a>VPN berbasis kebijakan

Gateway VPN berbasis kebijakan menentukan secara statis alamat IP paket yang harus dienkripsi melalui setiap terowongan. Jenis perangkat ini mengevaluasi setiap paket data terhadap set alamat IP tersebut untuk memilih terowongan tempat paket tersebut akan dikirim.

Fitur utama gateway VPN berbasis kebijakan di Azure meliputi:

- Dukungan hanya untuk IKEv1.

- Penggunaan *perutean statis*, di mana kombinasi awalan alamat dari kedua jaringan mengontrol bagaimana lalu lintas dienkripsi dan didekripsi melalui terowongan VPN. Sumber dan tujuan jaringan terowongan dinyatakan dalam kebijakan dan tidak perlu disebutkan dalam tabel perutean.

- VPN berbasis kebijakan harus digunakan dalam skenario tertentu yang memerlukannya, seperti untuk kompatibilitas dengan perangkat VPN lokal warisan.

### <a name="route-based-vpns"></a>VPN berbasis rute

Jika mendefinisikan alamat IP mana yang berada di balik setiap terowongan terlalu rumit, gateway berbasis rute dapat digunakan. Dengan gateway berbasis rute, terowongan IPSec dimodelkan sebagai antarmuka jaringan atau antarmuka terowongan virtual. Perutean IP (baik rute statis atau protokol perutean dinamis) memutuskan antarmuka terowongan mana yang akan digunakan saat mengirim setiap paket. VPN berbasis rute adalah metode koneksi yang disukai untuk perangkat lokal. Mereka lebih tahan terhadap perubahan topologi seperti pembuatan subnet baru.

Gunakan gateway VPN berbasis rute jika Anda memerlukan salah satu tipe konektivitas berikut ini:

- Koneksi antar jaringan virtual
- Koneksi dari titik ke situs
- Koneksi multisitus
- Hidup berdampingan dengan gateway Azure ExpressRoute

Fitur utama gateway VPN berbasis kebijakan di Azure meliputi:

- Mendukung IKEv2
- Menggunakan pemilih lalu lintas sembarang-ke-sembarang (wildcard)
- Dapat menggunakan *protokol perutean dinamis*, tempat tabel perutean/penerusan mengarahkan lalu lintas ke terowongan IPSec yang berbeda

    Dalam hal ini, jaringan sumber dan tujuan tidak didefinisikan secara statis karena berada di VPN berbasis kebijakan atau bahkan di VPN berbasis rute dengan perutean statis. Sebaliknya, paket data dienkripsi berdasarkan tabel perutean jaringan yang dibuat secara dinamis menggunakan protokol perutean seperti Border Gateway Protocol (BGP).

## <a name="vpn-gateway-sizes"></a>Ukuran gateway VPN

Kemampuan gateway VPN Anda ditentukan oleh SKU atau ukuran yang Anda sebarkan. Tabel ini memperlihatkan kemampuan utama dari setiap SKU yang tersedia.

| SKU | Terowongan situs-ke-situs/Jaringan-ke-jaringan | Tolok ukur throughput agregat | Dukungan Border Gateway Protocol |
| --- | --- | --- | --- |
| Dasar <sup>[Lihat Catatan]</sup> | Maksimum: 10 | 100 Mbps | Tidak didukung |
| VpnGw1/Az | Maksimum: 30 | 650 Mbps | Didukung |
| VpnGw2/Az | Maksimum: 30 | 1 Gbps | Didukung |
| VpnGw3/Az | Maksimum: 30 | 1.25 Gbps | Didukung |

> [!NOTE]
>
> Gateway VPN Dasar hanya boleh digunakan untuk beban kerja Dev/Test. Selain itu, tidak didukung untuk bermigrasi dari Basic ke SKU VpnGW1/2/3/Az di lain waktu tanpa harus menghapus gateway dan disebarkan kembali.

## <a name="deploy-vpn-gateways"></a>Menyebarkan gateway VPN

Sebelum dapat menyebarkan gateway VPN, Anda memerlukan beberapa sumber daya Azure dan lokal.

### <a name="required-azure-resources"></a>Sumber daya Azure yang diperlukan

Anda akan memerlukan sumber daya Azure ini sebelum bisa menyebarkan gateway VPN operasional:

- **Jaringan virtual**. Sebarkan jaringan virtual dengan ruang alamat yang cukup untuk subnet tambahan yang akan Anda butuhkan untuk gateway VPN. Ruang alamat untuk jaringan virtual ini tidak boleh tumpang tindih dengan jaringan lokal yang akan Anda sambungkan. Anda hanya dapat menyebarkan satu gateway VPN dalam jaringan virtual.
- **GatewaySubnet**. Sebarkan subnet yang disebut `GatewaySubnet` untuk gateway VPN. Gunakan setidaknya masker alamat **/27** untuk memastikan Anda memiliki alamat IP yang cukup di subnet untuk pertumbuhan di masa mendatang. Anda tidak dapat menggunakan subnet ini untuk layanan lain.
- **Alamat IP Publik**. Buat alamat IP publik dinamis Basic-SKU jika Anda menggunakan gateway yang tidak sadar zona. Alamat ini menyediakan alamat IP publik yang dapat dirutekan sebagai target untuk perangkat VPN lokal Anda. Alamat IP ini bersifat dinamis, tetapi tidak akan berubah kecuali Anda menghapus dan membuat ulang gateway VPN.
- **Gateway jaringan lokal**. Buat gateway jaringan lokal untuk menentukan konfigurasi jaringan lokal, seperti tempat gateway VPN akan tersambung dan apa yang akan disambungkan. Konfigurasi ini mencakup alamat IPv4 publik perangkat VPN lokal dan jaringan lokal yang dapat dirutekan. Informasi ini digunakan oleh gateway VPN untuk merutekan paket yang ditujukan untuk jaringan lokal melalui terowongan IPSec.
- **Gateway jaringan virtual**. Buat gateway jaringan virtual untuk merutekan lalu lintas antara jaringan virtual dan pusat data lokal atau jaringan virtual lainnya. Gateway jaringan virtual dapat berupa gateway VPN atau ExpressRoute, tetapi unit ini hanya berhubungan dengan gateway jaringan virtual VPN. (Anda akan mempelajari lebih lanjut tentang ExpressRoute di unit terpisah nanti dalam modul ini.)
- **Koneksi**. Buat sumber daya koneksi untuk membuat koneksi logis antara gateway VPN dan gateway jaringan lokal.

  - Koneksi dibuat ke alamat IPv4 perangkat VPN lokal seperti yang ditentukan oleh gateway jaringan lokal.
  - Koneksi dibuat dari gateway jaringan virtual dan alamat IP publik terkait.

   Anda dapat membuat beberapa koneksi.

Diagram berikut menunjukkan kombinasi sumber daya ini dan hubungannya agar membantu Anda lebih memahami apa saja yang diperlukan untuk menyebarkan gateway VPN.

[![Visualisasi persyaratan sumber daya untuk gateway VPN.](../media/resource-requirements-for-vpn-gateway.png)](../media/resource-requirements-for-vpn-gateway-expanded.png#lightbox)

### <a name="required-on-premises-resources"></a>Sumber daya lokal yang diperlukan

Untuk menyambungkan pusat data ke gateway VPN, Anda akan memerlukan sumber daya lokal ini:

- Perangkat VPN yang mendukung gateway VPN berbasis kebijakan atau berbasis rute
- Alamat IPv4 yang menghadap ke publik (dapat dirutekan internet)

## <a name="high-availability-scenarios"></a>Skenario ketersediaan tinggi

Ada beberapa cara untuk memastikan Anda memiliki konfigurasi yang toleran terhadap kesalahan.

### <a name="activestandby"></a>Aktif/siaga

Secara default, gateway VPN disebarkan sebagai dua instans dalam konfigurasi aktif/siaga, bahkan jika Anda hanya melihat satu sumber daya gateway VPN di Azure. Ketika pemeliharaan terencana atau gangguan tidak terencana memengaruhi instans aktif, instans siaga secara otomatis bertanggung jawab atas koneksi tanpa intervensi pengguna. Koneksi terganggu selama failover ini, tetapi biasanya dipulihkan dalam beberapa detik untuk pemeliharaan yang direncanakan dan dalam 90 detik untuk gangguan yang tidak direncanakan.

[![Visualisasi gateway jaringan virtual aktif/siaga.](../media/active-standby.png)](../media/active-standby-expanded.png#lightbox)

### <a name="activeactive"></a>Aktif/aktif

Dengan pengenalan dukungan untuk protokol perutean BGP, Anda juga dapat menyebarkan gateway VPN dalam konfigurasi aktif/aktif. Dalam konfigurasi ini, Anda menetapkan alamat IP publik yang unik untuk setiap instans. Anda kemudian membuat terowongan terpisah dari perangkat lokal ke setiap alamat IP. Anda dapat memperluas ketersediaan tinggi dengan menyebarkan perangkat VPN tambahan di tempat.

[![Visualisasi gateway jaringan virtual aktif/siaga.](../media/dual-redundancy.png)](../media/dual-redundancy-expanded.png#lightbox)

### <a name="expressroute-failover"></a>Kegagalan ExpressRoute

Opsi ketersediaan tinggi lainnya adalah mengonfigurasi gateway VPN sebagai jalur failover aman untuk koneksi ExpressRoute. Sirkuit ExpressRoute memiliki ketahanan bawaan. Tetapi sirkuit ini tidak kebal terhadap masalah fisik yang memengaruhi kabel yang memberikan konektivitas atau pemadaman yang memengaruhi lokasi ExpressRoute lengkap. Dalam skenario ketersediaan tinggi, di mana ada risiko yang terkait dengan pemadaman sirkuit ExpressRoute, Anda juga dapat menyediakan gateway VPN yang menggunakan internet sebagai metode konektivitas alternatif. Dengan cara ini, Anda dapat memastikan selalu ada koneksi ke jaringan virtual.

### <a name="zone-redundant-gateways"></a>Gateway yang berlebihan di zona

Di wilayah yang mendukung zona ketersediaan, gateway VPN dan gateway ExpressRoute dapat diserbarkan dalam konfigurasi zona-berlebihan. Konfigurasi ini menghadirkan ketahanan, skalabilitas, dan ketersediaan yang lebih tinggi ke gateway jaringan virtual. Menyebarkan gateway di zona ketersediaan Azure secara fisik dan logis memisahkan gateway dalam kawasan sekaligus melindungi konektivitas jaringan lokal Anda ke Azure dari kegagalan tingkat zona. Gateway ini memerlukan SKU gateway yang berbeda dan menggunakan alamat IP publik Standar alih-alih Alamat IP publik dasar.
