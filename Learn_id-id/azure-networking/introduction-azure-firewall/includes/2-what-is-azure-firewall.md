Di sini Anda mempelajari dasar-dasar Azure Firewall dan Azure Firewall Manager. Ringkasan ini akan membantu Anda memutuskan apakah Azure Firewall dan Azure Firewall Manager sesuai dengan strategi keamanan jaringan Contoso.

## <a name="overview-of-azure-firewall"></a>Ringkasan Azure Firewall

Azure Firewall adalah layanan keamanan berbasis cloud yang melindungi sumber daya jaringan virtual Azure Anda dari ancaman masuk dan keluar. Dalam beberapa bagian berikutnya, Anda akan mempelajari dasar-dasar dan fitur utama Azure Firewall.

### <a name="what-is-a-firewall"></a>Apa itu firewall?

*Firewall* adalah fitur keamanan jaringan yang berada di antara jaringan tepercaya dan jaringan yang tidak tepercaya, seperti internet. Tugas firewall adalah menganalisis semua lalu lintas jaringan masuk dan keluar. Berdasarkan analisis itu, firewall memungkinkan lalu lintas untuk lewat, atau menolaknya. Idealnya, firewall memungkinkan semua lalu lintas yang sah selagi menolak lalu lintas berbahaya seperti malware dan upaya gangguan.

Secara default, sebagian besar firewall menolak semua lalu lintas masuk dan keluar. Saat firewall menganalisis lalu lintas jaringan, firewall memeriksa kondisi tertentu yang harus dipenuhi sebelum memungkinkan lalu lintas untuk lewat. Kondisi tersebut bisa berupa alamat IP tertentu, FQDN, port jaringan, protokol jaringan, atau kombinasi apa pun.

Bersama-sama, kondisi ini mendefinisikan *aturan* firewall. Firewall mungkin hanya memiliki satu aturan, tetapi sebagian besar firewall dikonfigurasi dengan banyak aturan. Hanya lalu lintas jaringan yang memenuhi ketentuan aturan firewall yang diizinkan untuk lewat.

Beberapa firewall berbasis perangkat keras dan berada di dalam perangkat yang dibuat agar bertindak sebagai firewall. Firewall lainnya adalah program perangkat lunak yang berjalan pada perangkat komputasi bertujuan umum.

### <a name="what-is-azure-firewall"></a>Apa itu Azure Firewall?

Azure Firewall adalah layanan firewall berbasis cloud. Dalam sebagian besar konfigurasi, Azure Firewall diprovisikan di dalam jaringan virtual hub. Lalu lintas ke dan dari jaringan virtual spoke dan jaringan lokal melintasi firewall dengan jaringan hub.

Semua lalu lintas ke dan dari internet ditolak secara default. Lalu lintas hanya diperbolehkan jika melewati berbagai pengujian, seperti aturan firewall yang dikonfigurasi.

:::image type="content" source="../media/2-firewall-description.png" alt-text="Diagram jaringan dari jaringan virtual hub, beberapa jaringan virtual spoke, dan jaringan lokal, dengan semua lalu lintas ke dan dari internet melewati instans Azure Firewall di jaringan hub." border="false":::

> [!NOTE]
> Azure Firewall berfungsi tidak hanya untuk lalu lintas ke dan dari internet, tetapi juga secara internal. Pemfilteran lalu lintas internal mencakup lalu lintas spoke-to-spoke dan lalu lintas cloud hibrid antara jaringan lokal dan jaringan virtual Azure Anda.

### <a name="key-features-of-azure-firewall"></a>Fitur utama Azure Firewall

Tabel berikut ini mencantumkan fitur utama Azure Firewall.

|Fitur  |Deskripsi  |
|---------|---------|
|Terjemahan alamat jaringan sumber (SNAT)     |Semua lalu lintas keluar dikirim ke alamat IP privat instans Azure Firewall. Alamat IP setiap komputer virtual sumber diterjemahkan ke alamat IP publik statik instans Azure Firewall. Untuk semua tujuan eksternal, lalu lintas jaringan Anda tampaknya berasal dari satu alamat IP publik.         |
|Terjemahan alamat jaringan tujuan (DNAT)     |Semua lalu lintas masuk dari sumber eksternal dikirim ke alamat IP publik instans Azure Firewall. Lalu lintas yang diizinkan diterjemahkan ke alamat IP privat sumber daya tujuan pada jaringan virtual Anda.         |
|Aturan aplikasi     |Aturan yang membatasi lalu lintas keluar ke daftar FQDN. Misalnya, Anda dapat mengizinkan lalu lintas keluar untuk mengakses FQDN dari instans database SQL tertentu.         |
|Aturan jaringan     |Aturan untuk lalu lintas masuk dan keluar berdasarkan parameter jaringan. Parameter ini termasuk tujuan atau alamat IP sumber; port jaringan; dan protokol jaringan.         |
|Inteligensi ancaman     |Memfilter lalu lintas masuk dan keluar berdasarkan aturan inteligensi ancaman Microsoft, yang menentukan alamat IP dan nama domain berbahaya yang diketahui. Anda dapat mengonfigurasi Azure Firewall dengan salah satu dari dua mode inteligensi ancaman: memberi tahu Anda saat traffic gagal dalam aturan inteligensi ancaman atau memperingatkan Anda dan menolak lalu lintas.         |
|Dukungan Berbagai Status     |Memeriksa paket jaringan dalam konteks, tidak hanya secara individu. Jika satu atau beberapa paket tiba secara tidak terduga mengingat lalu lintas saat ini, Azure Firewall memperlakukan paket sebagai berbahaya dan menolaknya.         |
|Penerowongan paksa     |Memungkinkan Azure Firewall merutekan semua lalu lintas keluar ke sumber daya jaringan tertentu dan tidak langsung ke internet. Sumber daya jaringan mungkin merupakan firewall perangkat keras lokal atau alat virtual jaringan yang memproses lalu lintas sebelum memungkinkannya untuk keluar ke internet.         |
|Dukungan tag     |Azure Firewall mendukung tag layanan dan tag FQDN untuk konfigurasi aturan yang lebih mudah. *Tag layanan* adalah entitas teks yang menunjukkan layanan Azure. Misalnya, **AzureCosmosDB** adalah tag layanan untuk layanan Azure Cosmos DB. *Tag FQDN* adalah entitas teks yang mewakili sekelompok nama domain yang terkait dengan layanan Microsoft yang populer. Misalnya, **WindowsVirtualDesktop** adalah tag FQDN untuk lalu lintas Windows Virtual Desktop.   |
|Pemantauan     |Azure Firewall mencatat semua lalu lintas jaringan masuk dan keluar, dan Anda dapat menganalisis log yang dihasilkan menggunakan Azure Monitor, Power BI, Excel, dan alat lainnya.         |

