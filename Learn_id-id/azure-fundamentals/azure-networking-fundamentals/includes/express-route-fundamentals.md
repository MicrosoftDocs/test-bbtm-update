ExpressRoute memungkinkan Anda memperluas jaringan lokal Anda ke cloud Microsoft melalui koneksi privat yang difasilitasi oleh penyedia konektivitas. Dengan ExpressRoute, Anda dapat membuat koneksi ke layanan cloud Microsoft, seperti Azure, Microsoft 365, dan Dynamics 365.

Konektivitas dapat dari jaringan sembarang-ke-sembarang (IP VPN), jaringan Ethernet titik-ke-titik, atau koneksi silang virtual melalui penyedia konektivitas di fasilitas kolokasi. Koneksi ExpressRoute tidak melintasi Internet publik. Hal ini memungkinkan koneksi ExpressRoute untuk menawarkan lebih banyak keandalan, kecepatan yang lebih cepat, latensi yang konsisten, dan keamanan yang lebih tinggi daripada koneksi umum yang melintasi Internet. Untuk informasi tentang cara menghubungkan jaringan Anda ke Microsoft menggunakan ExpressRoute, lihat model konektivitas ExpressRoute.

[![Visualisasi yang memperlihatkan gambaran umum tingkat tinggi dari layanan Azure ExpressRoute.](../media/azure-expressroute-overview.png)](../media/azure-expressroute-overview-expanded.png#lightbox)

Sebagai bagian dari pekerjaan Anda untuk Tailwind Traders, Anda harus memahami apa itu Azure ExpressRoute dan bagaimana mengintegrasikannya dengan jaringan lokal dan Azure. Dalam unit ini, Anda akan mempelajari manfaat yang diberikan ExpressRoute dibandingkan dengan opsi konektivitas situs ke situs lainnya. Hasilnya, Anda akan mempelajari apakah ExpressRoute dapat memberikan kinerja jaringan terbaik kepada perusahaan Anda.

Di seluruh unit ini, kita akan berfokus pada dua lapisan berbeda dari model Open Systems Interconnection (OSI) :

- **Layer 2 (L2)**: Layer ini adalah Data Link Layer, yang menyediakan komunikasi node-ke-node antara dua node pada jaringan yang sama.
- **Layer 3 (L3)**: Layer ini adalah Network Layer, yang menyediakan mengatasi dan merutekan antara node pada jaringan multi-node.

## <a name="features-and-benefits-of-expressroute"></a>Fitur dan manfaat ExpressRoute

Ada beberapa manfaat untuk menggunakan ExpressRoute sebagai layanan koneksi antara Azure dan jaringan lokal.
- Konektivitas Layer 3 antara jaringan lokal Anda dan Microsoft Cloud melalui penyedia konektivitas. Konektivitas dapat dari jaringan sembarang-ke-sembarang (IPVPN), koneksi Ethernet titik-ke-titik, atau melalui koneksi silang virtual melalui pertukaran Ethernet.
- Konektivitas ke layanan cloud Microsoft di semua wilayah di wilayah geopolitik.
- Konektivitas global ke layanan Microsoft di semua wilayah dengan add-on premium ExpressRoute.
- Perutean dinamis antara jaringan Anda dan Microsoft melalui BGP.
- Redundansi bawaan di setiap lokasi peering untuk keandalan yang lebih tinggi.
- Koneksi uptime SLA.
- Dukungan QoS untuk Skype for Business.

### <a name="layer-3-connectivity"></a>Konektivitas Layer 3

ExpressRoute menyediakan konektivitas Layer 3 (level-alamat) antara jaringan lokal Anda dan cloud Microsoft melalui mitra konektivitas. Koneksi ini dapat berasal dari jaringan titik-ke-titik atau sembarang-ke-sembarang. Koneksi ini juga dapat berupa koneksi silang virtual melalui pertukaran.

### <a name="built-in-redundancy"></a>Redundansi bawaan

Setiap penyedia konektivitas menggunakan perangkat yang berlebihan untuk memastikan bahwa koneksi yang dibuat dengan Microsoft sangat tersedia. Anda dapat mengonfigurasi beberapa sirkuit untuk melengkapi fitur ini. Semua koneksi berlebihan dikonfigurasi dengan konektivitas Layer 3 untuk memenuhi perjanjian tingkat layanan.

### <a name="connectivity-to-microsoft-cloud-services"></a>Konektivitas ke layanan cloud Microsoft

ExpressRoute memungkinkan akses langsung ke layanan berikut di semua wilayah:

- Microsoft Office 365
- Microsoft Dynamics 365
- Layanan komputasi Azure, seperti Azure Virtual Machines
- Layanan cloud Azure, seperti Azure Cosmos DB dan Azure Storage

Office 365 dibuat untuk diakses dengan aman dan andal melalui internet. Maka dari itu, kami merekomendasikan penggunaan ExpressRoute untuk skenario tertentu. Bagian "Pelajari selengkapnya" di akhir modul ini menyertakan tautan tentang menggunakan ExpressRoute untuk mengakses Office 365.

### <a name="across-on-premises-connectivity-with-expressroute-global-reach"></a>Melintasi konektivitas lokal dengan ExpressRoute Global Reach

Anda dapat mengaktifkan ExpressRoute Global Reach untuk bertukar data di seluruh situs lokal Anda dengan menghubungkan sirkuit ExpressRoute Anda. Misalnya, anggap bahwa Anda memiliki pusat data pribadi di California yang terhubung ke ExpressRoute di Silicon Valley. Anda memiliki pusat data pribadi lain di Texas yang terhubung ke ExpressRoute di Dallas. Dengan ExpressRoute Global Reach, Anda dapat menghubungkan pusat data pribadi Anda melalui dua sirkuit ExpressRoute. Lalu lintas pusat data silang Anda akan melintasi jaringan Microsoft.

### <a name="dynamic-routing"></a>Perutean dinamis

ExpressRoute menggunakan protokol perutean Border Gateway Protocol (BGP). BGP digunakan untuk bertukar rute antara jaringan lokal dan sumber daya yang berjalan di Azure. Memungkinkan perutean dinamis antara infrastruktur dan layanan lokal Anda yang berjalan di Microsoft Cloud.

## <a name="expressroute-connectivity-models"></a>Model konektivitas ExpressRoute

ExpressRoute mendukung tiga model yang bisa Anda gunakan untuk menyambungkan jaringan lokal Anda ke cloud Microsoft:

- Kolokasi CloudExchange
- Koneksi Ethernet titik-ke-titik
- Koneksi sembarang-ke-sembarang

[![Model Konektivitas Azure](../media/azure-connectivity-models.png)](../media/azure-connectivity-models-expanded.png#lightbox)

### <a name="colocation-at-a-cloud-exchange"></a>Kolokasi di pertukaran cloud

Penyedia kolokasi biasanya dapat menawarkan koneksi Layer 2 dan Layer 3 antara infrastruktur Anda, yang mungkin terletak di fasilitas kolokasi, dan cloud Microsoft. Misalnya, jika pusat data Anda dikolokasikan di pertukaran cloud seperti ISP, Anda dapat meminta koneksi silang virtual ke cloud Microsoft.

### <a name="point-to-point-ethernet-connection"></a>Koneksi Ethernet titik-ke-titik

Koneksi titik-ke-titik menyediakan konektivitas Layer 2 dan Layer 3 antara situs lokal Anda dan Azure. Anda dapat menyambungkan kantor atau pusat data ke Azure dengan menggunakan tautan titik-ke-titik. Misalnya, jika Anda memiliki pusat data lokal, Anda dapat menggunakan tautan Ethernet titik-ke-titik untuk menyambungkan ke Microsoft.

### <a name="any-to-any-networks"></a>Jaringan sembarang-ke-sembarang

Dengan konektivitas sembarang-ke-sembarang, Anda dapat mengintegrasikan WAN dengan Azure dengan menyediakan koneksi ke kantor dan pusat data Anda. Azure mengintegrasikan dengan koneksi WAN untuk menyediakan koneksi seperti yang Anda miliki antara pusat data dan semua kantor cabang.

Dengan koneksi sembarang-ke-sembarang, semua penyedia WAN menawarkan konektivitas layer-3. Misalnya, jika sudah menggunakan Peralihan Label Multiprotokol untuk menyambungkan ke kantor cabang atau situs lain di organisasi Anda, koneksi ExpressRoute ke Microsoft berperilaku seperti lokasi lain di WAN pribadi Anda.

## <a name="security-considerations"></a>Pertimbangan keamanan

Dengan ExpressRoute, data Anda tidak bergerak melintasi internet publik, sehingga tidak terpapar potensi risiko yang terkait dengan komunikasi internet. ExpressRoute adalah koneksi pribadi dari infrastruktur lokal ke infrastruktur Azure Anda. Bahkan jika Anda memiliki koneksi ExpressRoute, kueri DNS, pemeriksaan daftar pencabutan sertifikat, dan permintaan Jaringan Pengiriman Konten Azure masih dikirim melalui internet publik.
