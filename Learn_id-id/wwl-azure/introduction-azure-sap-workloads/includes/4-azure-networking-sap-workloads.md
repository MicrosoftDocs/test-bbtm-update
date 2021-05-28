Jaringan virtual Azure menyediakan konektivitas berbasis IP langsung dan privat antar sumber daya yang terpasang pada jaringan, seperti Azure VM. Anda memiliki opsi untuk menghubungkan jaringan virtual yang berbeda bersama-sama jika Anda bermaksud menyediakan konektivitas IP privat langsung di antara mereka. Anda juga dapat menyambungkan jaringan virtual ke jaringan lokal Anda, secara efektif menjadikan Azure sebagai ekstensi dari pusat data Anda sendiri.

Jaringan virtual Azure mendukung Transmission Control Protocol (TCP), User Datagram Protocol (UDP), dan Internet Control Message Protocol (ICMP). Pada saat penulisan kursus ini, tidak ada dukungan untuk paket siaran, multicast, enkapsulasi IP-in-IP, dan paket Generic Route Encapsulation (GRE).

Jaringan virtual biasanya berisi satu atau beberapa subnet. Subnet memfasilitasi segmentasi jaringan, menyediakan sarana untuk mengontrol komunikasi antar sumber daya jaringan. Setiap subnet berisi berbagai alamat IP yang merupakan subnet ruang alamat jaringan virtual. 

VM menggunakan adaptor jaringan virtual untuk menyematkan ke subnet guna berkomunikasi dengan VM lain dan sumber daya jaringan lainnya, seperti penyeimbang muatan atau gateway. VM dapat memiliki lebih dari satu adaptor jaringan, biasanya untuk memfasilitasi skenario isolasi jaringan. Jumlah maksimum adaptor jaringan yang dapat Anda sematkan ke VM bergantung pada ukurannya.

## <a name="azure-virtual-network-connectivity"></a>Konektivitas Azure Virtual Network
Anda dapat membangun konektivitas langsung ke jaringan virtual Azure dari komputer fisik atau komputer virtual yang tidak dihosting di Azure dengan menggunakan salah satu metode berikut:

* **VPN point-to-site**, yang menghubungkan komputer individu ke jaringan virtual Azure melalui terowongan Secure Socket Tunneling Protocol (SSTP) atau OpenVPN melalui internet.

* **VPN situs ke situs**, yang menghubungkan jaringan lokal ke jaringan virtual Azure melalui terowongan IPsec melalui internet. 

* **Azure ExpressRoute**, yang menghubungkan jaringan lokal melalui koneksi privat. ExpressRoute memberikan performa yang lebih dapat diprediksi, dengan bandwidth yang lebih tinggi dan latensi yang lebih rendah daripada koneksi VPN. ExpressRoute menawarkan throughput per sirkuit hingga 10 gigabita per detik (Gbps), dengan throughput per gateway hingga 9000 megabita per detik (Mbps). Kemampuan ini membuat ExpressRoute lebih dipilih untuk beban kerja perusahaan dan misi penting. ExpressRoute juga mungkin layak dipertimbangkan saat menerapkan wilayah Azure sebagai situs pemulihan bencana atau sebagai tujuan pencadangan untuk sistem lokal. 

* **Azure Virtual WAN**, yang menyediakan konektivitas cabang ke cabang yang optimal dan otomatis melalui Azure. Virtual WAN memungkinkan Anda menghubungkan dan mengonfigurasikan perangkat cabang untuk berkomunikasi dengan Azure. Konektivitas dan konfigurasi dapat dilakukan secara manual oleh pelanggan atau disederhanakan dengan menggunakan perangkat penyedia pilihan melalui mitra Virtual WAN. Menggunakan perangkat penyedia pilihan memungkinkan kemudahan penggunaan, penyederhanaan konektivitas, dan manajemen konfigurasi.

Untuk membangun konektivitas langsung dari jaringan virtual Azure lainnya, Anda dapat menggunakan salah satu metode berikut: 

* **VNet Peering** menghubungkan jaringan virtual Azure dalam wilayah Azure yang sama atau antar wilayah Azure. Lalu lintas antar alur jaringan virtual secara langsung melalui jaringan backbone Azure, tanpa enkripsi IPSec.

* **VNet-to-VNet** menghubungkan jaringan virtual Azure di wilayah Azure yang sama atau di wilayah Azure yang berbeda melalui sepasang gateway virtual yang mengenkripsi lalu lintas jaringan. Menggunakan VNet-ke-VNet seperti VPN situs ke situs. Namun, dalam hal ini, lalu lintas antar wilayah tidak melintasi internet tetapi dialihkan melalui jaringan backbone Azure.



**Keamanan jaringan**: 

Untuk sistem produksi SAP yang dipasang di Azure, Anda harus beroperasi di Virtual Private Networks yang terhubung ke pusat data Anda dengan konektivitas situs ke situs Azure atau ExpressRoute. Akses pengguna akhir ke aplikasi harus dirutekan melalui intranet perusahaan Anda dan koneksi situs ke situs Azure atau ExpressRoute ke aplikasi yang dihosting di Azure Virtual Machine Services. Dengan cara ini, jaringan dan kebijakan keamanan lainnya yang ditentukan untuk aplikasi lokal diperluas ke aplikasi di Azure Virtual Machines.


**Keandalan jaringan**:

* Anda harus menggunakan koneksi kualitas yang baik (latensi rendah, bandwidth yang cukup, tanpa kehilangan paket) antara pusat data dan Azure mereka. Anda juga harus memverifikasi dan memantau bahwa bandwidth antara lokal dan Azure cukup untuk menangani beban kerja komunikasi.

