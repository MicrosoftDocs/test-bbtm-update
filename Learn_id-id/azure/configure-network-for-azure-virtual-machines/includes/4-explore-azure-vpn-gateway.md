Untuk mengintegrasikan lingkungan lokal Anda dengan Azure, Anda memerlukan kemampuan untuk membuat koneksi terenkripsi. Anda dapat tersambung melalui internet, atau melalui tautan khusus. Di sini, kita akan melihat Azure VPN Gateway yang menyediakan titik akhir untuk koneksi masuk dari lingkungan lokal.

Anda telah menyiapkan jaringan virtual Azure dan perlu memastikan bahwa setiap transfer data dari Azure ke situs Anda dan antara jaringan virtual Azure dienkripsi. Anda juga perlu mengetahui cara menyambungkan jaringan virtual antar wilayah dan langganan.

## <a name="what-is-a-vpn-gateway"></a>Apa itu VPN Gateway?

Gateway jaringan virtual Azure menyediakan titik akhir untuk koneksi masuk dari lokasi lokal ke Azure melalui Internet. Gateway VPN adalah jenis gateway jaringan virtual tertentu yang bisa menjadi titik akhir untuk koneksi terenkripsi. Ini juga dapat mengirim lalu lintas terenkripsi antara jaringan virtual Azure melalui jaringan khusus Microsoft yang menghubungkan pusat data Azure di berbagai wilayah. Konfigurasi ini memungkinkan Anda untuk menautkan komputer dan layanan virtual di berbagai wilayah dengan aman.

Setiap jaringan virtual hanya dapat memiliki satu gateway VPN. Semua koneksi ke gateway VPN membagikan bandwidth jaringan yang tersedia.

Dalam setiap gateway jaringan virtual ada dua atau lebih komputer virtual (VM). VM ini telah digunakan ke subnet khusus yang Anda tentukan yang disebut _subnet gateway_. Mereka berisi tabel perutean untuk koneksi ke jaringan lain, bersama layanan gateway tertentu. VM dan subnet gateway ini mirip dengan perangkat jaringan yang diperkuat. Anda tidak perlu mengonfigurasi VM ini secara langsung, dan seharusnya tidak menggunakan sumber daya tambahan apa pun ke dalam subnet gateway.

Membuat gateway jaringan virtual dapat membutuhkan waktu, jadi sangat penting bagi Anda untuk merencanakan dengan tepat. Saat Anda membuat gateway jaringan virtual, proses penyediaan menghasilkan VM gateway dan menyebarkannya ke subnet gateway. VM ini akan memiliki pengaturan yang Anda konfigurasi di gateway.

Pengaturan kuncinya adalah **_jenis gateway_**. Jenis gateway menentukan cara gateway berfungsi. Untuk gateway VPN, jenis gateway-nya adalah "vpn". Opsi untuk gateway VPN meliputi:

- Koneksi jaringan-ke-jaringan melalui terowongan VPN IPsec/IKE, yang menyambungkan gateway VPN ke gateway VPN lainnya.

- Terowongan VPN IPsec/IKE lintas tempat, untuk menyambungkan jaringan lokal ke Azure melalui perangkat VPN khusus untuk membuat koneksi situs ke situs.

- Koneksi dari titik ke situs melalui IKEv2 atau SSTP, untuk menautkan komputer klien ke sumber daya di Azure.

Sekarang, mari kita lihat faktor-faktor yang perlu Anda pertimbangkan untuk merencanakan gateway VPN Anda.

## <a name="plan-a-vpn-gateway"></a>Merencanakan gateway VPN

Saat Anda merencanakan gateway VPN, ada tiga arsitektur yang perlu dipertimbangkan:

- Titik ke situs melalui internet
- Situs ke situs melalui internet
- Situs ke situs melalui jaringan khusus, seperti Azure ExpressRoute

### <a name="planning-factors"></a>Faktor perencanaan

Faktor-faktor yang perlu Anda atasi selama proses perencanaan Anda meliputi:

- Throughput - Mbps atau Gbps
- Backbone - Internet atau pribadi?
- Ketersediaan alamat IP publik (statis)
- Kompatibilitas perangkat VPN
- Beberapa koneksi klien atau tautan situs ke situs?
- Jenis gateway VPN
- SKU Azure VPN Gateway

Tabel berikut ini merangkum beberapa masalah perencanaan ini. Sisanya dijelaskan kemudian.

