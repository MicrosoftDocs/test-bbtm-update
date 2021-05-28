Anda mengetahui fitur dasar Azure Firewall dan Azure Firewall Manager. Sekarang mari kita periksa bagaimana teknologi ini bekerja untuk memberikan keamanan untuk sumber daya Azure Anda. Informasi ini akan membantu Anda mengevaluasi apakah Azure Firewall adalah alat yang tepat untuk strategi keamanan jaringan Contoso.

## <a name="how-azure-firewall-protects-an-azure-virtual-network"></a>Cara Azure Firewall melindungi jaringan virtual Azure

Untuk memahami bagaimana Azure Firewall melindungi jaringan virtual Anda, ketahuilah bahwa ada dua karakteristik utama untuk setiap penerapan Azure Firewall:

- Instans firewall memiliki alamat IP publik tempat semua lalu lintas masuk dikirim.
- Instans firewall memiliki alamat IP privat tempat semua lalu lintas keluar dikirim.

Artinya, semua lalu lintas—inbound dan outbound—melewati firewall. Secara default, firewall menolak akses ke semuanya. Tugas Anda adalah mengonfigurasi firewall dengan kondisi agar lalu lintas diizinkan melintas melalui firewall. Setiap kondisi disebut *aturan* dan setiap aturan menerapkan satu atau beberapa pemeriksaan pada data. Hanya lalu lintas yang melewati setiap cek masuk semua aturan firewall yang diizinkan untuk melewatinya.

Cara Azure Firewall mengelola lalu lintas jaringan bergantung pada dari mana lalu lintas berasal:

- Untuk lalu lintas masuk yang diizinkan, Azure Firewall menggunakan DNAT guna menerjemahkan alamat IP publik firewall ke alamat IP privat sumber daya tujuan yang sesuai di jaringan virtual.
- Untuk lalu lintas keluar yang diizinkan, Azure Firewall menggunakan SNAT untuk menerjemahkan alamat IP sumber ke alamat IP publik firewall.

> [!NOTE]
> Azure Firewall hanya menggunakan SNAT saat alamat IP tujuan berada di luar jaringan virtual Anda. Jika alamat IP tujuan berasal dari ruang alamat privat jaringan virtual Anda, Azure Firewall tidak menggunakan SNAT pada lalu lintas.

## <a name="where-azure-firewall-fits-into-a-virtual-network"></a>Kapan Azure Firewall sesuai dengan jaringan virtual

Agar Azure Firewall dapat melakukan tugasnya secara efektif, Anda harus mengaturnya sebagai penghalang antara jaringan tepercaya yang ingin Anda lindungi dan jaringan tidak tepercaya yang memiliki potensi ancaman. Yang paling umum, Anda dapat menerapkan Azure Firewall sebagai penghalang antara jaringan virtual Azure dan internet.

Azure Firewall paling baik digunakan menggunakan topologi jaringan *hub dan spoke* dengan karakteristik berikut:

- Jaringan virtual yang bertindak sebagai titik konektivitas pusat. Jaringan ini adalah *jaringan virtual hub*.
- Satu atau beberapa jaringan virtual yang di-peer ke hub. Peer ini *adalah jaringan virtual spoke* dan digunakan untuk memprovisikan server beban kerja.

Anda menerapkan instans firewall di subnet jaringan virtual hub dan kemudian mengonfigurasi semua lalu lintas inbound dan outbound untuk melewati firewall.

Gunakan langkah-langkah umum berikut untuk menyiapkan instans Azure Firewall:

1. Buat jaringan virtual hub yang menyertakan subnet untuk penerapan firewall.
1. Buat jaringan virtual spoke serta subnet dan servernya.
1. Peer jaringan spoke dan hub.
1. Terapkan firewall ke subnet hub.
1. Untuk lalu lintas keluar, buat rute default yang mengirim lalu lintas dari semua subnet ke alamat IP privat firewall.
1. Konfigurasikan firewall dengan aturan untuk memfilter lalu lintas masuk dan keluar.

## <a name="azure-firewall-rule-types"></a>Jenis aturan Azure Firewall

Tabel berikut menjelaskan tiga jenis aturan yang dapat Anda buat untuk firewall Azure.

