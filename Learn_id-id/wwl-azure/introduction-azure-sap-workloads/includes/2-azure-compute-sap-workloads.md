

Azure VM membentuk infrastruktur utama sebagai penawaran layanan komputasi layanan (IaaS) yang tersedia di Azure. Azure VM memberikan tingkat kontrol terbesar atas konfigurasi dan sistem operasi komputer virtual. Pengguna dapat mengonfigurasi sistem operasi VM secara manual (atau secara otomatis) dengan menggunakan Ekstensi Komputer Virtual (Ekstensi VM). Ekstensi VM mengandalkan teknologi seperti skrip Windows PowerShell, Desired State Configuration (DSC), Chef, atau Puppet.


Sebagian besar karakteristik Azure VM hampir sama dengan komputer virtual Microsoft Hyper V yang disebarkan pelanggan di pusat data lokal mereka. Namun, keduanya memiliki perbedaan penting.

Azure VM yang disediakan untuk pengguna tersedia dalam ukuran tertentu. Pengguna tidak dapat menentukan jumlah sumber daya pemrosesan, memori, atau penyimpanan sesuai keinginan saat menggunakan Azure VM. Sebaliknya, mereka harus memilih salah satu pilihan yang telah ditentukan. Pembatasan ini tidak memberlakukan batasan yang signifikan karena Microsoft menawarkan berbagai ukuran komputer virtual. Ukuran dikelompokkan ke dalam beberapa kategori, termasuk kategori berikut: 

* **Tujuan umum** (termasuk ukuran B, Dsv3, Dv3, DSv2, Dv2, Av2, dan DC) yang memberikan rasio CPU-ke-memori yang seimbang. Ideal untuk pengujian dan pengembangan, database kecil hingga menengah, dan server web lalu lintas rendah hingga menengah.

* **Komputasi dioptimalkan** (termasuk ukuran Fsv2) yang memberikan rasio CPU-ke-memori yang tinggi. Cocok untuk server web lalu lintas sedang, peralatan jaringan, proses batch, dan server aplikasi.

* **Memori yang dioptimalkan** (termasuk esv3, Ev3, M, GS, G, DSv2, ukuran Dv2) memberikan rasio memori-ke-CPU yang tinggi. Sangat cocok untuk server database relasional, cache sedang hingga besar, dan analitik dalam memori.

* **Penyimpanan dioptimalkan** (termasuk ukuran Lsv2 dan Ls) yang menyediakan throughput disk tinggi dan IO. Ideal untuk database Big Data, SQL, NoSQL, pergudangan data, dan database transaksi besar.

* **GPU** (termasuk ukuran NV, NVv2, NC, NCv2, NCv3, ND, dan NDv2) menyediakan komputer virtual khusus yang ditargetkan untuk rendering grafis berat, pengeditan video, pelatihan model, dan inferensi (ND) dengan deep learning. Tersedia dengan satu, atau beberapa GPU.

* **Komputasi berperforma tinggi** (termasuk ukuran H) menyediakan CPU Azure VM tercepat dan terkuat dengan antarmuka jaringan throughput tinggi opsional (RDMA).

Setiap ukuran VM individual merepresentasikan kombinasi karakteristik kapasitas berikut:

* **Jumlah vCPU**    

* **Jumlah memori**

* **Jumlah maksimum disk data**

* **Throughput jaringan dan penyimpanan maksimum**    

Disk virtual yang menghosting sistem operasi Azure VM memiliki batas ukuran 2 terabita (TB). Disk virtual lain yang disematkan pengguna ke Azure VM memiliki batas ukuran 32 TB (64 TB untuk disk Ultra SSD). Perhatikan bahwa batas ini tidak menyiratkan batasan pada ukuran volume data. Pengguna dapat membuat volume multi-disk dengan menggunakan Storage Spaces di Windows Server atau manajer volume, seperti Logical Volume Manager (LVM) di Linux. Mengingat ukuran Azure VM terbesar mendukung hingga 64 disk data, fleksibilitas ini memungkinkan pengguna untuk membuat volume ukuran petabita (PB). Ukuran volume maksimum bergantung pada ukuran komputer virtual, begitu pula jumlah maksimum disk yang dapat disematkan ke komputer virtual.

Terdapat pula batas pada operasi throughput dan input/output per detik (IOPS) yang didukung masing-masing disk. Dengan penyimpanan HDD Standar, pengguna dapat mengharapkan sekitar 60 megabita per detik (MBps) atau 500 8 kilobita (KB) IOPS. Dengan penyimpanan Azure Premium SSD, performa bergantung pada ukuran disk. Disk 32 TB mendukung hingga 900 MBps dan 20.000 IOPS 256-KB. Penyimpanan Ultra SSD dalam berbagai ukuran menawarkan 2.000 MBps dan 160.000 IOPS per disk.

## <a name="azure-vms-for-sap"></a>Azure VM for SAP
Secara umum, ada tiga opsi saat menerapkan produk SAP di Azure:

* **Azure VM**: Semakin banyak SKU Azure VM yang disertifikasi untuk menghosting SAP HANA. Ini termasuk GS5 dan banyak ukuran VM keluarga M. M208ms_v2 menyediakan 5.7 TiB memori, dan M128s mendukung konfigurasi penambahan. Pilihan SKU Azure VM yang jauh lebih besar mendukung beban kerja non-HANA (produk NetWeaver dan non-NetWeaver).

* **SAP HANA di Azure (Large Instances)**: Ada banyak SKU yang berkisar antara 2 TiB per node (S192 dengan dukungan penambahan) hingga 20 TiB per node (S960m). Dua kelas perangkat keras yang berbeda membagi SKU menjadi:

    * S72, S72m, S96, S144, S144m, S192, S192m, dan S192xm. Disebut sebagai SKU "Kelas Jenis I".

    * S384, S384m, S384xm, S384xxm, S576m, S576xm S768m, S768xm, dan S960m. Disebut sebagai SKU "kelas Jenis II".

* **SAP Cloud Appliance Library (CAL)**: SAP CAL menawarkan peralatan perangkat lunak yang telah dikonfigurasi sebelumnya di berbagai cloud publik, termasuk Azure. SAP CAL menyediakan cara mudah untuk menyebarkan dan menguji solusi SAP yang telah dikonfigurasi sebelumnya yang ditawarkan oleh SAP tanpa harus menyediakan infrastruktur yang mendasarinya. SAP CAL di Azure menyertakan dukungan untuk SAP S/4HANA atau BW/4HANA. 