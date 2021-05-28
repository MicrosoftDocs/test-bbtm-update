SAP HANA on Azure (Large Instances) adalah solusi unik untuk Azure. Selain menyediakan komputer virtual untuk menyebarkan dan menjalankan SAP HANA, Azure menawarkan kemungkinan untuk menjalankan dan menerapkan SAP HANA pada server bare-metal yang didedikasikan untuk Anda. Solusi SAP HANA on Azure (Large Instances) dibangun pada perangkat keras bare-metal host/server privat yang ditetapkan untuk Anda. Perangkat keras server disematkan dalam stamp yang lebih besar yang berisi infrastruktur komputasi/server, jaringan, dan penyimpanan. Sebagai kombinasi, ini adalah integrasi pusat data (TDI) khusus HANA bersertifikat. SAP HANA on Azure (Large Instances) menawarkan SKU atau ukuran server yang berbeda. Unit dapat memiliki 36 core CPU Intel dan memori 768 GB dan hingga unit yang memiliki hingga 480 core CPU Intel dan memori hingga 24 TB.


## <a name="prerequisites-for-deploying-hana-large-instance-units"></a>Prasyarat untuk menyebarkan unit instans besar HANA

Microsoft memerlukan informasi berikut untuk menggunakan unit instans besar HANA:
* Nama pelanggan

* Informasi kontak bisnis (termasuk alamat email dan nomor telepon)

* Informasi kontak teknis (termasuk alamat email dan nomor telepon)

* Informasi kontak jaringan teknis (termasuk alamat email dan nomor telepon)

* Wilayah penyebaran Azure (misalnya, AS Barat, Australia Timur, atau Eropa Utara)

* SKU SAP HANA on Azure (instans besar) (konfigurasi)

Untuk setiap wilayah penyebaran Azure:

* Rentang alamat IP /29 untuk koneksi ER-P2P yang menyambungkan jaringan virtual Azure ke instans besar HANA.

* Blok CIDR /24 yang digunakan untuk kumpulan IP server instans besar HANA.

* Nilai rentang alamat IP yang digunakan dalam atribut ruang alamat jaringan virtual setiap jaringan virtual Azure yang tersambung ke instans besar HANA.

## <a name="required-data-for-each-hana-large-instance"></a>Data yang diperlukan untuk setiap instans besar HANA
Informasi berikut diperlukan untuk menyebarkan unit instans besar HANA: 

* Nama host yang diinginkan, idealnya dengan nama domain yang sepenuhnya memenuhi syarat.

* Alamat IP yang diinginkan untuk unit instans besar HANA dari rentang alamat kumpulan IP Server. (30 alamat IP pertama dalam rentang alamat kumpulan IP server disediakan untuk penggunaan internal dalam instans besar HANA.)

* Nama SAP HANA SID untuk instans SAP HANA (diperlukan untuk membuat volume disk terkait SAP HANA yang diperlukan). Microsoft memerlukan SID HANA untuk membuat izin sidadm pada volume NFS. Volume ini melekat pada unit instans besar HANA. HANA SID juga digunakan sebagai salah satu komponen nama volume disk yang dipasang. Jika Anda ingin menjalankan lebih dari satu instans HANA pada unit, Anda harus mencantumkan beberapa SID HANA. Masing-masing mendapatkan satu set volume terpisah yang ditetapkan.

* Di OS Linux, pengguna sidadm memiliki ID grup. ID ini diperlukan untuk membuat volume disk terkait SAP HANA yang diperlukan. Instalasi SAP HANA biasanya membuat grup sapsys, dengan ID grup 1001. Pengguna sidadm adalah bagian dari grup tersebut.

* Di OS Linux, pengguna sidadm memiliki ID pengguna. ID ini diperlukan untuk membuat volume disk terkait SAP HANA yang diperlukan. Jika Anda menjalankan beberapa instans HANA pada unit, mencantumkan semua pengguna sidadm.

* ID langganan Azure untuk langganan Azure di mana SAP HANA pada Azure HANA instans besar akan tersambung langsung. ID langganan ini mereferensikan langganan Azure, yang akan dikenakan biaya dengan unit atau unit instans besar HANA.

Setelah Anda memberikan informasi sebelumnya, Microsoft mengirimi Anda informasi untuk menautkan jaringan virtual Azure Anda ke instans besar HANA. Anda juga dapat mengakses unit instans besar HANA.

Gunakan urutan berikut untuk tersambung ke instans besar HANA setelah Microsoft menyebarkannya:

1. Menyambungkan VNet ke instans besar HANA ExpressRoute

2. Sambungkan Azure VM ke instans besar HANA

3. Terapkan persyaratan jaringan tambahan (opsional)
