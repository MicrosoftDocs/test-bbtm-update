Anda memiliki pusat data lokal yang ingin disimpan, tetapi Anda ingin menggunakan Azure untuk membongkar lalu lintas puncak menggunakan komputer virtual (VM) yang dihosting di Azure. Anda ingin menyimpan skema alamat IP dan peralatan jaringan yang ada sambil memastikan bahwa transfer data apa pun aman.

## <a name="what-is-azure-virtual-networking"></a>Apa itu jaringan virtual Azure?

**Jaringan virtual Azure** memungkinkan sumber daya Azure, seperti komputer virtual, aplikasi web, dan database, untuk berkomunikasi dengan: satu sama lain, pengguna di internet, dan komputer klien lokal. Anda dapat menganggap jaringan Azure sebagai sekumpulan sumber daya yang tersambung ke sumber daya Azure lainnya.

Jaringan virtual Azure menyediakan kapabilitas jaringan utama:

- Isolasi dan segmentasi
- Komunikasi internet
- Berkomunikasi antara sumber daya Azure
- Berkomunikasi dengan sumber daya lokal
- Merutekan lalu lintas jaringan
- Filter lalu lintas jaringan
- Menyambungkan jaringan virtual
 
#### <a name="network-configurations-for-virtual-machines"></a>Konfigurasi jaringan untuk komputer virtual

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE2yEve]

### <a name="isolation-and-segmentation"></a>Isolasi dan segmentasi

Azure memungkinkan Anda membuat beberapa jaringan virtual yang terpisah. Saat Anda menyiapkan jaringan virtual, Anda menentukan ruang alamat Protokol Internet (IP) privat menggunakan rentang alamat IP publik atau privat. Anda kemudian dapat membuat segmen ruang alamat IP tersebut ke dalam subnet, dan mengalokasikan sebagian ruang alamat yang ditentukan untuk setiap subnet yang diberi nama.

Untuk resolusi nama, Anda dapat menggunakan layanan resolusi nama yang disertakan di Azure, atau Anda dapat mengonfigurasi jaringan virtual untuk menggunakan server Sistem Nama Domain (DNS) internal atau eksternal.

### <a name="internet-communications"></a>Komunikasi internet

VM di Azure dapat tersambung ke internet secara default. Anda dapat mengaktifkan koneksi masuk dari internet dengan mendefinisikan alamat IP publik atau penyeimbang muatan publik. Untuk manajemen VM, Anda dapat terhubung melalui Azure CLI, Remote Desktop Protocol (RDP), atau Secure Shell (SSH).

### <a name="communicate-between-azure-resources"></a>Berkomunikasi antar sumber daya Azure

Anda mungkin ingin mengaktifkan sumber daya Azure untuk saling berkomunikasi dengan aman. Anda dapat melakukannya dengan satu dari dua cara ini:

- **Jaringan virtual**

    Jaringan virtual tidak hanya dapat menyambungkan VM, tetapi sumber daya Azure lainnya, seperti Lingkungan App Service, Azure Kubernetes Service, dan set skala komputer virtual Azure.

- **Titik akhir layanan**

     Anda dapat menggunakan titik akhir layanan untuk menyambungkan ke tipe sumber daya Azure lainnya, seperti database Azure SQL dan akun penyimpanan. Pendekatan ini memungkinkan Anda menautkan beberapa sumber daya Azure ke jaringan virtual, sehingga meningkatkan keamanan dan menyediakan perutean yang optimal antar sumber daya.

### <a name="communicate-with-on-premises-resources"></a>Berkomunikasi dengan sumber daya lokal

Jaringan virtual Azure memungkinkan Anda untuk menautkan sumber daya bersama-sama di lingkungan lokal Anda dan dalam langganan Azure Anda, yang pada akhirnya menciptakan jaringan yang mencakup lingkungan lokal dan cloud Anda. Ada tiga mekanisme bagi Anda untuk mencapai konektivitas ini:

- **Virtual Private Network titik-ke-situs**

   Pendekatan ini seperti koneksi Virtual Private Network (VPN) yang dilakukan komputer di luar organisasi Anda kembali ke jaringan perusahaan Anda, kecuali jika bekerja ke arah yang berlawanan. Dalam hal ini, komputer klien memulai koneksi VPN terenkripsi ke Azure, menyambungkan komputer itu ke jaringan virtual Azure.

- **Virtual Private Network Situs-ke-situs** VPN situs ke situs menautkan perangkat VPN atau gateway lokal Anda ke gateway Azure VPN di jaringan virtual. Akibatnya, perangkat di Azure dapat muncul sebagaimana berada di jaringan lokal. Koneksi dienkripsi dan berfungsi melalui internet.

