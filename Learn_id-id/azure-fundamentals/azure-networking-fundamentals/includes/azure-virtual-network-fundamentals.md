Tailwind Traders memiliki pusat data lokal yang ingin Anda simpan, tetapi Anda ingin menggunakan Azure untuk membongkar lalu lintas puncak menggunakan komputer virtual (VM) yang dihosting di Azure. Anda ingin menyimpan skema alamat IP dan appliance jaringan yang ada, sembari memastikan bahwa transfer data apa pun bersifat aman.

Menggunakan Azure Virtual Network untuk jaringan virtual dapat membantu Anda mencapai tujuan.

## <a name="what-is-azure-virtual-networking"></a>Apa itu jaringan virtual Azure?

*Jaringan virtual Azure* memungkinkan sumber daya Azure, seperti VM, aplikasi web, dan database, untuk berkomunikasi satu sama lain, dengan pengguna di internet, dan dengan komputer klien lokal. Anda dapat menganggap jaringan Azure sebagai serangkaian sumber daya yang tersambung ke sumber daya Azure lainnya.

Jaringan virtual Azure menyediakan kapabilitas jaringan utama:

- Isolasi dan segmentasi
- Komunikasi internet
- Berkomunikasi antara sumber daya Azure
- Berkomunikasi dengan sumber daya lokal
- Merutekan lalu lintas jaringan
- Memflter lalu lintas jaringan
- Menyambungkan jaringan virtual
 
#### <a name="network-configurations-for-virtual-machines"></a>Konfigurasi jaringan untuk komputer virtual

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE2yEve]

### <a name="isolation-and-segmentation"></a>Isolasi dan segmentasi

Virtual Network memungkinkan Anda membuat beberapa jaringan virtual yang terisolasi. Saat menyiapkan jaringan virtual, Anda menentukan ruang alamat IP privat menggunakan rentang alamat IP publik atau privat. Anda kemudian dapat membuat segmen ruang alamat IP tersebut ke dalam subnet, dan mengalokasikan sebagian ruang alamat yang ditentukan untuk setiap subnet yang diberi nama.

Untuk resolusi nama, Anda dapat menggunakan layanan resolusi nama yang disertakan di Azure. Anda juga dapat mengonfigurasi jaringan virtual untuk menggunakan server DNS internal atau eksternal.

### <a name="internet-communications"></a>Komunikasi internet

VM di Azure dapat tersambung ke internet secara default. Anda dapat mengaktifkan koneksi masuk dari internet dengan mendefinisikan alamat IP publik atau penyeimbang beban publik. Untuk manajemen VM, Anda dapat terhubung melalui Azure CLI, Remote Desktop Protocol, atau Secure Shell.

### <a name="communicate-between-azure-resources"></a>Berkomunikasi antar sumber daya Azure

Anda mungkin ingin mengaktifkan sumber daya Azure untuk saling berkomunikasi dengan aman. Anda dapat melakukannya dengan satu dari dua cara ini:

- **Jaringan virtual**

    Jaringan virtual tidak hanya dapat menyambungkan VM, tetapi sumber daya Azure lainnya, seperti Lingkungan App Service untuk Power Apps, Azure Kubernetes Service, dan set skala komputer virtual Azure.

- **Titik akhir layanan**

    Anda dapat menggunakan titik akhir layanan untuk menyambungkan ke tipe sumber daya Azure lainnya, seperti database Azure SQL dan akun penyimpanan. Pendekatan ini memungkinkan Anda menautkan beberapa sumber daya Azure ke jaringan virtual, sehingga meningkatkan keamanan dan menyediakan perutean yang optimal antar sumber daya.

### <a name="communicate-with-on-premises-resources"></a>Berkomunikasi dengan sumber daya lokal

Jaringan virtual Azure memungkinkan Anda untuk menautkan sumber daya bersama di lingkungan lokal dan di dalam langganan Azure. Efeknya, Anda dapat membuat jaringan yang mencakup lingkungan lokal dan cloud Anda. Ada tiga mekanisme bagi Anda untuk mencapai konektivitas ini:

