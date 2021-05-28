Dengan Azure, Anda hanya membayar yang Anda gunakan. Anda akan menerima faktur bulanan dengan instruksi pembayaran yang disediakan. Anda dapat mengatur faktur Anda ke dalam item baris yang masuk akal bagi Anda dan memenuhi kebutuhan anggaran serta pelacakan biaya Anda. Anda juga bisa menyiapkan beberapa faktur. Mari kita lihat cara kerjanya.

## <a name="azure-subscription"></a>Langganan Azure

Saat Anda mendaftar, langganan Azure dibuat secara default. Langganan Azure adalah kontainer logis yang digunakan untuk menyediakan sumber daya di Azure. Ini menyimpan detail semua sumber daya Anda seperti komputer virtual (VM), database, dan lainnya. Saat membuat sumber daya Azure seperti VM, Anda mengidentifikasi langganannya.  Saat Anda menggunakan VM, penggunaan VM dikumpulkan dan ditagih tiap bulan.

## <a name="create-additional-azure-subscriptions"></a>Membuat langganan Azure tambahan

Anda mungkin ingin membuat langganan tambahan untuk tujuan manajemen sumber daya atau tagihan. Misalnya, Anda dapat memilih untuk membuat langganan tambahan untuk dipisahkan:

- **Lingkungan**: Saat mengelola sumber daya, Anda dapat memilih untuk membuat langganan untuk menyiapkan lingkungan terpisah untuk pengembangan dan pengujian, keamanan, atau untuk mengisolasi data karena alasan kepatuhan. Ini sangat berguna karena kontrol akses sumber daya terjadi di tingkat langganan.
- **Struktur organisasi**: Anda dapat membuat langganan untuk mencerminkan struktur organisasi yang berbeda. Misalnya, Anda dapat membatasi tim untuk sumber daya berbiaya rendah, sekaligus memungkinkan departemen IT memiliki jangkauan penuh. Desain ini memungkinkan Anda mengelola dan mengontrol akses ke sumber daya yang disediakan pengguna dalam setiap langganan.
- **Tagihan**: Anda mungkin juga ingin membuat langganan tambahan untuk keperluan tagihan. Karena biaya pertama kali dikumpulkan di tingkat langganan, Anda mungkin ingin membuat langganan untuk mengelola dan melacak biaya berdasarkan kebutuhan Anda. Misalnya, Anda mungkin ingin membuat langganan untuk beban kerja produksi Anda dan langganan lain untuk beban kerja pengembangan serta pengujian Anda.

Anda mungkin juga memerlukan langganan tambahan karena:

- **Batas langganan**: Langganan terikat dengan beberapa batasan keras. Misalnya, jumlah maksimum sirkuit Express Route per langganan adalah 10. Batas tersebut harus dipertimbangkan saat Anda membuat langganan di akun Anda. Jika ada kebutuhan untuk melampaui batas tersebut dalam skenario tertentu, Anda mungkin memerlukan langganan tambahan.

## <a name="customize-billing-to-meet-your-needs"></a>Sesuaikan penagihan untuk memenuhi kebutuhan Anda

Jika Anda memiliki beberapa langganan, Anda bisa menatanya ke dalam bagian faktur. Setiap bagian faktur adalah item baris pada faktur yang menunjukkan biaya yang dikeluarkan bulan itu.  Misalnya, Anda mungkin memerlukan satu faktur untuk organisasi Anda tetapi ingin mengatur biaya berdasarkan departemen, tim, atau proyek.

Bergantung pada kebutuhan Anda, Anda dapat menyiapkan beberapa faktur dalam akun penagihan yang sama. Untuk melakukan ini, buat profil penagihan tambahan. Setiap profil penagihan memiliki faktur bulanan dan metode pembayarannya sendiri.

Diagram berikut ini memperlihatkan gambaran umum tentang bagaimana penagihan disusun. Jika sebelumnya Anda telah mendaftar Azure atau jika organisasi Anda memiliki Perjanjian Perusahaan, tagihan Anda mungkin disiapkan secara berbeda.

:::image type="complex" source="../media/4-billing-structure-overview.png" alt-text="Diagram yang memperlihatkan gambaran umum struktur tagihan, dengan akun tagihan di bagian atas, hingga beberapa langganan Azure.":::
    Tingkat atas adalah satu akun tagihan, kemudian dibagi menjadi dua profil tagihan yang memiliki faktur dan metode pembayaran, kemudian tiap profil dibagi menjadi dua bagian faktur (total empat), yang kemudian masing-masing dibagi menjadi dua langganan Azure (total delapan).
:::image-end:::
