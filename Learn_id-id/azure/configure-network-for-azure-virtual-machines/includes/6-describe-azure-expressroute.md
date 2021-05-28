Ketika perusahaan Anda menangani data yang sangat sensitif, dan memiliki sejumlah besar informasi yang akan disimpannya di Azure, ada beberapa kekhawatiran tentang keamanan dan keandalan koneksi melalui internet publik. Perusahaan tidak bersedia melakukan migrasi besar-besaran ke Azure kecuali Azure dapat menunjukkan tingkat konektivitas, keamanan, dan keandalan yang lebih tinggi.

Di sini, kita akan melampaui koneksi yang berjalan melalui internet ke jalur khusus langsung ke pusat data Azure.

## <a name="azure-expressroute"></a>Azure ExpressRoute

Microsoft Azure ExpressRoute memungkinkan organisasi untuk memperluas jaringan lokal mereka ke Microsoft Cloud melalui koneksi privat yang diterapkan oleh penyedia konektivitas. Pengaturan ini berarti bahwa konektivitas ke pusat data Azure tidak melalui internet tetapi melalui tautan khusus. ExpressRoute juga memfasilitasi koneksi yang efisien dengan layanan berbasis cloud Microsoft lainnya, seperti Microsoft 365 dan Dynamics 365.

Keuntungan yang disediakan ExpressRoute meliputi:

- Kecepatan lebih cepat, dari 50 Mbps hingga 10 Gbps, dengan penskalaan bandwidth dinamis

- Latensi yang lebih rendah

- Keandalan yang lebih besar melalui peering bawaan

- Sangat aman

ExpressRoute membawa sejumlah manfaat lebih lanjut, seperti:

- Konektivitas ke semua layanan Azure yang didukung

- Konektivitas global ke semua wilayah (memerlukan add-on premium)

- Perutean dinamis melalui Border Gateway Protocol

- Perjanjian tingkat layanan (SLA) untuk uptime koneksi

- Kualitas Layanan (QoS) untuk Skype for Business

Selain itu, terdapat add-on premium ExpressRoute yang menawarkan manfaat seperti peningkatan batas rute, konektivitas layanan global, dan peningkatan tautan jaringan virtual per sirkuit.

## <a name="expressroute-connectivity-models"></a>Model konektivitas ExpressRoute

Koneksi ke ExpressRoute dapat melalui mekanisme berikut:

- Jaringan IP VPN (apa pun-ke-apa pun)

- Koneksi silang virtual melalui pertukaran ethernet

- Koneksi ethernet titik-ke-titik

 Kemampuan dan fitur ExpressRoute semuanya identik di semua model konektivitas di atas.

### <a name="what-is-layer-3-connectivity"></a>Apa itu konektivitas lapisan 3?

Microsoft menggunakan protokol perutean dinamis standar industri (BGP) untuk bertukar rute antara jaringan lokal Anda, instans Anda di Azure, dan alamat publik Microsoft. Kami membuat beberapa sesi BGP dengan jaringan Anda untuk profil lalu lintas yang berbeda.

### <a name="any-to-any-ipvpn-networks"></a>Jaringan apa pun-ke-apa pun (IPVPN)

Penyedia IPVPN biasanya menyediakan konektivitas antara kantor cabang dan pusat data perusahaan Anda melalui koneksi lapisan 3 terkelola. Dengan ExpressRoute, pusat data Azure muncul seolah-olah mereka adalah kantor cabang lain.

### <a name="virtual-cross-connection-through-an-ethernet-exchange"></a>Koneksi silang virtual melalui pertukaran ethernet

Jika organisasi Anda berada di lokasi yang sama dengan fasilitas pertukaran cloud, Anda meminta koneksi silang ke Microsoft Cloud melalui pertukaran ethernet penyedia Anda. Koneksi silang ke Microsoft Cloud ini dapat beroperasi pada koneksi terkelola lapisan 2 atau lapisan 3, seperti dalam model OSI jaringan.

### <a name="point-to-point-ethernet-connection"></a>Koneksi ethernet titik-ke-titik