|Jenis aturan  |Deskripsi  |
|---------|---------|
|NAT     |Menerjemahkan dan memfilter lalu lintas internet masuk berdasarkan alamat IP publik firewall dan nomor port yang ditentukan. Misalnya, untuk mengaktifkan koneksi desktop jarak jauh ke komputer virtual, Anda dapat menggunakan aturan NAT untuk menerjemahkan alamat IP publik firewall dan port **3389** ke alamat IP privat komputer virtual.        |
|Aplikasi     |Memfilter lalu lintas berdasarkan FQDN. Misalnya, Anda dapat menggunakan aturan aplikasi untuk memungkinkan lalu lintas keluar mengakses instans Database Azure SQL menggunakan FQDN *server10.database.windows.net*.         |
|Jaringan     |Filter lalu lintas berdasarkan satu atau beberapa dari tiga parameter jaringan berikut: alamat IP, port, dan protokol. Misalnya, Anda dapat menggunakan aturan jaringan untuk mengizinkan lalu lintas keluar mengakses server DNS tertentu di alamat IP tertentu menggunakan port **53**.  |

:::image type="content" source="../media/3-firewall-operation.png" alt-text="Diagram jaringan komputer eksternal yang meminta koneksi desktop jarak jauh dengan komputer virtual dan Azure Firewall menerjemahkan alamat IP publiknya ke alamat IP privat komputer virtual." border="false":::

> [!IMPORTANT]
> Azure Firewall menerapkan aturan dalam urutan prioritas. Aturan berdasarkan inteligensi ancaman selalu diberikan prioritas tertinggi dan diproses terlebih dahulu. Setelah itu, aturan diterapkan berdasarkan jenis: aturan NAT, lalu aturan jaringan, lalu aturan aplikasi. Dalam setiap jenis, aturan diproses sesuai dengan nilai prioritas yang Anda tetapkan saat Anda membuat aturan, mulai dari nilai terendah hingga nilai tertinggi.

## <a name="azure-firewall-deployment-options"></a>Opsi penerapan Azure Firewall

Azure Firewall menawarkan banyak fitur yang dirancang untuk mempermudah dalam membuat dan mengelola aturan. Tabel berikut ini meringkas hasilnya.

|Fitur  |Deskripsi  |
|---------|---------|
|FQDN     |Nama domain host, atau satu atau beberapa alamat IP. Menambahkan FQDN ke aturan aplikasi memungkinkan akses ke domain tersebut. Saat Anda menggunakan FQDN dalam aturan aplikasi, Anda dapat menggunakan kartubebas, seperti *.google.com.        |
|Tag FQDN     |Sekelompok FQDN Microsoft yang terkenal. Menambahkan tag FQDN ke aturan aplikasi memungkinkan akses keluar ke FQDN tag. Ada tag FQDN untuk Windows Update, Windows Virtual Desktop, diagnostik Windows, Azure Backup, dan masih banyak lagi. Tag FQDN dikelola oleh Microsoft dan tidak dapat dimodifikasi atau dibuat.       |
|Tag layanan     |Sekelompok awalan alamat IP yang terkait dengan layanan Azure tertentu. Menambahkan tag layanan ke aturan jaringan memungkinkan akses ke layanan yang diwakili oleh tag. Ada tag layanan untuk banyak layanan Azure, termasuk Azure Backup, Azure Cosmos DB, Logic Apps, dan masih banyak lagi. Tag FQDN dikelola oleh Microsoft dan tidak dapat dimodifikasi atau dibuat.        |
|Grup IP     |Sekelompok alamat IP, seperti 10.2.0.0/16 atau 10.1.0.0-10.1.0.31. Anda dapat menggunakan grup IP sebagai alamat sumber dalam aturan NAT atau aplikasi, atau sebagai alamat sumber atau tujuan dalam aturan jaringan.        |
|DNS Kustom     |Server DNS kustom yang menyelesaikan nama domain ke alamat IP. Jika menggunakan server DNS kustom daripada Azure DNS, Anda juga harus mengonfigurasi Azure Firewall sebagai proksi DNS.        |
|Proksi DNS     |Anda dapat mengonfigurasi Azure Firewall untuk bertindak sebagai proksi DNS, yang berarti semua permintaan DNS klien melewati firewall sebelum masuk ke server DNS.        |
