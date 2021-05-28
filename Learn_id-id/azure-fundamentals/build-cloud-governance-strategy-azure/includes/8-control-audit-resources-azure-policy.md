Sekarang setelah Anda mengidentifikasi tata kelola dan persyaratan bisnis, bagaimana Anda memastikan bahwa sumber daya Anda _tetap_ sesuai? Bagaimana Anda dapat diperingatkan jika konfigurasi sumber daya telah berubah? 

[Azure Policy](https://azure.microsoft.com/services/azure-policy?azure-portal=true) adalah layanan di Azure yang memungkinkan Anda membuat, menetapkan, dan mengelola kebijakan yang mengontrol atau mengaudit sumber daya Anda. Kebijakan ini menerapkan aturan dan efek yang berbeda atas konfigurasi sumber daya Anda sehingga konfigurasi tersebut tetap mematuhi standar perusahaan.

## <a name="how-does-azure-policy-define-policies"></a>Bagaimana Azure Policy mendefinisikan kebijakan?

Azure Policy memungkinkan Anda untuk menentukan kebijakan individu dan kelompok kebijakan terkait, yang dikenal sebagai _inisiatif_. Azure Policy mengevaluasi sumber daya dan menyoroti sumber daya yang tidak mematuhi kebijakan yang telah Anda buat. Azure Policy juga dapat mencegah sumber daya yang tidak patuh dibuat.

Azure Policy dilengkapi dengan sejumlah definisi kebijakan dan inisiatif bawaan yang dapat Anda gunakan, di bawah kategori seperti Penyimpanan, Jaringan, Komputasi, Azure Security Center, dan Pemantauan.

Misalnya, Anda mendefinisikan kebijakan yang hanya memungkinkan ukuran komputer virtual (VM) unit penyimpanan stok (SKU) tertentu yang akan digunakan di lingkungan Anda. Setelah Anda mengaktifkan kebijakan ini, kebijakan tersebut diterapkan saat Anda membuat komputer virtual baru atau mengubah ukuran yang sudah ada. Azure Policy juga mengevaluasi VM apa pun saat ini di lingkungan Anda.

Dalam beberapa kasus, Azure Policy dapat secara otomatis memulihkan sumber daya dan konfigurasi yang tidak sesuai untuk memastikan integritas status sumber daya. Misalnya, jika semua sumber daya dalam grup sumber daya tertentu harus diberi tag dengan tag **NamaAplikasi** dan nilai "SpecialOrders", Azure Policy dapat secara otomatis menerapkan kembali tag tersebut jika telah dihapus.

Azure Policy juga terintegrasi dengan Azure DevOps dengan menerapkan kebijakan integrasi berkelanjutan dan jalur pipa pengiriman yang berlaku untuk fase pra-penerapan dan pasca-penyebaran aplikasi Anda.

## <a name="azure-policy-in-action"></a>Azure Policy sedang beraksi

Menerapkan kebijakan dalam Azure Policy melibatkan tiga langkah berikut:

1. Buat definisi kebijakan.
1. Tetapkan definisi ke sumber daya.
1. Tinjau hasil evaluasi.

Mari kita periksa setiap langkah secara lebih rinci.

### <a name="1-create-a-policy-definition"></a>1. Buat definisi kebijakan

Definisi kebijakan mengungkapkan apa yang harus dievaluasi dan tindakan apa yang harus diambil. Misalnya, Anda dapat mencegah VM disebarkan di wilayah Azure tertentu. Anda juga dapat mengaudit akun penyimpanan Anda untuk memverifikasi bahwa mereka hanya menerima koneksi dari jaringan yang diizinkan.

Setiap definisi kebijakan memiliki kondisi di mana itu diberlakukan. Definisi kebijakan juga memiliki efek menyertai yang terjadi ketika kondisi terpenuhi. Berikut adalah beberapa contoh definisi kebijakan:

* **SKU komputer virtual yang diizinkan**

    Kebijakan ini memungkinkan Anda menentukan sekumpulan SKU VM yang dapat digunakan organisasi Anda.

* **Lokasi yang diizinkan**

    Kebijakan ini memungkinkan Anda membatasi lokasi yang dapat ditentukan organisasi Anda saat menggunakan sumber daya. Efeknya digunakan untuk menegakkan persyaratan kepatuhan geografis Anda.

* **MFA harus diaktifkan pada akun dengan izin menulis di langganan Anda**

    Kebijakan ini mengharuskan autentikasi multifaktor (MFA) diaktifkan untuk semua akun langganan dengan hak menulis untuk mencegah pelanggaran akun atau sumber daya.

* **CORS seharusnya tidak mengizinkan setiap sumber daya mengakses aplikasi web Anda**

    Berbagi sumber daya lintas asal (CORS) adalah fitur HTTP yang memungkinkan aplikasi web berjalan di bawah satu domain untuk mengakses sumber daya di domain lain. Untuk alasan keamanan, browser web modern membatasi skrip lintas situs secara default. Kebijakan ini hanya memungkinkan domain yang diperlukan untuk berinteraksi dengan aplikasi web Anda.

* **Pembaruan sistem harus dipasang di komputer Anda**

    Kebijakan ini memungkinkan Azure Security Center Azure merekomendasikan pembaruan sistem keamanan yang hilang di server Anda.

### <a name="2-assign-the-definition-to-resources"></a>2. Tetapkan definisi ke sumber daya

Untuk menerapkan definisi kebijakan, Anda menetapkan definisi ke sumber daya. _Penetapan kebijakan_ adalah definisi kebijakan yang terjadi dalam cakupan tertentu. Lingkup ini bisa menjadi grup manajemen (kumpulan beberapa langganan), satu langganan, atau grup sumber daya.

Penetapan kebijakan diwariskan oleh semua sumber daya anak dalam lingkup tersebut. Jika kebijakan diterapkan ke grup sumber daya, kebijakan tersebut diterapkan ke semua sumber daya dalam grup sumber daya tersebut. Anda dapat mengecualikan subskop dari penetapan kebijakan jika ada sumber daya anak tertentu yang perlu Anda keluarkan dari penetapan kebijakan.

### <a name="3-review-the-evaluation-results"></a>3. Tinjau hasil evaluasi

Saat kondisi dievaluasi terhadap sumber daya yang ada, setiap sumber daya ditandai sebagai patuh atau tidak patuh. Anda dapat meninjau hasil kebijakan yang tidak patuh dan mengambil tindakan apa pun yang diperlukan.

Evaluasi kebijakan terjadi sekitar sekali per jam. Jika Anda membuat perubahan pada definisi kebijakan dan membuat penetapan kebijakan, kebijakan tersebut akan dievaluasi melalui sumber daya Anda dalam waktu satu jam.

## <a name="what-are-azure-policy-initiatives"></a>Apa itu inisiatif Azure Policy?

Inisiatif Azure Policy adalah cara mengelompokkan kebijakan terkait ke dalam satu set. Definisi inisiatif berisi semua definisi kebijakan untuk membantu melacak status kepatuhan Anda untuk tujuan yang lebih besar.

Misalnya, Azure Policy menyertakan inisiatif bernama **Aktifkan Pemantauan di Azure Security Center Azure**. Tujuannya adalah untuk memantau semua rekomendasi keamanan yang tersedia untuk semua jenis sumber daya Azure di Azure Security Center.

Berdasarkan inisiatif ini, definisi kebijakan berikut disertakan:

* **Pantau Microsoft Azure SQL Database tak terenkripsi di Azure Security Center**

    Kebijakan ini memantau database dan server SQL yang tidak terenkripsi.
* **Pantau kerentanan OS di Azure Security Center**

    Kebijakan ini memantau server yang tidak memenuhi garis besar kerentanan OS yang dikonfigurasi.
* **Pantau Perlindungan Endpoint yang hilang di Azure Security Center**

    Kebijakan ini memantau server yang tidak memiliki agen perlindungan titik akhir yang terinstal.

Faktanya, inisiatif **Aktifkan Pemantauan di Azure Security Center Azure** berisi lebih dari 100 definisi kebijakan terpisah.

Azure Policy juga mencakup inisiatif yang mendukung standar kepatuhan terhadap peraturan seperti HIPAA dan ISO 27001.

### <a name="how-do-i-define-an-initiative"></a>Bagaimana cara mendefinisikan inisiatif?

Anda mendefinisikan inisiatif dengan menggunakan portal Microsoft Azure atau dengan menggunakan alat baris perintah. Dari portal Microsoft Azure, Anda dapat mencari daftar inisiatif bawaan yang sudah disediakan oleh Azure. Anda juga dapat membuat definisi kebijakan kustom Anda sendiri.

Gambar berikut ini memperlihatkan beberapa contoh inisiatif Azure Policy di portal Microsoft Azure.

:::image type="content" source="../media/3-define-initiatives.png" alt-text="Cuplikan layar yang memperlihatkan portal Microsoft Azure yang mendefinisikan inisiatif dan definisi.":::

### <a name="how-do-i-assign-an-initiative"></a>Bagaimana cara menetapkan inisiatif?

Seperti penetapan kebijakan, penetapan inisiatif adalah definisi inisiatif yang ditetapkan ke lingkup tertentu dari grup manajemen, langganan, atau grup sumber daya.

Bahkan jika Anda hanya memiliki satu kebijakan, inisiatif memungkinkan Anda untuk meningkatkan jumlah kebijakan dari waktu ke waktu. Karena inisiatif terkait tetap ditetapkan, lebih mudah untuk menambahkan dan menghapus kebijakan tanpa perlu mengubah penetapan kebijakan untuk sumber daya Anda.
