Tailwind Traders memperluas penggunaan layanan Azure. Perusahaan ini masih memiliki beban kerja lokal dengan konfigurasi bisnis dan praktik terbaik terkait keamanan saat ini. Bagaimana perusahaan ini memastikan bahwa semua sistemnya memenuhi tingkat keamanan minimum dan informasinya terlindungi dari serangan?

Banyak layanan Azure menyertakan fitur keamanan bawaan. Alat di Azure juga dapat membantu Tailwind Trader memenuhi persyaratan ini. Mari kita mulai dengan melihat Azure Security Center.

## <a name="whats-azure-security-center"></a>Apa itu Azure Security Center?

[Azure Security Center](https://azure.microsoft.com/services/security-center?azure-portal=true) adalah layanan pemantauan yang menyediakan visibilitas postur keamanan di semua layanan Anda, baik di Azure maupun secara lokal. Istilah _postur keamanan_ mengacu pada kebijakan dan kontrol keamanan siber, serta seberapa baik Anda dapat memprediksi, mencegah, dan menanggapi ancaman keamanan.

Security Center dapat:

* Memantau pengaturan keamanan di seluruh beban kerja lokal dan cloud.
* Secara otomatis merapkan setelan keamanan yang diperlukan pada sumber daya baru saat sedang online.
* Memberikan rekomendasi keamanan yang didasarkan pada konfigurasi, sumber daya, dan jaringan Anda saat ini.
* Terus memantau sumber daya Anda dan melakukan penilaian keamanan otomatis untuk mengidentifikasi potensi kerentanan sebelum kerentanan tersebut dapat dieksploitasi.
* Menggunakan pembelajaran mesin untuk mendeteksi dan memblokir perangkat lunak jahat agar tidak terinstal pada komputer virtual (VM) dan sumber daya lainnya. Anda juga dapat menggunakan _kontrol aplikasi adaptif_ untuk menentukan aturan yang memungkinkan aplikasi memastikan bahwa hanya aplikasi yang Anda izinkan yang dapat dijalankan.
* Mendeteksi dan menganalisis potensi serangan yang masuk dan menyelidiki ancaman serta aktivitas pasca-pelanggaran yang mungkin terjadi.
* Menyediakan kontrol akses just-in-time untuk port jaringan. Dengan melakukannya, permukaan serangan akan berkurang dengan memastikan bahwa jaringan hanya memungkinkan lalu lintas yang Anda butuhkan pada saat yang Anda butuhkan.

Video singkat ini menjelaskan bagaimana Security Center dapat membantu memperketat jaringan Anda, mengamankan dan memantau sumber daya cloud Anda, serta meningkatkan postur keamanan Anda secara keseluruhan.


> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4MBbV]

## <a name="understand-your-security-posture"></a>Memahami postur keamanan Anda

Trader Tailwind dapat menggunakan Security Center untuk mendapatkan analisis mendetail tentang komponen yang berbeda di lingkungannya. Karena sumber daya perusahaan dianalisis terhadap kontrol keamanan dari setiap kebijakan tata kelola yang telah ditetapkannya, Security Center dapat melihat kepatuhan peraturan secara keseluruhan dari perspektif keamanan secara menyeluruh dari satu tempat.

Lihat contoh berikut ini terkait apa yang mungkin Anda lihat di Azure Security Center.

:::image type="content" source="../media/2-security-center-compliance.png" alt-text="Dasbor Azure Security Center menampilkan kepatuhan kebijakan, kebersihan keamanan sumber daya, dan perlindungan dari ancaman.":::

Katakanlah Trader Tailwind harus mematuhi Standar Keamanan Data Industri Kartu Pembayaran (PCI DSS). Laporan ini menunjukkan bahwa perusahaan memiliki sumber daya yang perlu diremediasi.

Di bagian **Kebersihan keamanan sumber daya**, Tailwind Traders dapat melihat kesehatan sumber dayanya dari perspektif keamanan. Untuk membantu memprioritaskan tindakan remediasi, rekomendasi dikategorikan sebagai rendah, sedang, dan tinggi. Berikut adalah contohnya.

:::image type="content" source="../media/2-security-center-dashboard.png" alt-text="Dasbor Azure Security Center yang menampilkan bagian kebersihan keamanan sumber daya. Rekomendasi dikategorikan sebagai rendah, sedang, dan tinggi.":::

