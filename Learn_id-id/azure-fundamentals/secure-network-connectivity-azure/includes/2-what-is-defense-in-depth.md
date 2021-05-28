Tailwind Traders saat ini menjalankan beban kerjanya secara lokal, di pusat datanya. Menjalankan secara lokal berarti bahwa perusahaan bertanggung jawab atas semua aspek keamanan, dari akses fisik ke bangunan hingga bagaimana data masuk dan keluar dari jaringan. Perusahaan ingin tahu bagaimana strategi pertahanan mendalam saat ini dibandingkan dengan berjalan di cloud.

Tujuan *pertahanan mendalam* adalah untuk melindungi informasi dan mencegahnya dicuri oleh mereka yang tidak diotorisasi untuk mengaksesnya.

Strategi pertahanan mendalam menggunakan serangkaian mekanisme untuk memperlambat kemajuan serangan yang bertujuan memperoleh akses yang tidak diotorisasi ke data.

## <a name="layers-of-defense-in-depth"></a>Lapisan pertahanan mendalam

Anda dapat memvisualisasikan pertahanan mendalam sebagai sekumpulan lapisan, dengan data yang akan diamankan di tengah.

:::image type="content" source="../media/2-defense-depth.png" alt-text="Diagram yang memperlihatkan setiap lapisan pertahanan mendalam. Dari tengah, lapisan ini adalah: data, aplikasi, komputasi, jaringan, perimeter, identitas dan akses, serta keamanan fisik." border="false":::

Setiap lapisan memberikan perlindungan sehingga jika satu lapisan dilanggar, lapisan berikutnya siap mencegah paparan lebih lanjut. Pendekatan ini menghapus ketergantungan pada setiap lapisan perlindungan tunggal. Hal ini memperlambat serangan dan menyediakan telemetri pemberitahuan yang dapat ditindaklanjuti oleh tim keamanan, baik secara otomatis atau manual.

Berikut adalah ringkasan singkat tentang peran setiap lapisan:

+ Lapisan *keamanan fisik* adalah garis pertahanan pertama untuk melindungi perangkat keras komputasi di pusat data.
+ Lapisan *identitas dan akses* mengontrol akses ke infrastruktur dan kontrol perubahan.
+ Lapisan *perimeter* menggunakan perlindungan penolakan layanan terdistribusi (DDoS) untuk memfilter serangan skala besar sebelum serangan dapat menyebabkan penolakan layanan bagi pengguna.
+ Lapisan *jaringan* membatasi komunikasi antara sumber daya melalui segmentasi dan kontrol akses.
+ Lapisan *komputasi* mengamankan akses ke komputer virtual.
+ Lapisan *aplikasi* membantu memastikan bahwa aplikasi aman dan bebas dari kerentanan keamanan.
+ Lapisan *data* mengontrol akses ke data bisnis dan pelanggan yang perlu Anda lindungi.

Lapisan ini memberikan panduan bagi Anda untuk membantu membuat keputusan konfigurasi keamanan di semua lapisan aplikasi Anda.

Azure menyediakan alat dan fitur keamanan di setiap tingkat konsep pertahanan mendalam. Mari lihat lebih dekat setiap langkahnya:

:::row:::
  :::column:::
    ![Kamera keamanan yang menunjukkan keamanan fisik.](../media/2-physical-security.png)
  :::column-end:::
  :::column span="3":::

**Keamanan fisik**

Mengamankan akses ke bangunan secara fisik dan mengontrol akses ke perangkat keras komputasi dalam pusat data adalah garis pertahanan pertama.

Dengan keamanan fisik, niatnya adalah untuk memberikan perlindungan fisik terhadap akses ke aset. Perlindungan ini memastikan bahwa lapisan lain tidak dapat dilewati, dan kehilangan atau pencurian ditangani dengan tepat. Microsoft menggunakan berbagai mekanisme keamanan fisik di pusat data cloud-nya.
  :::column-end:::
:::row-end:::
:::row:::
  :::column:::
    ![Lencana yang menunjukkan akses aman.](../media/2-policies-access.png)
  :::column-end:::
  :::column span="3":::

**Identitas dan akses**

Pada lapisan ini, penting untuk:

- Mengontrol akses ke infrastruktur dan mengubah kontrol.
- Gunakan akses menyeluruh (SSO) dan autentikasi multifaktor.
- Mengaudit aktivitas dan perubahan.

Lapisan identitas dan akses adalah tentang memastikan bahwa identitas aman, akses hanya diberikan untuk apa yang diperlukan, dan aktivitas masuk serta perubahan dicatat.
  :::column-end:::
:::row-end:::
:::row:::
  :::column:::
    ![Penghalang fisik yang menunjukkan perimeter jaringan.](../media/2-perimeter.png)
  :::column-end:::
  :::column span="3":::

**Perimeter**

Pada lapisan ini, penting untuk:

- Gunakan perlindungan DDoS untuk memfilter serangan skala besar sebelum dapat memengaruhi ketersediaan sistem bagi pengguna.
- Gunakan firewall perimeter untuk mengidentifikasi dan memperingatkan serangan berbahaya terhadap jaringan Anda.

