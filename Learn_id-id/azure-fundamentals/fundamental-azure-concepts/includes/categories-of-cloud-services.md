## <a name="what-are-cloud-service-models"></a>Apa itu model layanan cloud?

Jika Anda sudah menangani komputasi cloud untuk sementara waktu, Anda mungkin sudah melihat akronim *PaaS*, *IaaS*, dan *SaaS* untuk *model layanan cloud* yang berbeda. Model ini menentukan tingkat tanggung jawab bersama yang berbeda, tanggung jawab bersama untuk penyedia cloud dan penyewa cloud.

| Model | Definisi | Deskripsi |
| --- | --- | --- |
| **IaaS** | <nobr>*Infrastructure-as-a-Service*</nobr> | Model layanan cloud ini adalah yang paling dekat dengan mengelola server fisik; penyedia cloud akan terus memperbarui perangkat keras, tetapi pemeliharaan sistem operasi dan konfigurasi jaringan diserahkan kepada Anda sebagai penyewa cloud. Misalnya, komputer virtual Azure adalah perangkat komputasi virtual yang beroperasi penuh dan berjalan di pusat data Microsoft. Keuntungan dari model layanan cloud ini adalah penerapan cepat untuk perangkat komputasi baru. Menyiapkan komputer virtual baru jauh lebih cepat daripada mendapatkan, menginstal, dan mengonfigurasi server fisik. |
| **PaaS** | <nobr>*Platform-as-a-Service*</nobr> | Model layanan cloud ini adalah lingkungan hosting terkelola. Penyedia cloud mengelola komputer virtual dan sumber daya jaringan, dan penyewa cloud menerapkan aplikasi mereka ke lingkungan hosting terkelola. Misalnya, Azure App Services menyediakan lingkungan hosting terkelola tempat pengembang dapat mengunggah aplikasi web mereka tanpa khawatir dengan persyaratan perangkat lunak dan perangkat keras fisik. |
| **SaaS** | <nobr>*Software-as-a-Service*</nobr> | Dalam model layanan cloud ini, penyedia cloud mengelola semua aspek lingkungan aplikasi, seperti komputer virtual, sumber daya jaringan, penyimpanan data, dan aplikasi. Penyewa cloud hanya perlu memberikan data mereka ke aplikasi yang dikelola oleh penyedia cloud. Misalnya, Microsoft Office 365 menyediakan versi Microsoft Office yang berfungsi penuh dan berjalan di cloud. Yang harus Anda lakukan adalah membuat konten dan Office 365 akan mengurus sisanya. |

Ilustrasi berikut ini menunjukkan layanan yang mungkin berjalan di setiap model layanan cloud.

