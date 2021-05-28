*Firewall* adalah perangkat keamanan jaringan yang memantau lalu lintas jaringan masuk dan keluar dan memutuskan apakah akan mengizinkan atau memblokir lalu lintas tertentu berdasarkan sekumpulan aturan keamanan yang ditentukan. Anda dapat membuat aturan firewall yang menentukan rentang alamat IP. Hanya klien yang diberikan alamat IP dari dalam rentang tersebut yang diizinkan untuk mengakses server tujuan. Aturan firewall juga dapat mencakup protokol jaringan dan informasi port tertentu.

Tailwind Traders saat ini menjalankan appliance firewall, yang menggabungkan perangkat keras dan perangkat lunak, untuk melindungi jaringan lokalnya. Appliance firewall ini memerlukan biaya lisensi bulanan untuk beroperasi dan mereka memerlukan melakukan pemeliharaan rutin oleh staf IT. Saat Tailwind Traders beralih ke cloud, manajer IT ingin tahu layanan Azure apa yang dapat melindungi jaringan cloud perusahaan dan jaringan lokalnya.

Di bagian ini, Anda akan menjelajahi Azure Firewall.

## <a name="whats-azure-firewall"></a>Apa itu Azure Firewall?

[Azure Firewall](https://azure.microsoft.com/services/azure-firewall?azure-portal=true) adalah layanan keamanan jaringan berbasis cloud terkelola yang melindungi sumber daya jaringan virtual Azure Anda. Jaringan virtual mirip dengan jaringan tradisional yang akan Anda operasikan di pusat data Anda sendiri. Jaringan ini adalah blok build mendasar untuk jaringan privat Anda yang memungkinkan komputer virtual dan sumber daya komputasi lainnya untuk berkomunikasi dengan aman satu sama lain, internet, dan jaringan lokal.

Berikut adalah diagram yang memperlihatkan penerapan Azure Firewall dasar:

:::image type="content" source="../media/3-firewall-overview.png" alt-text="Diagram yang menunjukkan penerapan Azure Firewall dasar." lightbox="../media/3-firewall-overview-large.png" border="false":::

Azure Firewall adalah firewall *yang mendukung berbagai status*. Firewall yang mendukung berbagai status menganalisis konteks lengkap koneksi jaringan, bukan hanya paket individual lalu lintas jaringan. Azure Firewall memiliki ketersediaan tinggi dan skalabilitas cloud yang tidak terbatas.

Azure Firewall menyediakan lokasi terpusat untuk membuat, memberlakukan, dan mencatat kebijakan konektivitas aplikasi dan jaringan di seluruh langganan dan jaringan virtual. Azure Firewall memberikan alamat IP publik statik untuk sumber daya jaringan virtual Anda, yang memungkinkan firewall luar mengidentifikasi lalu lintas yang berasal dari jaringan virtual Anda. Layanan terintegrasi penuh dengan Azure Monitor untuk memungkinkan pengelogan dan analitik.

Azure Firewall menyediakan banyak fitur, termasuk:

- Ketersediaan tinggi bawaan.
- Skalabilitas cloud tidak terbatas.
- Aturan pemfilteran masuk dan keluar.
- Dukungan Destination Network Address Translation (DNAT) masuk.
- Pengelogan Azure Monitor.

Anda biasanya menerapkan Azure Firewall pada jaringan virtual pusat untuk mengontrol akses jaringan umum.

Video singkat ini menjelaskan bagaimana Azure Firewall memantau lalu lintas jaringan masuk dan keluar berdasarkan sekumpulan aturan keamanan yang ditentukan. Video ini juga menjelaskan bagaimana Azure Firewall dibandingkan dengan peralatan firewall tradisional.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RWyFpp]

## <a name="what-can-i-configure-with-azure-firewall"></a>Apa yang bisa saya konfigurasi dengan Azure Firewall?

Dengan Azure Firewall, Anda dapat mengonfigurasi:

- Aturan aplikasi yang mendefinisikan nama domain yang sepenuhnya memenuhi syarat (FQDN), yang dapat diakses dari subnet.
- Aturan jaringan yang menentukan alamat sumber, protokol, port tujuan, dan alamat tujuan.
- Aturan Network Address Translation (NAT) yang menentukan alamat IP dan port tujuan untuk menerjemahkan permintaan masuk.

[Azure Application Gateway](https://azure.microsoft.com/services/application-gateway?azure-portal=true) juga menyediakan firewall yang disebut *firewall aplikasi web* (WAF). WAF memberikan perlindungan masuk terpusat untuk aplikasi web Anda terhadap eksploitasi dan kerentanan umum. [Azure Front Door](https://azure.microsoft.com/services/frontdoor/?azure-portal=true) dan [Azure Content Delivery Network](https://azure.microsoft.com/services/cdn/?azure-portal=true) juga menyediakan layanan WAF.