- **VPN titik-ke-situs**

    Pendekatan khas untuk koneksi VPN berasal dari komputer di luar organisasi Anda, kembali ke jaringan perusahaan Anda. Dalam hal ini, komputer klien memulai koneksi VPN terenkripsi ke Azure, menyambungkan komputer itu ke jaringan virtual Azure.
    
- **VPN situs-ke-situs**

    VPN Situs-ke-situs menautkan perangkat VPN atau gateway lokal Anda ke gateway Azure VPN di jaringan virtual. Akibatnya, perangkat di Azure dapat muncul sebagai berada di jaringan lokal. Koneksi dienkripsi dan berfungsi melalui internet.

- **Azure ExpressRoute**

    Untuk lingkungan tempat Anda membutuhkan bandwidth yang lebih besar dan tingkat keamanan yang lebih tinggi, Azure ExpressRoute adalah pendekatan terbaik. Azure ExpressRoute menyediakan konektivitas pribadi khusus ke Azure yang tidak bergerak melintasi internet. (Anda akan mempelajari lebih lanjut tentang ExpressRoute di unit terpisah nanti dalam modul ini.)

### <a name="route-network-traffic"></a>Merutekan lalu lintas jaringan

Secara default, Azure akan merutekan lalu lintas antara subnet pada jaringan virtual yang terhubung, jaringan lokal, dan internet. Anda juga dapat mengontrol perutean dan menimpa pengaturan tersebut sebagai berikut:

- **Tabel rute**

    Tabel rute memungkinkan Anda menentukan aturan tentang cara mengarahkan lalu lintas. Anda dapat membuat tabel rute kustom yang mengontrol cara merutekan paket antar subnet.

- **Border Gateway Protocol**

    Border Gateway Protocol (BGP) dapat digunakan bersama gateway Azure VPN atau ExpressRoute untuk menyebarluaskan rute BGP lokal ke jaringan virtual Azure.

### <a name="filter-network-traffic"></a>Memflter lalu lintas jaringan

Jaringan virtual Azure memungkinkan Anda memfilter lalu lintas antar subnet dengan menggunakan pendekatan berikut:

- **Grup keamanan jaringan**

    Grup keamanan jaringan adalah sumber daya Azure yang dapat berisi beberapa aturan keamanan masuk dan keluar. Anda dapat menentukan aturan ini untuk mengizinkan atau memblokir lalu lintas, berdasarkan faktor-faktor seperti alamat IP sumber dan tujuan, port, dan protokol.

- **Appliance virtual jaringan**

    Appliance virtual jaringan adalah VM khusus yang dapat dibandingkan dengan appliance jaringan yang mengeras. Appliance virtual jaringan menjalankan fungsi jaringan tertentu, seperti menjalankan firewall atau melakukan pengoptimalan WAN.

## <a name="connect-virtual-networks"></a>Menyambungkan jaringan virtual

Anda dapat menautkan jaringan virtual bersama menggunakan _peering_ jaringan virtual. Peering memungkinkan sumber daya di setiap jaringan virtual untuk berkomunikasi satu sama lain. Jaringan virtual ini dapat berada di wilayah terpisah, memungkinkan Anda untuk membuat jaringan global yang saling terhubung melalui Azure.

UDR adalah Perutean yang ditentukan pengguna. UDR adalah pembaruan signifikan untuk Virtual Network Azure karena ini memungkinkan admin jaringan untuk mengontrol tabel perutean antara subnet dalam VNet, serta antara VNet, sehingga memungkinkan kontrol yang lebih besar atas arus lalu lintas jaringan.

[![Ilustrasi gateway lokal atau jarak jauh di jaringan virtual yang di-peer.](../media/local-or-remote-gateway-in-peered-virual-network.png)](../media/local-or-remote-gateway-in-peered-virual-network-expanded.png#lightbox)