Di perimeter jaringan, melindungi dari serangan berbasis jaringan terhadap sumber daya Anda adalah yang utama. Mengidentifikasi serangan ini, menghilangkan dampaknya, dan memberi tahu Anda saat serangan terjadi adalah cara penting untuk menjaga keamanan jaringan Anda.
  :::column-end:::
:::row-end:::
:::row:::
  :::column:::
    ![Tiga sistem tersambung yang menunjukkan jaringan.](../media/2-networking.png)
  :::column-end:::
  :::column span="3":::

**Jaringan**

Pada lapisan ini, penting untuk:

- Membatasi komunikasi antar sumber daya.
- Menolak secara default.
- Membatasi akses internet masuk dan membatasi akses keluar jika sesuai.
- Menerapkan konektivitas aman ke jaringan lokal.

Pada lapisan ini, fokusnya adalah membatasi konektivitas jaringan di semua sumber daya Anda untuk hanya memungkinkan apa yang diperlukan. Dengan membatasi komunikasi ini, Anda mengurangi risiko serangan menyebar ke sistem lain di jaringan Anda.
  :::column-end:::
:::row-end:::
:::row:::
  :::column:::
    ![Terminal yang menunjukkan komputasi.](../media/2-compute.png)
  :::column-end:::
  :::column span="3":::

**Compute**

Pada lapisan ini, penting untuk:

- Mengamankan akses ke komputer virtual.
- Menerapkan perlindungan titik akhir pada perangkat dan menjaga sistem tetap di-patch dan terkini.

Malware, sistem yang belum di-patch, dan sistem yang diamankan secara tidak benar membuat lingkungan Anda rentan terhadap serangan. Fokus dalam lapisan ini adalah memastikan bahwa sumber daya komputasi Anda aman dan Anda memiliki kontrol yang tepat untuk meminimalkan masalah keamanan.
  :::column-end:::
:::row-end:::
:::row:::
  :::column:::
    ![Gambar file pada jaringan.](../media/2-application.png)
  :::column-end:::
  :::column span="3":::

**Aplikasi**

Pada lapisan ini, penting untuk:

- Memastikan bahwa aplikasi aman dan bebas dari kerentanan.
- Menyimpan rahasia aplikasi sensitif dalam media penyimpanan yang aman.
- Jadikan keamanan sebagai persyaratan desain untuk semua pengembangan aplikasi.

Mengintegrasikan keamanan ke dalam siklus hidup pengembangan aplikasi membantu mengurangi jumlah kerentanan yang ada dalam kode. Setiap tim pengembangan harus memastikan bahwa aplikasinya aman secara default.
  :::column-end:::
:::row-end:::
:::row:::
  :::column:::
    ![Gambar yang menunjukkan data](../media/2-data.png)
  :::column-end:::
  :::column span="3":::

**Data**

Dalam hampir semua kasus, penyerang mengejar data yang:

- Disimpan dalam database.
- Disimpan pada disk dalam komputer virtual.
- Disimpan dalam aplikasi software as a service (SaaS), seperti Office 365.
- Dikelola melalui penyimpanan cloud.

Mereka yang menyimpan dan mengontrol akses ke data bertanggung jawab untuk memastikan bahwa data diamankan dengan benar. Seringkali, persyaratan peraturan menentukan kontrol dan proses yang harus ada untuk memastikan kerahasiaan, integritas, dan ketersediaan data.
  :::column-end:::
:::row-end:::

## <a name="security-posture"></a>Postur keamanan

*Postur keamanan* Anda adalah kemampuan organisasi untuk melindungi dan menanggapi ancaman keamanan. Prinsip umum yang digunakan untuk mendefinisikan postur keamanan adalah *kerahasiaan,* *integritas*, dan *ketersediaan* yang secara kolektif dikenal sebagai CIA.

+ **Kerahasiaan**

    *Prinsip batasan hak akses paling rendah* berarti membatasi akses ke informasi hanya untuk individu yang secara eksplisit diberikan akses hanya pada tingkat yang mereka butuhkan untuk melakukan pekerjaan mereka. Informasi ini mencakup perlindungan kata sandi pengguna, konten email, dan tingkat akses ke aplikasi dan infrastruktur yang mendasarinya.
+ **Integritas**

    Mencegah perubahan informasi yang tidak sah:
    
    - Istirahat: saat disimpan.
    - Transit: saat sedang ditransfer dari satu tempat ke tempat lain, termasuk dari komputer lokal ke cloud. 
    
    Pendekatan umum yang digunakan dalam transmisi data adalah bagi pengirim untuk membuat sidik jari unik data dengan menggunakan algoritma hash satu arah. Hash dikirim ke penerima bersama dengan data. Penerima menghitung ulang hash data dan membandingkannya dengan yang asli untuk memastikan bahwa data tidak hilang atau diubah saat transit.
+ **Ketersediaan**

    Pastikan layanan berfungsi dan hanya dapat diakses oleh pengguna yang berwenang. *Serangan penolakan layanan* didesain untuk menurunkan ketersediaan sistem, yang memengaruhi penggunanya.