### <a name="whats-secure-score"></a>Berapa skor amannya?

[Skor aman](https://docs.microsoft.com/azure/security-center/secure-score-security-controls/?azure-portal=true) adalah pengukuran postur keamanan organisasi.

Skor aman didasarkan pada *kontrol keamanan*, atau grup rekomendasi keamanan terkait. Skor Anda didasarkan pada persentase kontrol keamanan yang Anda penuhi. Semakin banyak kontrol keamanan yang Anda penuhi, semakin tinggi skor yang Anda terima. Skor akan meningkat ketika Anda meremediasi semua rekomendasi untuk satu sumber daya dalam kontrol.

Berikut adalah contoh dari portal Azure yang menunjukkan skor 57 persen, atau 34 dari 60 poin.

:::image type="content" source="../media/2-single-secure-score-via-ui.png" alt-text="Cuplikan layar portal Azure yang menampilkan skor 57 persen, atau 34 dari 60 poin.":::

Mengikuti rekomendasi skor aman dapat membantu melindungi organisasi Anda dari ancaman. Dari dasbor terpusat di Azure Security Center, organisasi dapat memantau dan mengerjakan keamanan sumber daya Azure mereka seperti identitas, data, aplikasi, perangkat, dan infrastruktur.

Skor aman membantu Anda:

* Melaporkan kondisi postur keamanan organisasi Anda saat ini.
* Meningkatkan postur keamanan Anda dengan memberikan kemudahan ditemukan, visibilitas, panduan, dan kontrol.
* Membandingkan dengan tolok ukur dan menetapkan indikator kinerja utama (KPI).

## <a name="protect-against-threats"></a>Melindungi dari ancaman

Security Center mencakup kemampuan pertahanan cloud lanjutan untuk VM, keamanan jaringan, dan integritas file. Mari kita lihat bagaimana beberapa kemampuan tersebut berlaku untuk Tailwind Traders.

* **Akses VM just-in-time**

    Tailwind Traders akan mengonfigurasi akses just-in-time ke VM. Akses ini memblokir lalu lintas secara default ke port jaringan VM tertentu, tetapi memungkinkan lalu lintas untuk waktu yang ditentukan ketika admin meminta dan menyetujuinya.

* **Kontrol aplikasi adaptif**

    Tailwind Trader dapat mengontrol aplikasi mana yang diizinkan untuk berjalan pada VM-nya. Di latar belakang, Security Center menggunakan pembelajaran mesin untuk melihat proses yang berjalan pada VM. Ini menciptakan aturan pengecualian untuk setiap grup sumber daya yang memegang VM dan memberikan rekomendasi. Proses ini memberikan peringatan yang memberi tahu perusahaan tentang aplikasi tidak sah yang berjalan pada VM-nya.

* **Pengetatan jaringan adaptif**

    Security Center dapat memantau pola lalu lintas internet VM, dan membandingkan pola tersebut dengan pengaturan grup keamanan jaringan (NSG) saat ini milik perusahaan. Dari sana, Security Center dapat membuat rekomendasi tentang apakah NSG harus dikunci lebih lanjut dan memberikan langkah-langkah remediasi.

* **Pemantauan integritas file**

    Tailwind Traders juga dapat mengonfigurasi pemantauan perubahan pada file penting pada Windows dan Linux, pengaturan registri, aplikasi, dan aspek lain yang mungkin menunjukkan serangan keamanan.

## <a name="respond-to-security-alerts"></a>Merespons pemberitahuan keamanan

Trader Tailwind dapat menggunakan Security Center untuk mendapatkan tampilan terpusat dari semua peringatan keamanannya. Dari sana, perusahaan dapat menutup peringatan palsu, menyelidikinya lebih lanjut, memulihkan peringatan secara manual, atau menggunakan respons otomatis dengan *otomatisasi alur kerja*.

Otomatisasi alur kerja menggunakan konektor Azure Logic Apps dan Security Center. Aplikasi logika dapat dipicu oleh peringatan deteksi ancaman atau oleh rekomendasi Security Center, yang difilter berdasarkan nama atau tingkat keparahan. Kemudian, Anda dapat mengonfigurasi aplikasi logika untuk menjalankan tindakan, seperti mengirim email, atau memposting pesan ke saluran Microsoft Teams.