## <a name="overview-of-azure-firewall-manager"></a>Ringkasan Azure Firewall Manager

Azure Firewall Manager menyediakan titik pusat konfigurasi dan manajemen beberapa instans Azure Firewall. Azure Firewall Manager memungkinkan Anda membuat satu atau beberapa kebijakan firewall dan menerapkannya dengan cepat ke beberapa firewall.

### <a name="what-is-a-firewall-policy"></a>Apa itu kebijakan firewall?

Konfigurasi satu Azure Firewall dapat menjadi rumit. Misalnya, firewall dapat dikonfigurasi dengan beberapa kumpulan aturan. *Kumpulan* adalah kombinasi dari salah satu atau semua item berikut:

- Satu atau beberapa aturan penerjemahan alamat jaringan (NAT)
- Satu atau beberapa aturan jaringan
- Satu atau beberapa aturan aplikasi

Saat Anda menyertakan pengaturan firewall lain seperti DNS kustom dan aturan inteligensi ancaman, mengonfigurasi hanya satu firewall dapat menjadi beban. Menambah beban adalah dua skenario umum keamanan jaringan:

- Arsitektur jaringan Anda memerlukan beberapa firewall.
- Anda ingin setiap firewall menerapkan aturan keamanan tingkat dasar yang berlaku untuk semua orang, ditambah aturan khusus untuk grup yang ditunjuk seperti pengembang, pengguna database, dan departemen pemasaran.

Untuk menyederhanakan kompleksitas pengelolaan skenario firewall ini dan yang serupa, Anda dapat menerapkan kebijakan firewall. *Kebijakan firewall* adalah sumber daya Azure yang berisi satu atau beberapa kumpulan aturan NAT, jaringan, dan aplikasi, pengaturan DNS kustom, pengaturan inteligensi ancaman, dan lainnya.

Poin pentingnya adalah bahwa Azure menawarkan sumber daya yang disebut Kebijakan Firewall. Kebijakan firewall yang Anda buat adalah contoh sumber daya tersebut. Sebagai sumber daya terpisah, Anda dapat dengan cepat menerapkan kebijakan ke beberapa firewall menggunakan Azure Firewall Manager. Anda dapat membuat satu kebijakan untuk menjadi kebijakan dasar, kemudian memiliki kebijakan yang lebih khusus mewarisi aturan kebijakan dasar.

### <a name="key-features-of-azure-firewall-manager"></a>Fitur utama Azure Firewall Manager

Tabel berikut ini mencantumkan fitur utama Azure Firewall Manager.

|Fitur  |Deskripsi  |
|---------|---------|
|Manajemen terpusat     |Mengelola semua konfigurasi firewall di seluruh jaringan Anda.         |
|Mengelola beberapa firewall     |Menerapkan, mengonfigurasi, dan memantau sejumlah firewall dari satu antarmuka.         |
|Mendukung beberapa arsitektur jaringan     |Melindungi jaringan virtual Azure standar dan Azure Virtual WAN Hubs.         |
|Perutean lalu lintas otomatis     |Lalu lintas jaringan secara otomatis dirutekan ke firewall (saat digunakan hanya dengan Azure Virtual WAN Hub).         |
|Kebijakan hierarkis     |Memungkinkan Anda membuat apa yang disebut kebijakan firewall induk dan turunan. Kebijakan *induk* berisi aturan dan pengaturan yang ingin Anda terapkan secara global; *kebijakan turunan* mewarisi semua aturan dan pengaturan induknya.         |
|Dukungan untuk penyedia keamanan pihak ketiga     |Memungkinkan Anda mengintegrasikan solusi keamanan pihak ketiga sebagai layanan (SECaaS) untuk melindungi koneksi internet jaringan.         |

> [!NOTE]
> Dengan memungkinkan Anda mengintegrasikan solusi SECaaS pihak ketiga, strategi keamanan jaringan Anda mungkin menggunakan Azure Firewall untuk memantau lalu lintas jaringan lokal selagi menggunakan penyedia SECaaS pihak ketiga untuk memantau lalu lintas internet.

### <a name="architecture-options"></a>Opsi arsitektur

Azure Firewall Manager menyediakan manajemen keamanan untuk dua arsitektur jaringan berikut:

- Jaringan virtual hub. Jaringan virtual Azure standar, tempat satu atau beberapa kebijakan firewall telah diterapkan.
- Virtual hub aman. Hub Azure Virtual WAN, tempat satu atau beberapa kebijakan firewall telah diterapkan.