|                           |  Titik ke situs            | Situs ke situs                          |  ExpressRoute                 |
| -------------             | -------------             | -------------                         | ---------                     |
| Layanan yang didukung Azure  | Layanan cloud dan VM    | Layanan cloud dan VM                | Semua layanan yang didukung        |
| Bandwidth umum         | Bergantung pada [SKU VPN Gateway](https://docs.microsoft.com/azure/vpn-gateway/vpn-gateway-about-vpngateways#gwsku)    | Bergantung pada [SKU VPN Gateway](https://docs.microsoft.com/azure/vpn-gateway/vpn-gateway-about-vpngateways#gwsku)       | Lihat [Opsi bandwidth ExpressRoute](https://docs.microsoft.com/azure/expressroute/expressroute-introduction#bandwidth-options)       |
| Protokol yang didukung       | SSTP dan IPsec            | IPsec                                 | Koneksi langsung, VLAN      |
| Perutean                   | RouteBased (dinamis)      | PolicyBased (statis) dan RouteBased   | BGP                           |
| Ketahanan koneksi     | Aktif-pasif            | Aktif-pasif atau aktif-aktif       | Mode aktif-aktif                 |
| Gunakan huruf besar                  | Pengujian dan prototipe   | Dev, tes, dan produksi skala kecil  | Perusahaan/misi penting   |

### <a name="gateway-skus"></a>SKU Gateway

Anda harus memilih SKU yang tepat. Jika Anda telah mengatur gateway VPN Anda dengan yang salah, Anda harus menghentikannya, dan membangun kembali gateway yang dapat membutuhkan waktu. Untuk informasi terbaru tentang SKU gateway, termasuk throughput, lihat [Apa itu VPN Gateway? - Gateway SKU](https://docs.microsoft.com/azure/vpn-gateway/vpn-gateway-about-vpngateways#gwsku).

## <a name="workflow"></a>Alur kerja

Saat merancang strategi konektivitas cloud menggunakan jaringan pribadi virtual di Azure, Anda harus menerapkan alur kerja berikut:

1. Merancang topologi konektivitas Anda, membuat daftar ruang alamat untuk semua jaringan penghubung.

1. Membuat Azure Virtual Network.

1. Membuat gateway VPN untuk jaringan virtual.

1. Membuat dan mengonfigurasi koneksi ke jaringan lokal atau jaringan virtual lainnya, saat diperlukan.

1. Jika diperlukan, membuat dan mengonfigurasi koneksi titik-ke-situs untuk gateway Azure VPN Anda.

### <a name="design-considerations"></a>Mempertimbangkan rancangan

Saat merancang gateway VPN untuk menyambungkan jaringan virtual, Anda harus mempertimbangkan faktor-faktor berikut:

- Subnet tidak dapat tumpang tindih

    Subnet di satu lokasi tidak boleh berisi ruang alamat yang sama seperti di lokasi lain.

- Alamat aplikasi harus unik

    Anda tidak dapat memiliki dua host dengan alamat IP yang sama di lokasi yang berbeda karena tidak mungkin merutekan lalu lintas antara kedua host tersebut dan koneksi jaringan ke jaringan akan gagal.

- Gateway VPN memerlukan subnet gateway yang disebut **GatewaySubnet**

    Ini harus memiliki nama ini agar gateway berfungsi, dan seharusnya tidak berisi sumber daya lain.

### <a name="create-an-azure-virtual-network"></a>Membuat Azure Virtual Network

Sebelum Anda membuat gateway VPN, Anda perlu membuat jaringan virtual Azure.

### <a name="create-a-vpn-gateway"></a>Membuat gateway VPN

Jenis gateway VPN yang Anda buat akan bergantung pada arsitektur Anda. Opsinya adalah:

- RouteBased

    Perangkat VPN berbasis rute menggunakan pemilih lalu lintas (wildcard) apa pun, dan memungkinkan tabel perutean/penerusan mengarahkan lalu lintas ke terowongan IPsec yang berbeda. Koneksi berbasis rute biasanya dibangun pada platform router di mana setiap terowongan IPsec dimodelkan sebagai antarmuka jaringan atau antarmuka terowongan virtual (VTI).

- PolicyBased

    Perangkat VPN berbasis kebijakan menggunakan kombinasi prefiks dari kedua jaringan untuk menentukan cara lalu lintas dienkripsi/didekripsi melalui terowongan IPsec. Koneksi berbasis kebijakan biasanya dibangun pada perangkat firewall yang melakukan filter paket. Enkripsi dan dekripsi terowongan IPsec ditambahkan ke komputer filter dan pemrosesan paket.

## <a name="set-up-a-vpn-gateway"></a>Menyiapkan gateway VPN

Langkah-langkah yang perlu Anda ambil akan bergantung pada jenis gateway VPN yang Anda pasang. Misalnya, untuk membuat gateway VPN titik-ke-situs dengan menggunakan portal Microsoft Azure, Anda akan melakukan langkah-langkah berikut:

1. Pilih jaringan virtual.

2. Tambahkan subnet gateway.

3. Tentukan server DNS (opsional).

4. Buat gateway jaringan virtual.

5. Hasilkan sertifikat.

6. Tambahkan kumpulan alamat klien.

7. Konfigurasi jenis terowongan.

8. Konfigurasi jenis autentikasi.

9. Unggah data sertifikat publik sertifikat akar.

10. Pasang sertifikat klien yang diekspor.

11. Hasilkan dan pasang paket konfigurasi klien VPN.

12. Sambungkan ke Azure.

Karena ada beberapa jalur konfigurasi dengan gateway Azure VPN, masing-masing dengan beberapa opsi, tidak mungkin untuk mencakup setiap penyiapan dalam kursus ini. Untuk informasi selengkapnya, lihat bagian Sumber Daya Tambahan.

## <a name="configure-the-gateway"></a>Mengonfigurasi gateway

Setelah gateway dibuat, Anda harus mengonfigurasinya. Ada beberapa pengaturan konfigurasi yang perlu Anda sediakan, seperti nama, lokasi, server DNS, dan sebagainya. Kita akan mempelajari ini secara lebih terperinci dalam latihan.

Gateway Azure VPN adalah komponen dalam jaringan virtual Azure yang memungkinkan koneksi titik-ke-situs, situs-ke-situs, atau jaringan-ke-jaringan. Gateway Azure VPN memungkinkan komputer klien individual untuk menyambungkan ke sumber daya di Azure, memperluas jaringan lokal ke Azure, atau memfasilitasi koneksi antara jaringan virtual di berbagai wilayah dan langganan.