- **Azure ExpressRoute**

    Untuk lingkungan tempat Anda membutuhkan bandwidth yang lebih besar dan tingkat keamanan yang lebih tinggi, Azure ExpressRoute adalah pendekatan terbaik. Azure ExpressRoute menyediakan konektivitas pribadi khusus ke Azure yang tidak melakukan perjalanan melalui internet.

### <a name="route-network-traffic"></a>Merutekan lalu lintas jaringan

Secara default, Azure akan merutekan lalu lintas antara subnet pada jaringan virtual yang terhubung, jaringan lokal, dan internet. Namun, Anda dapat mengontrol perutean dan menimpa pengaturan tersebut sebagai berikut:

- **Tabel rute**

    Tabel rute memungkinkan Anda menentukan aturan tentang cara mengarahkan lalu lintas. Anda dapat membuat tabel rute kustom yang mengontrol cara merutekan paket antar subnet.

- **Border Gateway Protocol**

    Border Gateway Protocol (BGP) dapat digunakan bersama gateway Azure VPN atau ExpressRoute untuk menyebarluaskan rute BGP lokal ke jaringan virtual Azure.

### <a name="filter-network-traffic"></a>Filter lalu lintas jaringan

Jaringan virtual Azure memungkinkan Anda memfilter lalu lintas antar subnet dengan menggunakan pendekatan berikut:

- **Grup keamanan jaringan**

    Grup keamanan jaringan (NSG) adalah sumber daya Azure yang dapat berisi beberapa aturan keamanan masuk dan keluar. Anda dapat menentukan aturan ini untuk mengizinkan atau memblokir lalu lintas, berdasarkan faktor-faktor seperti alamat IP sumber dan tujuan, port, dan protokol.

- **Peranti virtual jaringan**

    Peranti virtual jaringan adalah VM khusus yang dapat dibandingkan dengan peralatan peranti yang mengeras. Peranti virtual jaringan melakukan fungsi jaringan tertentu, seperti menjalankan firewall atau melakukan pengoptimalan WAN.

## <a name="connect-virtual-networks"></a>Menyambungkan jaringan virtual

Anda dapat menautkan jaringan virtual bersama-sama menggunakan _peering_ jaringan virtual. Peering memungkinkan sumber daya di setiap jaringan virtual untuk berkomunikasi satu sama lain. Jaringan virtual ini dapat berada di wilayah terpisah, memungkinkan Anda untuk membuat jaringan global yang saling terhubung melalui Azure.

## <a name="azure-virtual-network-settings"></a>Pengaturan jaringan virtual Azure

Anda dapat membuat dan mengonfigurasi jaringan virtual Azure dari portal Microsoft Azure, Azure PowerShell di komputer lokal Anda, atau Azure Cloud Shell.

### <a name="create-a-virtual-network"></a>Memilih jaringan virtual

Saat Anda membuat jaringan virtual Azure, Anda mengonfigurasi sejumlah pengaturan dasar. Anda akan memiliki opsi untuk mengonfigurasi pengaturan tingkat lanjut, seperti beberapa subnet, perlindungan penolakan layanan terdistribusi (DDoS), dan titik akhir layanan.

![Cuplikan layar portal Microsoft Azure menunjukkan contoh bidang Buat panel jaringan virtual.](../media/2-create-virtual-network.PNG)

Anda akan mengonfigurasi pengaturan berikut untuk jaringan virtual dasar:

- **Nama jaringan**

    Nama jaringan harus unik dalam langganan Anda, tetapi tidak perlu unik secara global. Jadikan nama deskriptif yang mudah diingat dan diidentifikasi dari jaringan virtual lainnya.

- **Ruang alamat**

    Saat menyiapkan jaringan virtual, Anda menentukan ruang alamat internal dalam format Classless Inter-Domain Routing (CIDR). Ruang alamat ini harus unik dalam langganan Anda dan jaringan lain yang Anda sambungkan.

    Anggaplah Anda memilih ruang alamat 10.0.0.0/24 untuk jaringan virtual pertama Anda. Alamat yang ditentukan dalam ruang alamat ini berkisar antara 10.0.0.1 - 10.0.0.254. Anda kemudian membuat jaringan virtual kedua, dan memilih ruang alamat 10.0.0.0/8. Alamat dalam ruang alamat ini berkisar antara 10.0.0.1 - 10.255.255.254. Beberapa alamat tumpang tindih dan tidak dapat digunakan untuk dua jaringan virtual.

    Namun, Anda dapat menggunakan 10.0.0.0/16, dengan alamat mulai dari 10.0.0.1 - 10.0.255.254, dan 10.1.0.0/16, dengan alamat mulai dari 10.1.0.1 - 10.1.255.254. Anda dapat menetapkan ruang alamat ini ke jaringan virtual Anda karena tidak ada tumpang tindih alamat.

    > [!NOTE]
    > Anda dapat menambahkan ruang alamat setelah membuat jaringan virtual.