[![Diagram layanan dipisahkan oleh model layanan cloud.](../media/iaas-paas-saas.png)](../media/iaas-paas-saas-expanded.png#lightbox)

Mari kita bandingkan ketiga model secara lebih terperinci di bagian berikut.

### <a name="iaas"></a>Infrastruktur sebagai layanan

IaaS adalah kategori layanan cloud yang paling fleksibel. Layanan ini bertujuan untuk memberi Anda kontrol penuh atas perangkat keras yang menjalankan aplikasi Anda. Dengan IaaS, Anda tidak perlu membeli perangkat keras, tetapi menyewanya.

#### <a name="advantages"></a>Keuntungan

**Tidak ada CapEx**. Pengguna tidak memiliki biaya di muka.

**Ketangkasan**. Aplikasi dapat diakses dengan cepat, dan disediakan kapan pun diperlukan.

**Manajemen**. Model tanggung jawab bersama berlaku; pengguna mengelola dan memelihara layanan yang sudah mereka sediakan, serta penyedia cloud mengelola dan memelihara infrastruktur cloud.

**Model berbasis konsumsi**. Organisasi hanya membayar apa yang mereka gunakan dan beroperasi berdasarkan model Pengeluaran Operasional (OpEx).

**Keterampilan**. Tidak perlu keterampilan teknis yang mendalam untuk menyebarkan, menggunakan, dan mendapatkan manfaat dari cloud publik. Organisasi dapat menggunakan keterampilan dan keahlian penyedia cloud untuk memastikan beban kerja terjamin, aman, dan sangat tersedia.

**Manfaat cloud**. Organisasi dapat menggunakan keterampilan dan keahlian penyedia cloud untuk memastikan beban kerja aman dan sangat tersedia.

**Fleksibilitas**. IaaS adalah layanan cloud paling fleksibel karena Anda memiliki kontrol untuk mengonfigurasi dan mengelola perangkat keras yang menjalankan aplikasi Anda.

### <a name="paas"></a>PaaS

PaaS memberikan manfaat dan pertimbangan yang sama dengan IaaS, tetapi ada beberapa manfaat tambahan yang harus diperhatikan.

#### <a name="advantages"></a>Keuntungan

**Tidak ada CapEx**. Pengguna tidak memiliki biaya di muka.

**Ketangkasan**. PaaS lebih tangkas daripada IaaS, dan pengguna tidak perlu mengonfigurasi server untuk menjalankan aplikasi.

**Model berbasis konsumsi**. Pengguna hanya membayar apa yang mereka gunakan, dan beroperasi berdasarkan model OpEx.

**Keterampilan**. Tidak perlu keterampilan teknis yang mendalam untuk menyebarkan, menggunakan, dan mendapatkan manfaat dari PaaS.

**Manfaat cloud**. Pengguna dapat memanfaatkan keterampilan dan keahlian penyedia cloud untuk memastikan beban kerja mereka aman dan sangat tersedia. Selain itu, pengguna bisa mendapatkan akses ke alat pengembangan yang lebih mutakhir. Mereka selanjutnya dapat menerapkan alat-alat ini di seluruh siklus hidup aplikasi.

**Produktivitas**. Pengguna dapat fokus pada pengembangan aplikasi saja, karena penyedia cloud menangani semua manajemen platform. Bekerja dengan tim terdistribusi sebagai layanan lebih mudah karena platform ini diakses melalui internet. Anda dapat membuat platform tersedia secara global dengan lebih mudah.

#### <a name="disadvantage"></a>Kerugian

**Keterbatasan platform**. Mungkin ada beberapa batasan untuk platform cloud yang dapat memengaruhi cara aplikasi berjalan. Ketika Anda mengevaluasi platform PaaS mana yang paling cocok untuk beban kerja, pastikan untuk mempertimbangkan batasan apa pun di area ini.

### <a name="saas"></a>SaaS

SaaS adalah perangkat lunak yang dihosting dan dikelola secara terpusat untuk Anda dan pengguna atau pelanggan Anda. Biasanya satu versi aplikasi digunakan untuk semua pelanggan, dan dilisensikan melalui langganan bulanan atau tahunan.

PaaS memberikan manfaat yang sama dengan IaaS, tetapi sekali lagi, ada beberapa manfaat tambahan yang juga harus diperhatikan.

#### <a name="advantages"></a>Keuntungan

**Tidak ada CapEx**. Pengguna tidak memiliki biaya di muka.

**Ketangkasan**. Pengguna dapat memberi staf akses ke perangkat lunak terbaru dengan cepat dan mudah.

**Model harga bayar sesuai pemakaian**. Pengguna membayar perangkat lunak yang mereka gunakan pada model langganan, biasanya bulanan atau tahunan, terlepas dari seberapa banyak mereka menggunakan perangkat lunak.

**Keterampilan**. Tidak perlu keterampilan teknis yang mendalam untuk menyebarkan, menggunakan, dan mendapatkan manfaat dari SaaS.

**Fleksibilitas**. Pengguna dapat mengakses data aplikasi yang sama dari mana saja.

#### <a name="disadvantage"></a>Kerugian

**Keterbatasan perangkat lunak**. Mungkin ada beberapa batasan untuk aplikasi perangkat lunak yang dapat mempengaruhi cara kerja pengguna. Karena menggunakan perangkat lunak sebagaimana adanya, Anda tidak memiliki kontrol langsung terhadap fitur. Ketika Anda mengevaluasi platform SaaS mana yang paling cocok untuk beban kerja, pastikan untuk mempertimbangkan kebutuhan bisnis dan keterbatasan perangkat lunak apa pun.

## <a name="what-is-serverless-computing"></a>Apa itu komputasi tanpa server?

Seperti PaaS, *komputasi tanpa server* memungkinkan pengembang membangun aplikasi lebih cepat dengan mengeliminasi kebutuhan untuk mengelola infrastruktur. Dengan aplikasi tanpa server, penyedia layanan cloud secara otomatis menyediakan, menskalakan, dan mengelola infrastruktur yang diperlukan untuk menjalankan kode. Arsitektur tanpa server sangat dapat diskalakan dan didorong kejadian, hanya menggunakan sumber daya ketika fungsi atau pemicu tertentu terjadi.

Penting untuk dicatat bahwa server masih menjalankan kode. Nama "tanpa server" berasal dari fakta bahwa tugas yang terkait dengan penyediaan dan manajemen infrastruktur tidak terlihat oleh pengembang. Pendekatan ini memungkinkan pengembang meningkatkan fokus mereka pada logika bisnis dan memberikan nilai lebih pada inti bisnis. Komputasi tanpa server membantu tim meningkatkan produktivitas mereka dan membawa produk ke pasar lebih cepat, serta memungkinkan organisasi lebih mengoptimalkan sumber daya dan tetap fokus pada inovasi.