Tautan ethernet titik-ke-titik dapat menyediakan koneksi lapisan 2 atau 3 lapisan terkelola antara pusat data atau kantor lokal Anda ke Microsoft Cloud.

## <a name="how-expressroute-works"></a>Cara kerja ExpressRoute

Azure ExpressRoute menggunakan kombinasi sirkuit ExpressRoute dan domain perutean untuk menyediakan konektivitas bandwidth tinggi ke Microsoft Cloud.

### <a name="what-are-expressroute-circuits"></a>Apa itu sirkuit ExpressRoute

Sirkuit ExpressRoute adalah koneksi logis antara infrastruktur lokal Anda dan Microsoft Cloud. Penyedia konektivitas menerapkan koneksi tersebut, meskipun beberapa organisasi menggunakan beberapa penyedia konektivitas untuk alasan redundansi. Setiap sirkuit memiliki bandwidth tetap baik 50, 100, 200 Mbps atau 500 Mbps, atau 1 Gbps atau 10 Gbps, dan masing-masing sirkuit tersebut memetakan ke penyedia konektivitas dan lokasi peering. Selain itu, setiap sirkuit ExpressRoute memiliki kuota dan batasan default.

Sirkuit ExpressRoute tidak setara dengan koneksi jaringan atau perangkat jaringan. Setiap sirkuit didefinisikan oleh GUID, yang disebut _layanan_ atau _s-key_. S-key ini menyediakan tautan konektivitas antara Microsoft, penyedia konektivitas Anda, dan organisasi Anda - ini bukan rahasia kriptografi. Setiap s-key memiliki pemetaan satu-ke-satu ke sirkuit Azure ExpressRoute.

Setiap sirkuit dapat memiliki hingga dua peering, yaitu sepasang sesi BGP yang dikonfigurasi untuk redundansi. Mereka adalah:

- Azure private
- Microsoft

### <a name="routing-domains"></a>Domain perutean

Sirkuit ExpressRoute kemudian memetakan ke domain perutean, dengan setiap sirkuit ExpressRoute memiliki beberapa domain perutean. Domain ini sama dengan dua peering yang sebelumnya terdaftar. Dalam konfigurasi aktif-aktif, setiap pasang router akan memiliki setiap domain perutean yang dikonfigurasi secara identik, sehingga memberikan ketersediaan tinggi. Nama peering privat Azure mewakili skema alamat IP.

#### <a name="azure-private-peering"></a>Peering privat Azure

Peering privat Azure terhubung ke layanan komputasi Azure seperti komputer virtual dan layanan cloud yang diterapkan dengan jaringan virtual. Selama keamanan dijalankan, domain peering privat hanyalah ekstensi dari jaringan lokal Anda ke Azure. Anda kemudian mengaktifkan konektivitas dua arah antara jaringan tersebut dan jaringan virtual Azure apa pun yang membuat alamat IP Azure VM terlihat dalam jaringan internal Anda.

Anda hanya dapat menyambungkan satu jaringan virtual ke domain peering privat.

#### <a name="microsoft-peering"></a>Microsoft peering

Microsoft peering mendukung koneksi ke penawaran SaaS berbasis cloud, seperti Microsoft 365 dan Dynamics 365. Opsi peering ini menyediakan konektivitas dua arah antara layanan cloud WAN dan Microsoft perusahaan Anda.

### <a name="expressroute-health"></a>Kesehatan ExpressRoute

Seperti kebanyakan fitur di Microsoft Azure, Anda dapat memantau koneksi ExpressRoute untuk memastikan bahwa performa fitur tersebut sesuai harapan. Pemantauan mencakup cakupan area berikut:

- Ketersediaan
- Konektivitas ke jaringan virtual
- Penggunaan bandwidth

Alat utama untuk aktivitas pemantauan ini adalah Network Performance Monitor, khususnya NPM untuk ExpressRoute.

Azure ExpressRoute digunakan untuk membuat koneksi privat antara pusat data Azure dan infrastruktur lokal Anda atau di lingkungan kolokasi. Koneksi ExpressRoute tidak melalui internet publik, dan mereka menawarkan lebih banyak keandalan, kecepatan yang lebih cepat, dan keterlambatan yang lebih rendah daripada koneksi internet biasa.
