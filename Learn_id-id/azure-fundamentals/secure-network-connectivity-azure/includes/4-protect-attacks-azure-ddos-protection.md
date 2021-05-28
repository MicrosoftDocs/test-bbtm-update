Setiap perusahaan besar dapat menjadi target serangan jaringan skala besar. Tak terkecuali Tailwind Traders. Penyerang mungkin membanjiri jaringan Anda untuk mendapatkan afirmasi atau hanya untuk mencari tantangan. Saat Tailwind Traders beralih ke cloud, Tailwind Traders ingin memahami bagaimana Azure dapat membantu mencegah penolakan layanan terdistribusi (DDoS) dan serangan lainnya.

Di bagian ini, Anda mempelajari bagaimana Azure DDoS Protection (Tingkat layanan standar) membantu melindungi sumber daya Azure Anda dari serangan DDoS. Pertama, mari mendefinisikan apa itu serangan DDoS.

## <a name="what-are-ddos-attacks"></a>Apa itu serangan DDoS?

[Serangan penolakan layanan terdistribusi](https://azure.microsoft.com/services/ddos-protection?azure-portal=true) berupaya membanjiri dan menghabiskan sumber daya aplikasi, membuat aplikasi lambat atau tidak responsif terhadap pengguna yang sah. Serangan DDoS dapat menargetkan sumber daya apa pun yang dapat dijangkau secara publik melalui internet, termasuk situs web.

## <a name="what-is-azure-ddos-protection"></a>Apa itu Azure DDoS Protection?

[Azure DDoS Protection](https://azure.microsoft.com/services/ddos-protection/?azure-portal=true) (Standar) membantu melindungi sumber daya Azure Anda dari serangan DDoS.

Saat Anda menggabungkan DDoS Protection dengan praktik desain aplikasi yang direkomendasikan, Anda membantu memberikan pertahanan terhadap serangan DDoS. DDoS Protection menggunakan skala dan elastisitas jaringan global Microsoft untuk menghadirkan kapasitas mitigasi DDoS ke setiap wilayah Azure. Layanan DDoS Protection membantu melindungi aplikasi Azure Anda dengan menganalisis dan membuang lalu lintas DDoS di tepi jaringan Azure, sebelum dapat memengaruhi ketersediaan layanan Anda.

Diagram ini menunjukkan lalu lintas jaringan yang mengalir ke Azure dari pelanggan dan penyerang:

:::image type="content" source="../media/4-distributed-denial-service.png" alt-text="Ilustrasi menunjukkan Azure DDoS Protection yang terinstal antara jaringan virtual dan permintaan pengguna eksternal." border="false":::

DDoS Protection mengidentifikasi upaya penyerang untuk membanjiri jaringan dan memblokir lalu lintas lebih lanjut dari mereka, memastikan bahwa lalu lintas tidak pernah mencapai sumber daya Azure. Lalu lintas yang sah dari pelanggan masih mengalir ke Azure tanpa gangguan layanan.

DDoS Protection juga dapat membantu Anda mengelola konsumsi cloud Anda. Saat Anda menjalankan secara lokal, Anda memiliki jumlah sumber daya komputasi tetap. Tetapi di cloud, komputasi elastis berarti Anda dapat secara otomatis memperluas penskalaan penerapan untuk memenuhi permintaan. Serangan DDoS yang dirancang dengan baik dapat menyebabkan Anda meningkatkan alokasi sumber daya Anda, yang menimbulkan pengeluaran yang tidak diperlukan. DDoS Protection Standard membantu memastikan bahwa beban jaringan yang Anda proses menunjukkan penggunaan oleh pelanggan. Anda juga dapat menerima kredit untuk biaya apa pun yang diperoleh untuk sumber daya yang diperluas selama serangan DDoS.

## <a name="what-service-tiers-are-available-to-ddos-protection"></a>Tingkat layanan apa yang tersedia untuk DDoS Protection?

DDoS Protection menyediakan tingkat layanan ini:

+ **Dasar**

    Tingkat layanan Dasar diaktifkan secara otomatis dan gratis sebagai bagian dari langganan Azure Anda.

    Pemantauan lalu lintas yang selalu aktif dan mitigasi serangan tingkat jaringan umum aktual memberikan pertahanan yang sama dengan yang digunakan layanan online Microsoft. Tingkat layanan Dasar memastikan bahwa infrastruktur Azure itu sendiri tidak terpengaruh selama serangan DDoS skala besar.

    Jaringan global Azure digunakan untuk mendistribusikan dan mengurangi lalu lintas serangan di seluruh wilayah Azure.
+ **Standard**

    Tingkat layanan Standar menyediakan kemampuan mitigasi tambahan yang disetel khusus untuk sumber daya Azure Virtual Network. DDoS Protection Standard relatif mudah diaktifkan dan tidak memerlukan perubahan pada aplikasi Anda.

    Tingkat Standar menyediakan pemantauan lalu lintas yang selalu aktif dan mitigasi aktual dari serangan tingkat jaringan umum. Tingkat ini menyediakan pertahanan yang sama dengan yang digunakan layanan online Microsoft.

    Kebijakan perlindungan disetel melalui pemantauan lalu lintas khusus dan algoritme pembelajaran mesin. Kebijakan diterapkan ke alamat IP publik, yang terkait dengan sumber daya yang diterapkan di jaringan virtual seperti Azure Load Balancer dan Application Gateway.

    Jaringan global Azure digunakan untuk mendistribusikan dan mengurangi lalu lintas serangan di seluruh wilayah Azure.

## <a name="what-kinds-of-attacks-can-ddos-protection-help-prevent"></a>Jenis serangan apa yang dapat dicegah oleh DDoS Protection?

Tingkat layanan Standar dapat membantu mencegah:

+ **Serangan volumetrik**

    Tujuan dari serangan ini adalah untuk membanjiri lapisan jaringan dengan sejumlah besar lalu lintas yang tampaknya sah.
+ **Serangan protokol**

    Serangan ni membuat target tidak dapat diakses dengan mengeksploitasi kelemahan di tumpukan protokol lapisan 3 dan lapisan 4.
+ **Serangan lapisan sumber daya (lapisan aplikasi - hanya dengan firewall aplikasi web)**

    Serangan ini menargetkan paket aplikasi web untuk mengganggu transmisi data antar host. Anda memerlukan firewall aplikasi web (WAF) untuk melindungi dari serangan L7. DDoS Protection Standard melindungi WAF dari serangan volumetrik dan protokol.
