Salah satu solusi yang dapat digunakan untuk kurangnya server fisik Tailwind Traders adalah melalui penggunaan komputer virtual (VM).

:::row:::
  :::column span="3":::

Dengan Azure Virtual Machines, Anda dapat membuat dan menggunakan VM di cloud. VM menyediakan infrastructure as a service (IaaS) dalam bentuk komputer virtual dan dapat digunakan dalam banyak hal. Sama seperti komputer fisik, Anda dapat menyesuaikan semua perangkat lunak yang berjalan di VM. VM adalah pilihan ideal saat Anda membutuhkan:

- Total kontrol atas sistem operasi (OS).
- Kemampuan untuk menjalankan perangkat lunak kustom.
- Untuk menggunakan konfigurasi hosting kustom.

Azure VM memberi Anda fleksibilitas virtualisasi tanpa harus membeli dan memelihara perangkat keras fisik yang menjalankan VM. Anda masih perlu mengonfigurasi, memperbarui, dan memelihara perangkat lunak yang berjalan di VM.

  :::column-end:::
  :::column:::
    :::image type="icon" source="../media/azure-vms.png" border="false":::
  :::column-end:::
:::row-end:::

Anda bisa membuat dan menyediakan VM dalam hitungan menit saat Anda memilih citra VM yang telah dikonfigurasi sebelumnya. Memilih citra merupakan salah satu keputusan terpenting yang akan Anda buat saat membuat VM. Gambar merupakan templat yang digunakan untuk membuat VM. Templat ini sudah mencakup OS dan seringkali perangkat lunak lain, seperti alat pengembangan atau lingkungan hosting web.

### <a name="examples-of-when-to-use-vms"></a>Contoh tentang kapan menggunakan VM

- **Selama pengujian dan pengembangan.** VM menyediakan cara cepat dan mudah untuk membuat OS dan konfigurasi aplikasi yang berbeda. Personel uji dan pengembangan selanjutnya dapat dengan mudah menghapus VM ketika mereka tidak lagi membutuhkannya.
- **Saat menjalankan aplikasi di cloud.** Kemampuan untuk menjalankan aplikasi tertentu di cloud publik dibandingkan dengan menciptakan infrastruktur tradisional untuk menjalankannya bisa memberikan manfaat ekonomi yang besar. Misalnya, aplikasi mungkin perlu menangani fluktuasi permintaan. Mematikan VM saat Anda tidak membutuhkannya atau dengan cepat memulainya untuk memenuhi peningkatan permintaan secara tiba-tiba berarti Anda hanya membayar sumber daya yang Anda gunakan.
- **Saat memperluas pusat data Anda ke cloud.** Organisasi dapat memperluas kemampuan jaringan lokalnya sendiri dengan membuat jaringan virtual di Azure dan menambahkan VM ke jaringan virtual tersebut. Aplikasi seperti SharePoint selanjutnya dapat berjalan pada Azure VM, alih-alih berjalan secara lokal. Penataan ini membuatnya lebih mudah atau lebih murah untuk digunakan daripada di lingkungan lokal.
- **Selama pemulihan bencana.** Seperti halnya menjalankan jenis aplikasi tertentu di cloud dan memperluas jaringan lokal ke cloud, Anda bisa mendapatkan penghematan biaya yang signifikan dengan menggunakan pendekatan berbasis IaaS untuk pemulihan bencana. Jika pusat data utama gagal, Anda dapat membuat VM yang berjalan di Azure guna menjalankan aplikasi penting Anda lalu mematikannya saat pusat data utama beroperasi lagi.

## <a name="move-to-the-cloud-with-vms"></a>Pindah ke cloud dengan VM

VM juga menjadi pilihan yang sangat baik ketika Anda berpindah dari server fisik ke cloud (juga dikenal sebagai lift dan shift). Anda dapat membuat gambar server fisik dan menghostingnya dalam VM dengan sedikit atau bahkan tanpa perubahan. Sama seperti server fisik lokal, Anda harus mempertahankan VM. Anda memperbarui OS yang diinstal dan perangkat lunak yang digunakan.

## <a name="scale-vms-in-azure"></a>Menskalakan VM di Azure

Anda dapat menjalankan VM tunggal untuk pengujian, pengembangan, atau tugas-tugas kecil. Atau Anda dapat mengelompokkan VM bersama-sama untuk memberikan ketersediaan tinggi, skalabilitas, dan redundansi. Apa pun persyaratan uptime Anda, Azure memiliki beberapa fitur yang dapat memenuhinya. Fitur ini mencakup:

- Rangkaian skala komputer virtual
- Azure Batch

