Dalam [Merencanakan dan mendiskusikan penerapan Azure](https://docs.microsoft.com/learn/modules/azure-architecture-fundamentals/overview), Anda mengetahui bahwa struktur pengorganisasian untuk sumber daya di Azure memiliki empat tingkat: grup manajemen, langganan, grup sumber daya, serta sumber daya.

Pada awal implementasi tata kelola cloud, Anda mengidentifikasi struktur organisasi cloud yang memenuhi kebutuhan bisnis Anda. Langkah ini sering kali melibatkan pembentukan *tim pusat keunggulan awan* (juga disebut *tim pemberdayaan awan* atau *tim penjaga awan*). Tim ini diberdayakan untuk menerapkan praktik tata kelola dari lokasi terpusat untuk seluruh organisasi.

Teams sering memulai strategi tata kelola Azure mereka di tingkat langganan. Ada tiga aspek utama yang perlu dipertimbangkan saat Anda membuat dan mengelola langganan: tagihan, kontrol akses, serta batas langganan.

Mari kita lihat masing-masing aspek ini secara lebih rinci.

## <a name="billing"></a>Billing

Anda bisa membuat satu laporan tagihan per langganan. Jika Anda memiliki beberapa departemen serta perlu melakukan "penagihan balik" biaya cloud, salah satu solusi yang mungkin adalah mengatur langganan berdasarkan departemen atau proyek.

Tag sumber daya juga dapat membantu. Anda akan menjelajahi tag nanti dalam modul ini. Saat Anda menentukan berapa banyak langganan yang Anda butuhkan serta apa yang harus menamainya, perhitungkan persyaratan penagihan internal Anda.

## <a name="access-control"></a>Kontrol akses

Langganan adalah batas penyebaran untuk sumber daya Azure. Setiap langganan dikaitkan dengan penyewa Azure Active Directory. Setiap penyewa memberi administrator kemampuan untuk mengatur akses terperinci melalui peran yang ditentukan dengan menggunakan kontrol akses berbasis peran Azure.

Saat Anda mendesain arsitektur langganan, pertimbangkan faktor batas penyebaran. Misalnya, apakah Anda memerlukan langganan terpisah untuk pengembangan serta untuk lingkungan produksi? Dengan langganan terpisah, Anda dapat mengontrol akses ke masing-masing secara terpisah serta mengisolasi sumber daya mereka satu sama lain.

## <a name="subscription-limits"></a>Batas langganan

Langganan juga memiliki beberapa keterbatasan sumber daya. Misalnya, jumlah maksimum jaringan sirkuit Azure ExpressRoute per langganan adalah 10. Batasan tersebut harus dipertimbangkan selama fase desain Anda. Jika Anda harus melebihi batas tersebut, Anda mungkin perlu menambahkan lebih banyak langganan. Jika Anda mencapai batas keras maksimum, tidak ada fleksibilitas untuk meningkatkannya.

Grup manajemen juga tersedia untuk membantu mengelola langganan. Grup manajemen mengelola akses, kebijakan, serta kepatuhan di beberapa langganan Azure. Anda akan mempelajari selengkapnya tentang grup manajemen nanti dalam modul ini.
