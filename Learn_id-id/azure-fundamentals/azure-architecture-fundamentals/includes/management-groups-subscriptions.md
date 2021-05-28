Saat Tailwind Traders dimulai dengan Azure, salah satu langkah pertama Anda adalah membuat setidaknya satu langganan Azure. Anda akan menggunakannya untuk membuat sumber daya berbasis cloud di Azure.

> [!NOTE]
>
> Sumber daya Azure adalah item yang dapat dikelola yang tersedia melalui Azure. Komputer virtual (VM), akun penyimpanan, aplikasi web, database, dan jaringan virtual adalah semua contoh sumber daya.

## <a name="azure-subscriptions"></a>Langganan Azure

Menggunakan Azure memerlukan langganan Azure. Langganan memberi Anda akses terautentikasi dan resmi ke produk dan layanan Azure. Ini juga memungkinkan Anda untuk menyediakan sumber daya. Langganan Azure adalah unit logis layanan Azure yang ditautkan ke akun Azure, yang merupakan identitas di Azure Active Directory (Azure AD) atau dalam direktori yang dipercaya Azure AD.

[![Diagram memperlihatkan langganan Azure menggunakan autentikasi dan otorisasi untuk mengakses akun Azure.](../media/subscriptions.png)](../media/subscriptions-expanded.png#lightbox)

Akun dapat memiliki satu langganan atau beberapa langganan yang memiliki model penagihan yang berbeda dan yang mana Anda menerapkan kebijakan manajemen akses yang berbeda. Anda bisa menggunakan langganan Azure untuk menentukan batasan seputar produk, layanan, dan sumber daya Azure. Ada dua tipe batas langganan yang bisa Anda gunakan:

- **Batas tagihan**: Tipe langganan ini menentukan cara akun Azure ditagih untuk menggunakan Azure. Anda dapat membuat beberapa langganan untuk berbagai jenis persyaratan tagihan. Azure membuat laporan dan faktur tagihan terpisah untuk setiap langganan sehingga Anda dapat menata dan mengelola biaya.
- **Batas kontrol akses**: Azure menerapkan kebijakan manajemen akses di tingkat langganan, dan Anda bisa membuat langganan terpisah untuk mencerminkan struktur organisasi yang berbeda. Contohnya adalah bahwa dalam bisnis, Anda memiliki departemen yang berbeda di mana Anda menerapkan kebijakan langganan Azure yang berbeda. Model penagihan ini memungkinkan Anda mengelola dan mengontrol akses ke sumber daya yang disediakan pengguna dengan langganan tertentu.

### <a name="create-additional-azure-subscriptions"></a>Membuat langganan Azure tambahan

Anda mungkin ingin membuat langganan tambahan untuk tujuan manajemen sumber daya atau tagihan Misalnya, Anda dapat memilih untuk membuat langganan tambahan untuk dipisahkan:

- **Lingkungan:** Saat mengelola sumber daya, Anda dapat memilih untuk membuat langganan untuk menyiapkan lingkungan terpisah untuk pengembangan dan pengujian, keamanan, atau untuk mengisolasi data karena alasan kepatuhan. Desain ini sangat berguna karena kontrol akses sumber daya terjadi di tingkat langganan.
- **Struktur organisasi:** Anda dapat membuat langganan untuk mencerminkan struktur organisasi yang berbeda. Misalnya, Anda dapat membatasi tim untuk sumber daya berbiaya rendah, sekaligus memungkinkan departemen IT memiliki jangkauan penuh. Desain ini memungkinkan Anda mengelola dan mengontrol akses ke sumber daya yang disediakan pengguna dalam setiap langganan.
- **Tagihan:** Anda mungkin ingin juga membuat langganan tambahan untuk keperluan penagihan. Karena biaya pertama kali dikumpulkan di tingkat langganan, Anda mungkin ingin membuat langganan untuk mengelola dan melacak biaya berdasarkan kebutuhan Anda. Misalnya, Anda mungkin ingin membuat satu langganan untuk beban kerja produksi Anda dan langganan lain untuk beban kerja pengembangan dan pengujian Anda.

Anda mungkin juga memerlukan langganan tambahan karena:

- **Batas langganan:** Langganan terikat dengan beberapa batasan keras. Misalnya, jumlah maksimum sirkuit Azure ExpressRoute per langganan adalah 10. Batas tersebut harus dipertimbangkan saat Anda membuat langganan di akun Anda. Jika ada kebutuhan untuk melampaui batas tersebut dalam skenario tertentu, Anda mungkin memerlukan langganan tambahan.

### <a name="customize-billing-to-meet-your-needs"></a>Sesuaikan penagihan untuk memenuhi kebutuhan Anda

Jika Anda memiliki beberapa langganan, Anda bisa menatanya ke dalam bagian faktur. Setiap bagian faktur adalah item baris pada faktur yang menunjukkan biaya yang dikeluarkan bulan itu. Misalnya, Anda mungkin memerlukan satu faktur untuk organisasi Anda tetapi ingin mengatur biaya berdasarkan departemen, tim, atau proyek.

Bergantung pada kebutuhan Anda, Anda dapat menyiapkan beberapa faktur dalam akun penagihan yang sama. Untuk melakukan ini, buat profil penagihan tambahan. Setiap profil penagihan memiliki faktur bulanan dan metode pembayarannya sendiri.

Diagram berikut ini memperlihatkan gambaran umum tentang bagaimana penagihan disusun. Jika sebelumnya Anda telah mendaftar Azure atau jika organisasi Anda memiliki Perjanjian Perusahaan, tagihan Anda mungkin disiapkan secara berbeda.

[![Diagram bergaya bagan alur memperlihatkan contoh pengaturan struktur penagihan di mana berbagai grup seperti pemasaran atau pengembangan memiliki langganan Azure mereka sendiri yang digulung menjadi akun penagihan Azure berbayar perusahaan yang lebih besar.](../media/billing-structure-overview.png)](../media/billing-structure-overview-expanded.png#lightbox)

## <a name="azure-management-groups"></a>Grup manajemen Azure

Jika organisasi Anda memiliki banyak langganan, Anda mungkin memerlukan cara untuk mengelola akses, kebijakan, dan kepatuhan untuk langganan tersebut secara efisien. Grup manajemen Azure menyediakan tingkat cakupan di atas langganan. Anda mengatur langganan ke dalam kontainer yang disebut grup manajemen dan menerapkan kondisi tata kelola Anda ke grup manajemen. Semua langganan dalam grup manajemen secara otomatis mewarisi kondisi yang diterapkan ke grup manajemen. Grup manajemen memberi Anda manajemen tingkat perusahaan dalam skala besar apa pun jenis langganan yang mungkin Anda miliki. Semua langganan dalam satu grup manajemen harus mempercayai penyewa Azure AD yang sama.

Misalnya, Anda dapat menerapkan kebijakan ke grup manajemen yang membatasi wilayah yang tersedia untuk pembuatan VM. Kebijakan ini akan diterapkan ke semua grup manajemen, langganan, dan sumber daya di bawah grup manajemen tersebut dengan hanya mengizinkan VM dibuat di wilayah tersebut.

### <a name="hierarchy-of-management-groups-and-subscriptions"></a>Hierarki grup manajemen dan langganan

Anda dapat membangun struktur grup manajemen dan langganan yang fleksibel untuk menata sumber daya Anda ke dalam hierarki untuk kebijakan terpadu dan manajemen akses. Diagram berikut ini memperlihatkan contoh membuat hierarki untuk tata kelola dengan menggunakan grup manajemen.

[![Diagram memperlihatkan contoh pohon hierarki grup manajemen.](../media/management-groups-and-subscriptions.png)](../media/management-groups-and-subscriptions-expanded.png#lightbox)

Anda dapat membuat hierarki yang menerapkan kebijakan. Misalnya, Anda dapat membatasi lokasi VM ke Wilayah Barat AS dalam grup yang disebut Produksi. Kebijakan ini akan mewarisi semua langganan Perjanjian Perusahaan yang merupakan keturunan dari grup manajemen tersebut dan akan berlaku untuk semua VM di bawah langganan tersebut. Kebijakan keamanan ini tidak dapat diubah oleh pemilik sumber daya atau langganan, yang memungkinkan perbaikan tata kelola.

Skenario lain di mana Anda akan menggunakan grup manajemen adalah menyediakan akses pengguna ke beberapa langganan. Dengan memindahkan beberapa langganan di bawah grup manajemen tersebut, Anda dapat membuat satu penetapan kontrol akses berbasis peran (RBAC) pada grup manajemen, yang akan mewarisi akses tersebut ke semua langganan. Satu tugas di grup manajemen dapat memungkinkan pengguna untuk mengakses semua yang mereka butuhkan alih-alih membuat skrip RBAC melalui langganan yang berbeda.

### <a name="important-facts-about-management-groups"></a>Fakta penting tentang grup manajemen

- 10.000 grup manajemen dapat didukung dalam satu direktori.
- Pohon grup manajemen dapat mendukung hingga enam tingkat kedalaman. Batas ini tidak termasuk tingkat root atau tingkat langganan.
- Setiap grup manajemen dan langganan hanya dapat mendukung satu induk.
- Setiap kelompok manajemen dapat memiliki banyak anak.
- Semua langganan dan grup manajemen berada dalam satu hierarki di setiap direktori.