- **Langganan**

    Hanya berlaku jika Anda memiliki beberapa langganan untuk dipilih.

- **Grup sumber daya**

    Seperti sumber daya Azure lainnya, jaringan virtual harus ada dalam grup sumber daya. Anda dapat memilih grup sumber daya yang sudah ada atau buat yang baru.

- **Lokasi**

    Pilih lokasi tempat jaringan virtual ingin disediakan.

- **Subnet**

    Dalam setiap rentang alamat jaringan virtual, Anda dapat membuat satu atau beberapa subnet yang menyekat ruang alamat jaringan virtual. Perutean antar subnet kemudian akan bergantung pada rute lalu lintas default, atau Anda dapat menentukan rute kustom. Atau, Anda dapat menentukan satu subnet yang mencakup semua rentang alamat jaringan virtual.

    > [!NOTE]
    > Nama subnet harus diawali dengan huruf atau angka, diakhiri dengan huruf, angka, atau garis bawah, dan hanya boleh berisi huruf, angka, garis bawah, titik, atau tanda hubung.

- **Perlindungan Penolakan Layanan Terdistribusi (DDoS)**

    Anda dapat memilih perlindungan DDoS Dasar atau Standar. Perlindungan DDoS standar adalah layanan premium. [Azure DDoS Protection Standard](https://docs.microsoft.com/azure/virtual-network/ddos-protection-overview) menyediakan informasi selengkapnya tentang perlindungan DDoS Standar.

- **Titik Akhir Layanan**

    Di sini, Anda mengaktifkan titik akhir layanan, lalu memilih dari daftar titik akhir layanan Azure yang ingin Anda aktifkan. Pilihan termasuk Azure Cosmos DB, Azure Service Bus, Azure Key Vault, dan sebagainya.

Jika Anda telah mengonfigurasi pengaturan ini, pilih **Buat**.

### <a name="define-additional-settings"></a>Menentukan pengaturan tambahan

Setelah membuat jaringan virtual, Anda kemudian dapat menentukan pengaturan lebih lanjut. Hal termasuk:

- **Grup keamanan jaringan**

    Grup keamanan jaringan memiliki aturan keamanan yang memungkinkan Anda memfilter jenis lalu lintas jaringan yang dapat mengalir masuk dan keluar dari subnet jaringan virtual dan antarmuka jaringan. Anda membuat grup keamanan jaringan secara terpisah, lalu mengaitkannya dengan jaringan virtual.

- **Tabel rute**

    Azure secara otomatis membuat tabel rute untuk setiap subnet dalam jaringan virtual Azure, dan menambahkan rute default sistem ke tabel. Namun, Anda dapat menambahkan tabel rute khusus untuk memodifikasi lalu lintas di antara jaringan virtual.

Anda juga dapat mengubah titik akhir layanan.

![Cuplikan layar portal Microsoft Azure menunjukkan panel contoh untuk mengedit pengaturan jaringan virtual.](../media/2-virtual-network-additional-settings.PNG)

### <a name="configure-virtual-networks"></a>Mengonfigurasi jaringan virtual

Ketika Anda telah membuat jaringan virtual, Anda dapat mengubah pengaturan lebih lanjut dari panel **Virtual Network** di portal Microsoft Azure. Atau, Anda dapat menggunakan perintah atau perintah PowerShell di Cloud Shell untuk membuat perubahan.

![Cuplikan layar portal Microsoft Azure menunjukkan panel contoh untuk mengonfigurasi jaringan virtual.](../media/2-configure-virtual-network.PNG)

Anda kemudian dapat meninjau dan mengubah pengaturan di subpanel lebih lanjut. Pengaturan ini meliputi:

- Ruang alamat: Anda dapat menambahkan ruang alamat lebih lanjut ke definisi awal.

- Perangkat yang tersambung: Gunakan jaringan virtual untuk menyambungkan beberapa komputer.

- Subnet: Tambahkan subnet lebih lanjut.

- Peering: Tautkan jaringan virtual dalam pengaturan peering.

Anda juga dapat memantau dan memecahkan masalah jaringan virtual, atau membuat skrip automasi untuk menghasilkan jaringan virtual saat ini.

Jaringan virtual adalah mekanisme yang kuat dan sangat dapat dikonfigurasi untuk menghubungkan entitas di Azure. Anda dapat menyambungkan sumber daya Azure satu sama lain, atau ke sumber daya yang Anda miliki di tempat. Anda dapat mengisolasi, memfilter, dan merutekan lalu lintas jaringan Anda, dan Azure memungkinkan Anda meningkatkan keamanan di tempat yang Anda rasa membutuhkannya.
