Anda dapat membuat dan mengonfigurasi instans Azure Virtual Network dari portal Microsoft Azure, Azure PowerShell di komputer lokal, atau Azure Cloud Shell.

### <a name="create-a-virtual-network"></a>Membuat jaringan virtual

Saat membuat jaringan virtual Azure, Anda mengonfigurasi sejumlah pengaturan dasar. Anda akan memiliki opsi untuk mengonfigurasi pengaturan tingkat lanjut, seperti beberapa subnet, perlindungan penolakan layanan terdistribusi (DDoS), dan titik akhir layanan.

:::image type="content" source="../media/create-virtual-network.png" alt-text="Cuplikan layar portal Microsoft Azure menunjukkan contoh bidang Buat panel jaringan virtual.":::

Anda akan mengonfigurasi pengaturan berikut untuk jaringan virtual dasar:

- **Nama jaringan**

    Nama jaringan harus unik dalam langganan Anda, tetapi tidak perlu unik secara global. Buat nama deskriptif yang mudah diingat dan diidentifikasi dari jaringan virtual lainnya.

- **Ruang alamat**

    Saat menyiapkan jaringan virtual, Anda menentukan ruang alamat internal dalam format Classless Inter-Domain Routing (CIDR). Ruang alamat ini harus unik dalam langganan Anda dan jaringan lain yang disambungkan.

    Anggaplah Anda memilih ruang alamat 10.0.0.0/24 untuk jaringan virtual pertama. Alamat yang ditentukan dalam ruang alamat ini berkisar antara 10.0.0.1 - 10.0.0.254. Anda kemudian membuat jaringan virtual kedua, dan memilih ruang alamat 10.0.0.0/8. Alamat yang ditentukan dalam ruang alamat ini berkisar antara 10.0.0.1 - 10.255.255.254. Beberapa alamat tumpang tindih dan tidak dapat digunakan untuk dua jaringan virtual.

    Tetapi Anda dapat menggunakan 10.0.0.0/16, dengan alamat yang berkisar antara 10.0.0.1 hingga 10.0.255.254, dan 10.1.0.0/16, dengan alamat yang berkisar antara 10.1.0.1 hingga 10.1.255.254. Anda dapat menetapkan ruang alamat ini ke jaringan virtual Anda karena tidak ada tumpang tindih alamat.

    > [!NOTE]
    > Anda dapat menambahkan ruang alamat setelah membuat jaringan virtual.

- **Langganan**

    Opsi ini hanya berlaku jika Anda memiliki beberapa langganan untuk dipilih.

- **Grup sumber daya**

    Seperti sumber daya Azure lainnya, jaringan virtual harus ada dalam grup sumber daya. Anda dapat memilih grup sumber daya yang sudah ada atau membuat yang baru.

- **Lokasi**

    Pilih lokasi yang Anda inginkan untuk menyediakan jaringan virtual.

- **Subnet**

    Dalam setiap rentang alamat jaringan virtual, Anda dapat membuat satu atau beberapa subnet yang menyekat ruang alamat jaringan virtual. Perutean antar subjaringan kemudian akan bergantung pada rute lalu lintas default. Anda juga dapat menentukan rute kustom. Atau, Anda dapat menentukan satu subnet yang mencakup semua rentang alamat jaringan virtual.

    > [!NOTE]
    > Nama subnet harus dimulai dengan huruf atau angka dan diakhiri dengan huruf, angka, atau garis bawah. Nama hanya boleh berisi huruf, angka, garis bawah, titik, atau tanda hubung.

- **Perlindungan DDoS**

    Anda dapat memilih perlindungan DDoS Dasar atau Standar. Perlindungan DDoS standar adalah layanan premium. Untuk informasi selengkapnya tentang perlindungan Standard DDoS, lihat [gambaran umum perlindungan Azure DDoS Standar](https://docs.microsoft.com/azure/virtual-network/ddos-protection-overview?azure-portal=true).

- **Titik akhir layanan**

    Di sini, Anda mengaktifkan titik akhir layanan. Kemudian, pilih dari daftar untuk titik akhir layanan Azure mana yang ingin Anda aktifkan. Pilihan mencakup Azure Cosmos DB, Azure Service Bus, Azure Key Vault, dan sebagainya.

Jika Anda telah mengonfigurasi pengaturan ini, pilih **Buat**.

### <a name="define-additional-settings"></a>Menentukan pengaturan tambahan

Setelah membuat jaringan virtual, Anda kemudian dapat menentukan pengaturan lebih lanjut. Pengaturan ini mencakup:

- **Grup keamanan jaringan**

    Grup keamanan jaringan memiliki aturan keamanan yang memungkinkan Anda memfilter jenis lalu lintas jaringan yang dapat mengalir masuk dan keluar dari subnet jaringan virtual dan antarmuka jaringan. Anda membuat grup keamanan jaringan secara terpisah. Kemudian mengaitkannya dengan jaringan virtual.

- **Tabel rute**

    Azure secara otomatis membuat tabel rute untuk setiap subnet dalam jaringan virtual Azure, dan menambahkan rute default sistem ke tabel. Anda dapat menambahkan tabel rute kustom untuk memodifikasi lalu lintas di antara jaringan virtual.

Anda juga dapat mengubah titik akhir layanan.

![Cuplikan layar portal Microsoft Azure menunjukkan panel contoh untuk mengedit pengaturan jaringan virtual.](../media/virtual-network-additional-settings.png)

### <a name="configure-virtual-networks"></a>Mengonfigurasi jaringan virtual

Setelah membuat jaringan virtual, Anda dapat mengubah pengaturan lebih lanjut dari panel **Jaringan virtual** di portal Microsoft Azure. Atau, Anda dapat menggunakan perintah PowerShell atau perintah di Cloud Shell untuk melakukan perubahan.

![Cuplikan layar portal Microsoft Azure menunjukkan panel contoh untuk mengonfigurasi jaringan virtual.](../media/configure-virtual-network.png)

Anda kemudian dapat meninjau dan mengubah pengaturan di subpanel lebih lanjut. Pengaturan ini mencakup:

- **Ruang alamat**: Anda dapat menambahkan ruang alamat tambahan ke definisi awal.
- **Perangkat yang tersambung**: Gunakan jaringan virtual untuk menyambungkan komputer.
- **Subnet**: Anda dapat menambahkan subnet tambahan.
- **Peering**: Tautkan jaringan virtual dalam pengaturan peering.

Anda juga dapat memantau dan memecahkan masalah jaringan virtual. Atau, Anda dapat membuat skrip otomatisasi untuk menghasilkan jaringan virtual saat ini.

Jaringan virtual adalah mekanisme yang kuat dan sangat dapat dikonfigurasi untuk menyambungkan entitas di Azure. Anda dapat menyambungkan sumber daya Azure satu sama lain, atau ke sumber daya lokal. Anda dapat mengisolasi, memfilter, dan merutekan lalu lintas jaringan Anda. Azure memungkinkan Anda meningkatkan keamanan di tempat yang menurut Anda diperlukan.
