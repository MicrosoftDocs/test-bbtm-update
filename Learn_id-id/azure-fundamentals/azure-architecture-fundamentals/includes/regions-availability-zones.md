Di unit sebelumnya, Anda mempelajari tentang sumber daya Azure dan grup sumber daya. Sumber daya dibuat di wilayah, yang merupakan lokasi geografis yang berbeda di seluruh dunia yang berisi pusat data Azure. 

Azure terdiri dari pusat data yang terletak di seluruh dunia. Saat Anda menggunakan layanan atau membuat sumber daya seperti database SQL atau komputer virtual (VM), Anda menggunakan peralatan fisik di satu atau beberapa lokasi ini. Pusat data khusus ini tidak diekspos ke pengguna secara langsung. Sebagai gantinya, Azure mengaturnya ke dalam wilayah. Seperti yang akan Anda lihat nanti di unit ini, beberapa wilayah ini menawarkan zona ketersediaan, yang berbeda pusat data Azure di wilayah tersebut.

## <a name="azure-regions"></a>Wilayah Azure

*Wilayah* adalah area geografis di planet yang berisi setidaknya satu tetapi berpotensi beberapa pusat data di sekitarnya dan terhubung dengan jaringan berlatensi rendah. Azure secara cerdas menetapkan dan mengontrol sumber daya di setiap wilayah untuk memastikan beban kerja seimbang dengan tepat.

Saat anda menerapkan sumber daya di Azure, Anda sering kali harus memilih wilayah di mana anda ingin sumber daya anda digunakan.

> [!IMPORTANT]
> Beberapa layanan atau fitur VM hanya tersedia di wilayah tertentu, seperti ukuran VM atau jenis penyimpanan tertentu. Ada juga beberapa layanan Azure global yang tidak mengharuskan Anda memilih wilayah tertentu, seperti Azure Active Directory, Azure Traffic Manager, dan Azure DNS.

Beberapa contoh wilayah adalah AS Barat, Kanada Tengah, Eropa Barat, Australia Timur, dan Jepang Barat. Berikut adalah tampilan semua wilayah yang tersedia per Juni 2020.

