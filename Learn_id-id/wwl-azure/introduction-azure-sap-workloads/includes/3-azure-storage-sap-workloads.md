Azure memiliki banyak jenis penyimpanan yang sangat berbeda dalam kemampuan, throughput, latensi, dan harga. Beberapa jenis penyimpanan sangat cocok atau dioptimalkan untuk skenario beban kerja SAP tertentu sementara yang lain tidak begitu. Beberapa jenis penyimpanan Azure mendapat sertifikasi untuk penggunaan dengan SAP HANA. Dalam dokumen ini, kami akan meninjau berbagai jenis penyimpanan dan menggambarkan kemampuan dan kegunaannya dengan beban kerja SAP dan komponen SAP.

Vendor cloud publik kini menggunakan GiB ([Gibibbita](https://en.wikipedia.org/wiki/Gibibyte)) atau TiB ([Tebibita](https://en.wikipedia.org/wiki/Tebibyte)) sebagai unit ukuran, bukan Gigabita atau Terabita. Semua dokumentasi dan harga Azure menggunakan unit tersebut. Di seluruh dokumen ini, kami mereferensikan unit ukuran unit MiB, GiB, dan TiB ini secara eksklusif. Jika Anda perlu merencanakan MB, GB, dan TB, perhatikan beberapa perbedaan kecil dalam perhitungan.

## <a name="microsoft-azure-storage-resiliency"></a>Ketahanan Microsoft Azure Storage

Penyimpanan Microsoft Azure mempertahankan disk data atau VHD yang terpasang pada VHD (dengan OS) dan VM dalam tiga salinan pada tiga node penyimpanan yang berbeda. Ini berlaku sama untuk HDD Standar, SSD Standar, penyimpanan premium Azure, dan disk Ultra. Ketika ada kegagalan node penyimpanan, sistem secara transparan melakukan failover ke replika lain, dan membuat replika baru. Karena redundansi ini, Anda tidak perlu menggunakan lapisan redundansi penyimpanan apa pun di beberapa disk Azure. Pendekatan ini disebut Local Redundant Storage (LRS). LRS adalah default untuk jenis penyimpanan ini di Azure. [Azure NetApp Files](https://azure.microsoft.com/services/netapp/) menyediakan redundansi yang cukup untuk mencapai SLA yang sama dengan penyimpanan Azure asli lainnya.

## <a name="azure-managed-disks"></a>Disk terkelola Azure

Disk terkelola adalah jenis sumber daya di Azure Resource Manager. Disk ini dapat digunakan sebagai ganti VHD yang disimpan di Akun Azure Storage. Disk Terkelola secara otomatis selaras dengan set ketersediaan komputer virtual yang dilampirkan. Disk ini meningkatkan ketersediaan komputer virtual Anda dan layanan yang berjalan di komputer virtual. 

Terkait dengan ketahanan, contoh ini menunjukkan keuntungan dari disk terkelola:

- Anda menerapkan dua VM DBMS untuk sistem SAP Anda dalam set ketersediaan Azure
- Saat Azure menerapkan VM, disk dengan gambar OS akan ditempatkan di kluster penyimpanan yang berbeda. Pendekatan ini menghindari kedua VM dipengaruhi oleh masalah dengan satu kluster penyimpanan Azure.
- Saat Anda membuat disk terkelola baru, dan menetapkannya ke VM untuk menyimpan data dan file log database Anda, Azure juga menyebarkan disk baru di kluster penyimpanan terpisah. Disk VM pertama tidak akan membagikan kluster penyimpanan dengan disk VM kedua.

Saat menyebarkan tanpa disk terkelola di akun penyimpanan yang ditentukan pelanggan, alokasi disk diatur sesuai keinginan. Disk tidak memiliki pemahaman tentang fakta bahwa VM disebarkan dalam AvSet untuk tujuan ketahanan.

> [!NOTE] 
> Penerapan baru VM yang menggunakan penyimpanan blok Azure untuk disk mereka (semua penyimpanan Azure kecuali Azure NetApp Files) harus menggunakan disk yang dikelola Azure untuk disk VHD/OS dasar, disk data yang berisi file database SAP, terlepas dari apakah Anda menggunakan VM melalui set ketersediaan, di seluruh Availability Zone, atau terlepas dari set dan zona. Disk yang digunakan untuk tujuan menyimpan cadangan tidak selalu harus berupa disk terkelola. Disk yang dikelola Azure hanya menyediakan redundansi lokal (LRS).

## <a name="storage-scenarios-with-sap-workloads"></a>Skenario penyimpanan dengan beban kerja SAP

Penyimpanan tetap diperlukan dalam beban kerja SAP di berbagai komponen tumpukan yang Anda sebarkan di Azure. Skenario ini meliputi:

- Penyimpanan tetap untuk VHD dasar VM Anda yang menjalankan sistem operasi dan perangkat lunak lain yang Anda pasang di disk tersebut. Disk/VHD ini adalah akar dari VM Anda. Setiap perubahan yang Anda buat harus permanen. Ini memastikan bahwa saat Anda menghentikan dan memulai ulang VM di masa mendatang, semua perubahan yang Anda buat sebelumnya masih ada. Kemampuan ini sangat penting ketika VM sedang disebarkan ke host yang berbeda dari tempatnya dijalankan di awal.
- Disk data permanen. Disk ini adalah VHD yang Anda sematkan untuk menyimpan data aplikasi. Data aplikasi ini dapat berupa data dan file log/redo dari database, file cadangan, atau penginstalan perangkat lunak. Ini juga digunakan untuk disk apa pun selain VHD dasar Anda yang menjalankan sistem operasi.
- Berbagi file atau disk bersama yang berisi direktori transportasi global Anda untuk NetWeaver atau S/4HANA. Konten pembagian tersebut digunakan oleh perangkat lunak yang berjalan di beberapa VM, atau digunakan untuk membangun skenario kluster failover ketersediaan tinggi.
- Direktori /sapmnt atau pembagian file umum untuk proses EDI atau sejenisnya. Konten saham tersebut digunakan oleh perangkat lunak yang berjalan di beberapa VM atau digunakan untuk membangun skenario kluster failover dengan ketersediaan tinggi.

## <a name="azure-premium-storage"></a>Penyimpanan premium Azure

Penyimpanan SSD premium Azure menyediakan:

- Latensi I/O rendah
- SLA untuk IOPS dan throughput
- Lebih sedikit variabilitas dalam latensi I/O

Penyimpanan premium Azure adalah salah satu jenis penyimpanan Azure yang direkomendasikan untuk beban kerja SAP dalam sistem nonproduksi dan produksi. Penyimpanan premium Azure cocok untuk menangani beban kerja database. Penggunaan Azure Write Accelerator akan meningkatkan latensi penulisan terhadap disk premium Azure secara substansial. Namun, untuk sistem DBMS dengan IOPS tinggi dan tingkat throughput, Anda harus menyediakan kapasitas penyimpanan berlebih, atau menggunakan fungsionalitas seperti Windows Storage Spaces atau manajer volume logis di Linux. Ini memungkinkan Anda untuk membangun set stripe yang memberikan kapasitas yang Anda inginkan di satu sisi, tetapi juga IOPS atau throughput yang diperlukan pada efisiensi biaya terbaik.

### <a name="azure-burst-functionality-for-premium-storage"></a>Fungsionalitas burst Azure untuk penyimpanan premium

Fungsi burst ditawarkan untuk disk penyimpanan premium Azure 512 GiB atau kurang dalam kapasitas. Kasus-kasus ideal di mana fungsi burst ini dapat direncanakan kemungkinan adalah volume atau disk yang berisi file data untuk DBMS yang berbeda. Beban kerja I/O yang diharapkan terhadap volume tersebut, terutama dengan sistem kecil hingga menengah diharapkan mirip dengan:

- Beban kerja baca rendah hingga sedang, karena data idealnya di-cache dalam memori, atau ketika HANA harus benar-benar dalam memori
- Burst tulisan yang dipicu oleh titik pemeriksaan atau titik simpan database yang diterbitkan secara teratur
- Beban kerja cadangan yang membaca dalam aliran berkelanjutan jika pencadangan tidak dieksekusi melalui snapshot penyimpanan
- Untuk SAP HANA, muat data ke dalam memori setelah mulai ulang instans

Fungsi burst juga dapat digunakan untuk disk atau volume yang menyimpan transaksi atau log redo. Ini berlaku terutama pada sistem DBMS yang lebih kecil saat beban kerja Anda menangani beberapa ratus transaksi per detik saja. Beban kerja yang diharapkan terhadap disk atau volume tersebut mirip dengan:

- Tulisan reguler ke disk yang bergantung pada sifat beban kerja karena setiap penerapan yang diterbitkan oleh aplikasi kemungkinan akan memicu operasi I/O
- Beban kerja yang lebih tinggi dalam throughput untuk kasus tugas operasional, seperti membuat atau membangun ulang indeks
- Baca burst saat melakukan log transaksi atau mengulangi pencadangan log

## <a name="azure-ultra-disk"></a>Disk Azure Ultra

Disk database adalah penyimpanan dengan latensi rendah yang cocok untuk semua jenis beban kerja SAP. Sejauh ini, disk Ultra hanya dapat digunakan dalam kombinasi dengan VM yang telah digunakan melalui Availability Zone (penerapan zona). Disk Ultra tidak mendukung snapshot penyimpanan saat ini. Tidak seperti penyimpanan lain, disk Ultra tidak dapat digunakan untuk disk VHD dasar. Disk Ultra sangat ideal untuk kasus saat beban kerja I/O sangat fluktuatif. Ini memungkinkan Anda untuk menyesuaikan throughput penyimpanan yang disebarkan atau IOPS ke pola beban kerja penyimpanan, alih-alih ukuran untuk penggunaan bandwidth dan IOPS maksimum.

## <a name="azure-netapp-files-anf"></a>Azure NetApp files (ANF)

Azure NetApp Files adalah penyimpanan latensi rendah bersertifikat HANA yang memungkinkan penerapan volume atau pembagian NFS dan SMB. Penyimpanannya dilengkapi dengan tiga tingkat layanan yang berbeda. Ini memberikan throughput dan IOPS yang berbeda secara linier, sesuai kapasitas GiB volume. Penyimpanan ANF memungkinkan penerapan skenario penambahan SAP HANA dengan node siaga. Penyimpanan ini cocok untuk menyediakan pembagian file sesuai kebutuhan untuk /sapmnt atau direktori transportasi global SAP. Penyimpanan ANF dilengkapi dengan ketersediaan fungsionalitas yang tersedia sebagai fungsionalitas NetApp asli.

## <a name="azure-standard-ssd-storage"></a>Penyimpanan SSD standar Azure

Penyimpanan SSD standar Azure adalah rekomendasi minimum untuk VM nonproduksi untuk VHD dasar, dan penerapan DBMS akhir dengan kekebalan latensi relatif dan/atau tingkat IOPS dan throughput yang rendah. Jenis penyimpanan Azure ini tidak lagi didukung untuk menghosting Direktori Transportasi Global SAP.

## <a name="azure-standard-hdd-storage"></a>Penyimpanan HDD standar Azure

HDD standar adalah jenis penyimpanan Azure yang seharusnya hanya digunakan untuk menyimpan cadangan SAP. Ini hanya cocok sebagai VHD dasar untuk sistem yang cenderung tidak aktif, seperti sistem yang tidak digunakan lagi yang digunakan untuk mencari data di berbagai tempat. Tetapi, pengembangan aktif, QA, atau VM produksi tidak boleh didasarkan pada penyimpanan tersebut. File database juga tidak boleh dihosting di penyimpanan tersebut

## <a name="azure-vm-limits-in-storage-traffic"></a>Batas Azure VM dalam lalu lintas penyimpanan

Jenis VM individual yang Anda pilih berperan penting dalam bandwidth penyimpanan yang dapat Anda capai. Sesuai batasan, Anda dapat memahami bahwa:

- Semakin kecil VM, semakin sedikit disk yang dapat Anda pasang. Batas ini tidak berlaku untuk ANF. Karena memasang pembagian NFS atau SMB, Anda tidak memenuhi batas jumlah volume bersama yang akan dilampirkan
- VM memiliki batas throughput I/O dan IOPS yang dapat dilampaui secara mu8dah dengan disk penyimpanan premium dan disk Ultra
- Dengan ANF, lalu lintas ke volume bersama menggunakan bandwidth jaringan VM dan bukan bandwidth penyimpanan
- Dengan volume NFS besar di ruang kapasitas TiB dua digit, throughput yang mengakses volume seperti itu dari satu VM akan meningkat berdasarkan batas Linux untuk satu sesi yang berinteraksi dengan volume bersama.

Saat meningkatkan Azure VM dalam siklus hidup sistem SAP, Anda harus mengevaluasi batas throughput IOPS dan penyimpanan dari jenis VM baru dan lebih besar. Dalam beberapa kasus, Anda juga dapat menyesuaikan konfigurasi penyimpanan dengan kemampuan baru Azure VM.

## <a name="striping-or-not-striping"></a>Striping atau non-striping

Membuat stripe yang ditetapkan dari beberapa disk Azure ke dalam satu volume yang lebih besar memungkinkan Anda untuk mengakumulasi IOPS dan throughput masing-masing disk ke dalam satu volume. Ini hanya digunakan untuk penyimpanan standar Azure dan penyimpanan premium Azure. Disk Azure Ultra tempat Anda dapat mengonfigurasi throughput dan IOPS yang terlepas dari kapasitas disk tidak memerlukan penggunaan set stripe. Volume bersama berdasarkan NFS atau SMB tidak dapat di-stripe. Throughput penyimpanan premium Azure dan IOPS bersifat non-linear. Karena itu, Anda dapat menyediakan kapasitas yang lebih kecil dengan IOPS dan throughput yang sama dari yang dapat dilakukan dengan disk penyimpanan premium Azure tunggal yang besar. Metode ini mencapai throughput atau IOPS yang lebih tinggi dengan biaya lebih rendah dengan menggunakan penyimpanan premium Azure. Contohnya:

- Striping di dua disk penyimpanan premium P15 menghasilkan throughput
- 250 MiB/detik. Volume tersebut akan memiliki kapasitas 512-GiB. Untuk satu disk yang memberi Anda throughput 250-MiB/detik, Anda memerlukan disk P40 dengan kapasitas 2-TiB.
- Atau, Anda dapat mencapai throughput 400 MiB/detik dengan melakukan strip pada empat disk penyimpanan premium P10, dengan kapasitas keseluruhan 512 GiB. Untuk satu disk dengan throughput minimum 500-MiB/detik, Anda memerlukan disk penyimpanan premium P60 dengan 8 TiB. Karena biaya atau penyimpanan premium hampir linier dengan kapasitas, Anda dapat merasakan penghematan biaya dengan menggunakan striping.

Ada beberapa aturan yang harus Anda ikuti pada striping:

- Penyimpanan yang dikonfigurasi dalam VM tidak boleh digunakan karena penyimpanan Azure sudah mempertahankan redundansi data
- Disk yang diterapkan pada set stripe harus memiliki ukuran yang sama

Striping di beberapa disk yang lebih kecil adalah cara terbaik untuk mencapai rasio harga/performa yang baik menggunakan penyimpanan premium Azure. Striping memiliki beberapa penyebaran ekstra dan overhead manajemen.