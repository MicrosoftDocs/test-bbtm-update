Saat Tailwind Traders membangun beban kerjanya di cloud, mereka perlu menangani informasi sensitif dengan hati-hati seperti kata sandi, kunci enkripsi, dan sertifikat. Informasi tersebut harus tersedia agar aplikasi dapat berfungsi, tetapi mungkin mengizinkan orang yang tidak berwenang mengakses data aplikasi.

[Azure Key Vault](https://azure.microsoft.com/services/key-vault?azure-portal=true) adalah layanan cloud terpusat untuk menyimpan rahasia aplikasi dalam satu lokasi pusat. Ini menyediakan akses aman ke informasi sensitif dengan menyediakan kontrol akses dan kemampuan pengelogan.

## <a name="what-can-azure-key-vault-do"></a>Apa yang dapat dilakukan Azure Key Vault?

Azure Key Vault dapat membantu Anda:

+ **Mengelola rahasia**

    Anda dapat menggunakan Key Vault untuk menyimpan dan mengontrol akses dengan aman ke token, kata sandi, sertifikat, kunci API, dan rahasia lainnya.

+ **Mengelola kunci enkripsi**

    Anda dapat menggunakan Key Vault sebagai solusi manajemen kunci. Key Vault memudahkan untuk membuat dan mengontrol kunci enkripsi yang digunakan untuk mengenkripsi data Anda.

+ **Mengelola sertifikat SSL/TLS**

    Key Vault memungkinkan Anda menyediakan, mengelola, dan menggunakan sertifikat Secure Sockets Layer/Keamanan Lapisan Transportasi (SSL/TLS) publik dan pribadi baik untuk sumber daya Azure maupun sumber daya internal Anda.

+ **Menyimpan rahasia yang didukung oleh modul keamanan perangkat keras (HSM)**

    Rahasia dan kunci tersebut dapat dilindungi baik oleh perangkat lunak ataupun oleh HSM tervalidasi FIPS 140-2 Level 2.

Berikut adalah contoh yang memperlihatkan sertifikat yang digunakan untuk pengujian di Key Vault.

:::image type="content" source="../media/4-key-vault-certificates.png" alt-text="Cuplikan layar portal Azure yang menampilkan sertifikat pengujian di Azure Key Vault.":::

Anda akan menambahkan rahasia ke Key Vault nanti dalam modul ini.

## <a name="what-are-the-benefits-of-azure-key-vault"></a>Apa manfaat Azure Key Vault?

Manfaat menggunakan Key Vault meliputi:

+ **Rahasia aplikasi terpusat**

    Memusatkan penyimpanan untuk rahasia aplikasi Anda memungkinkan Anda mengontrol distribusinya, dan mengurangi kemungkinan kebocoran rahasia secara tidak sengaja.

+ **Rahasia dan kunci tersimpan dengan aman**

    Azure menggunakan algoritme standar industri, panjang kunci, dan HSM. Akses ke Key Vault memerlukan autentikasi dan otorisasi yang tepat.

+ **Pemantauan akses dan kontrol akses**

    Dengan menggunakan Key Vault, Anda dapat memantau dan mengontrol akses ke rahasia aplikasi Anda.

+ **Administrasi rahasia aplikasi yang disederhanakan**

    Key Vault memudahkan pendaftaran dan perpanjangan sertifikat dari otoritas sertifikat (CA) publik. Anda juga dapat meningkatkan dan mereplikasi konten di dalam wilayah dan menggunakan alat manajemen sertifikat standar.

+ **Integrasi dengan layanan Azure lainnya**

    Anda dapat mengintegrasikan Key Vault dengan akun penyimpanan, registri kontainer, hub acara, dan banyak layanan Azure lainnya. Layanan ini kemudian dapat mereferensikan rahasia yang disimpan di Key Vault dengan aman.