[//]: # (Catatan pengelola: versi terbaru dari gambar ini tersedia sebagai SVG dari https://azure.microsoft.com/global-infrastructure/regions/atauhttps://azure.microsoft.com/global-infrastructure/geographies/, disampling ulang lebih kecil di sini untuk tampilan awal.)
[ ![Peta global wilayah Azure yang tersedia per Juni 2020.](../media/regions-small.png) ](../media/regions-expanded.png#lightbox))

### <a name="why-are-regions-important"></a>Mengapa wilayah penting?

Azure memiliki wilayah global yang lebih banyak daripada penyedia cloud lainnya. Wilayah ini memberi Anda fleksibilitas untuk mendekatkan aplikasi dengan pengguna Anda di mana pun mereka berada. Wilayah global memberikan skalabilitas dan redundansi yang lebih baik. Mereka juga menyimpan residensi data untuk layanan Anda.

### <a name="special-azure-regions"></a>Wilayah Azure Khusus

Azure memiliki wilayah khusus yang mungkin ingin Anda gunakan saat Anda membuat aplikasi untuk tujuan kepatuhan atau hukum. Contoh meliputi:

- **Departemen Pertahanan AS Pusat, Gubernur AS Virginia, Gubernur AS Iowa, dan lainnya:** Wilayah-wilayah ini adalah contoh Azure yang terisolasi jaringan fisik dan logis untuk lembaga dan mitra pemerintah AS. Pusat data ini dioperasikan oleh personel AS yang disaring dan mencakup sertifikasi kepatuhan tambahan.
- **Cina Timur, Cina Utara, dan banyak lagi:** Wilayah ini tersedia melalui kemitraan unik antara Microsoft dan 21Vianet, di mana Microsoft tidak secara langsung mempertahankan pusat data.

Wilayah adalah apa yang Anda gunakan untuk mengidentifikasi lokasi untuk sumber daya Anda. Ada dua istilah lain yang juga harus Anda waspadai: _geografi_ dan _zona ketersediaan_.

## <a name="azure-availability-zones"></a>Zona ketersediaan Azure

Anda ingin memastikan layanan dan data Anda berlebihan sehingga Anda dapat melindungi informasi Anda jika terjadi kegagalan. Saat Anda meng-host infrastruktur Anda, menyiapkan redundansi Anda sendiri mengharuskan Anda membuat lingkungan perangkat keras duplikat. Azure dapat membantu membuat aplikasi Anda sangat tersedia melalui zona ketersediaan.

### <a name="what-is-an-availability-zone"></a>Apa itu zona ketersediaan?

Zona ketersediaan adalah pusat data yang dipisahkan secara fisik dalam wilayah Azure. Setiap zona ketersediaan terdiri dari satu atau beberapa pusat data yang dilengkapi dengan daya, pendinginan, dan jaringan independen. Zona ketersediaan disiapkan untuk menjadi _batas isolasi_. Jika satu zona berhenti, yang lain terus bekerja. Zona ketersediaan terhubung melalui jaringan serat optik pribadi berkecepatan tinggi.

[![Diagram menunjukkan tiga pusat data yang tersambung dalam satu wilayah Azure untuk mewakili zona ketersediaan.](../media/availability-zones.png)](../media/availability-zones-expanded.png#lightbox)

### <a name="supported-regions"></a>Wilayah yang didukung

Tidak setiap wilayah memiliki dukungan untuk zona ketersediaan. Untuk daftar yang diperbarui, lihat [Wilayah yang mendukung zona ketersediaan di Azure](https://docs.microsoft.com/azure/availability-zones/az-region?azure-portal=true).

### <a name="use-availability-zones-in-your-apps"></a>Gunakan zona ketersediaan di aplikasi Anda

Anda dapat menggunakan zona ketersediaan untuk menjalankan aplikasi yang sangat penting dan membangun ketersediaan yang tinggi ke dalam arsitektur aplikasi Anda dengan menempatkan komputasi, penyimpanan, jaringan, dan sumber daya data dalam zona dan mereplikasi di zona lain. Perlu diingat bahwa mungkin ada biaya untuk menduplikasi layanan Anda dan mentransfer data antar zona.

Zona ketersediaan terutama untuk VM, disk terkelola, penyeimbang muatan, dan database SQL. Layanan Azure yang mendukung zona ketersediaan terbagi dalam dua kategori:

- **Layanan zonal**: Anda menyematkan sumber daya ke zona tertentu (misalnya, VM, disk terkelola, alamat IP).
- **Layanan zona-redundan**: Platform mereplikasi secara otomatis di seluruh zona (misalnya, penyimpanan zona-redundan, Database SQL).

Periksa dokumentasi untuk menentukan elemen arsitektur mana yang dapat Anda kaitkan dengan zona ketersediaan.

## <a name="azure-region-pairs"></a>Pasangan wilayah Azure

Zona ketersediaan dibuat dengan menggunakan satu atau beberapa pusat data. Ada minimal tiga zona dalam satu wilayah. Ada kemungkinan bahwa bencana besar dapat menyebabkan pemadaman yang cukup besar untuk mempengaruhi bahkan dua pusat data. Itu sebabnya Azure juga membuat _pasangan wilayah_.

### <a name="what-is-a-region-pair"></a>Apa itu pasangan wilayah?

Setiap wilayah Azure selalu dipasangkan dengan wilayah lain dalam geografi yang sama (seperti AS, Eropa, atau Asia) setidaknya 300 mil jauhnya. Pendekatan ini memungkinkan replikasi sumber daya (seperti penyimpanan VM) di seluruh geografi yang membantu mengurangi kemungkinan gangguan karena peristiwa seperti bencana alam, kerusuhan sipil, pemadaman listrik, atau pemadaman jaringan fisik yang mempengaruhi kedua wilayah sekaligus. Jika suatu wilayah berpasangan dipengaruhi oleh bencana alam, misalnya, layanan secara otomatis akan dialihkan ke wilayah lain dalam pasangan wilayahnya.

Contoh pasangan wilayah di Azure adalah AS Barat yang dipasangkan dengan AS Timur dan Asia Selatan yang dipasangkan dengan Asia Timur.

[![Diagram menunjukkan hubungan antara geografi, pasangan wilayah, wilayah, dan pusat data. Kotak geografi berisi dua pasangan wilayah. Setiap pasangan wilayah berisi dua wilayah Azure. Setiap wilayah berisi tiga zona ketersediaan.](../media/region-pairs.png)](../media/region-pairs-expanded.png#lightbox)

Karena sepasang wilayah terhubung langsung dan cukup jauh terpisah untuk diisolasi dari bencana regional, Anda dapat menggunakannya untuk menyediakan layanan dan redundansi data yang andal. Beberapa layanan menawarkan penyimpanan geo-redundan otomatis dengan menggunakan pasangan wilayah.

Keuntungan tambahan dari pasangan wilayah:

- Jika pemadaman Azure yang luas terjadi, satu wilayah dari setiap pasangan diprioritaskan untuk memastikan setidaknya satu dipulihkan secepat mungkin untuk aplikasi yang dihosting di pasangan wilayah tersebut.
- Pembaruan Azure terencana diluncurkan ke wilayah berpasangan satu wilayah sekaligus untuk meminimalkan waktu henti dan risiko pemadaman aplikasi.
- Data terus berada dalam geografi yang sama dengan pasangannya (kecuali Brasil Selatan) untuk tujuan yurisdiksi pajak dan penegakan hukum.

Memiliki sekumpulan pusat data yang didistribusikan secara luas memungkinkan Azure untuk memberikan jaminan ketersediaan yang tinggi.