[//]: # (CATATAN: SUDAH DIHAPUS YANG BERIKUT INI)
[//]: # (- Kumpulan ketersediaan)
[//]: # (### Apa itu set ketersediaan?)
[//]: # (**Set ketersediaan** adalah pengelompokan logis dari dua VM atau lebih yang membantu menjaga aplikasi Anda tetap tersedia selama pemeliharaan yang direncanakan atau tidak direncanakan.)
[//]: # (- Sebuah _planned maintenance event_ adalah ketika fabric Azure dasar yang menghosting VM diperbarui oleh Microsoft. Peristiwa pemeliharaan yang direncanakan dilakukan untuk mempatching kerentanan keamanan, meningkatkan performa, dan menambahkan atau memperbarui fitur. Sebagian besar waktu pembaruan ini dilakukan tanpa dampak apa pun terhadap VM tamu. Tetapi kadang-kadang VM membutuhkan reboot untuk menyelesaikan pembaruan. Ketika VM menjadi bagian dari set ketersediaan, pembaruan fabric Azure diurutkan sehingga tidak semua VM terkait di-boot ulang secara bersamaan. VM dimasukkan ke dalam _update domains_ yang berbeda. Domain pembaruan menunjukkan grup VM dan perangkat keras fisik yang mendasarinya yang dapat di-boot ulang secara bersamaan. Domain pembaruan adalah bagian logis dari setiap pusat data dan diimplementasikan dengan perangkat lunak dan logika.)
[//]: # (- _Unplanned maintenance events_ melibatkan kegagalan perangkat keras di pusat data, seperti pemadaman listrik atau kegagalan disk. VM yang merupakan bagian dari kumpulan ketersediaan secara otomatis beralih ke server fisik yang berfungsi sehingga VM akan tetap berjalan. Kelompok komputer virtual yang menggunakan perangkat keras umum yang sama berada dalam kondisi yang _fault domain_ yang sama. Domain kesalahan pada dasarnya adalah rak server. Domain ini memberikan pemisahan fisik beban kerja Anda di berbagai daya, pendinginan, dan perangkat keras jaringan yang mendukung server fisik di rak server pusat data. Jika perangkat keras yang mendukung rak server menjadi tidak tersedia, hanya rak server tersebut yang terpengaruh oleh pemadaman.)
[//]: # (Dengan kumpulan ketersediaan, Anda mendapatkan:)
[//]: # (- Hingga tiga domain kesalahan yang masing-masing memiliki rak server dengan daya dan sumber daya jaringan khusus)
[//]: # (- Lima domain pembaruan logis yang kemudian dapat ditingkatkan menjadi maksimum 20)
[//]: # (VM Anda selanjutnya ditempatkan secara berurutan di seluruh domain kesalahan dan pembaruan. Diagram berikut memperlihatkan contoh di mana Anda memiliki enam VM dalam dua set ketersediaan yang didistribusikan di dua domain kesalahan dan lima domain pembaruan.)
[//]: # (:::image type="complex" source="../media/availability-sets.png" alt-text="Diagram memperlihatkan ketersediaan set domain pembaruan dan kesalahan yang diduplikasi di seluruh server.":::)
[//]: # (Dua kerangka mengelilingi domain kesalahan 1 dan domain kesalahan 2. Domain kesalahan 1 berisi rak dengan komputer virtual 1 di dalam domain pembaruan 1, komputer virtual 3 di dalam domain pembaruan 3, dan komputer virtual 5 di dalam domain pembaruan 5. Domain kesalahan 2 berisi rak dengan komputer virtual 2 di dalam domain pembaruan 2, komputer virtual 4 di dalam pembaruan domain 4, dan komputer virtual 6 sebagai bagian dari pembaruan domain 1. Komputer virtual 1 dari domain kesalahan 1 dan komputer virtual 2 dari domain kesalahan 2 adalah bagian dari set ketersediaan. Komputer virtual 3 dan 5 dari domain kesalahan 1 dan komputer virtual 4 dan 6 dari domain kesalahan 2 adalah bagian dari set ketersediaan terpisah.)
[//]: # (:::image-end:::)
[//]: # (Tidak ada biaya untuk ketersediaan yang ditetapkan. Anda hanya membayar VM dalam ketersediaan yang ditetapkan. Kami sangat menyarankan agar Anda menempatkan setiap beban kerja dalam ketersediaan yang ditetapkan untuk menghindari kegagalan dalam arsitektur VM Anda.)

### <a name="what-are-virtual-machine-scale-sets"></a>Apa itu kumpulan skala komputer virtual?

Kumpulan skala komputer virtual memungkinkan Anda membuat dan mengelola sekelompok VM yang identik dengan beban seimbang. Bayangkan Anda menjalankan situs web yang memungkinkan para ilmuwan untuk mengunggah gambar astronomi yang perlu diproses. Jika Anda menduplikasi VM, Anda biasanya perlu mengonfigurasi layanan tambahan untuk merutekan permintaan di antara beberapa instans situs web. Set skala komputer virtual bisa melakukan pekerjaan itu untuk Anda.

Set skala memungkinkan Anda mengelola, mengonfigurasi, dan memperbarui banyak VM dalam hitungan menit untuk menyediakan aplikasi yang sangat tersedia. Jumlah instans VM dapat secara otomatis bertambah atau berkurang sebagai respons terhadap permintaan atau jadwal yang ditentukan. Dengan set skala komputer virtual, Anda dapat membangun layanan berskala besar untuk area seperti komputasi, big data, dan beban kerja kontainer.

### <a name="what-is-azure-batch"></a>Apa itu Azure Batch?

Azure Batch memungkinkan pekerjaan massal komputasi paralel dan berperforma tinggi (HPC) skala besar dengan kemampuan untuk menskalakan hingga puluhan, ratusan, atau ribuan VM.

Setelah Anda siap untuk menjalankan pekerjaan, Batch melakukan hal berikut:

- Memulai kumpulan VM komputasi untuk Anda.
- Menginstal aplikasi dan staging data.
- Menjalankan pekerjaan dengan tugas sebanyak yang Anda miliki.
- Mengidentifikasi kegagalan.
- Mengantrekan pekerjaan.
- Menurunkan skala kumpulan saat pekerjaan selesai.

Mungkin ada situasi di mana Anda membutuhkan daya komputasi mentah atau daya komputasi tingkat superkomputer. Azure menyediakan kemampuan ini.
