Dalam latihan ini, Anda membuat kebijakan di Azure Policy yang membatasi penyebaran sumber daya Azure ke lokasi tertentu. Anda memverifikasi kebijakan dengan mencoba membuat akun penyimpanan di lokasi yang melanggar kebijakan.

Tailwind Traders ingin membatasi lokasi di mana sumber daya dapat digunakan ke wilayah **AS Timur**. Hal ini memiliki dua alasan:

* **Pelacakan biaya yang disempurnakan**

    Untuk melacak biaya, Tailwind Traders menggunakan langganan yang berbeda untuk melacak penyebaran ke setiap lokasi regionalnya. Kebijakan tersebut akan memastikan bahwa semua sumber daya disebarkan ke wilayah **AS Timur**.

* **Patuhi residensi data dan kepatuhan keamanan**

    Tailwind Traders harus mematuhi aturan kepatuhan yang menyatakan di mana data pelanggan dapat disimpan. Di sini, data pelanggan harus disimpan di wilayah **AS Timur**.

Ingat bahwa Anda bisa menetapkan kebijakan ke grup manajemen, langganan tunggal, atau grup sumber daya. Di sini, Anda menetapkan kebijakan ke grup sumber daya sehingga kebijakan tidak memengaruhi sumber daya lain dalam langganan Azure Anda.

> [!IMPORTANT]
> Anda memerlukan [langganan Azure](https://azure.microsoft.com/free/?azure-portal=true) Anda sendiri untuk menyelesaikan latihan dalam modul ini. Jika Anda tidak memiliki langganan Azure, maka Anda masih bisa membacanya.

## <a name="create-the-resource-group"></a>Membuat grup sumber daya

Di sini Anda membuat grup sumber daya yang bernama **my-test-rg**. Ini adalah grup sumber daya tempat Anda menerapkan kebijakan lokasi Anda.

Untuk tujuan pembelajaran, Anda menggunakan nama grup sumber daya yang sama dengan yang Anda gunakan dalam latihan sebelumnya. Anda bisa menggunakan nama yang sama karena Anda menghapus grup sumber daya sebelumnya.

1. Buka [portal Microsoft Azure](https://portal.azure.com?azure-portal=true), dan masuk.

1. Pilih **Buat sumber daya**.

1. Masukkan **grup sumber daya** di kotak telusur, dan tekan <kbd>Enter</kbd>.

1. Jika Anda dibawa ke panel hasil pencarian, pilih **Grup sumber daya** dari hasil.

1. Pilih **Buat**. Lalu, masukkan nilai berikut untuk setiap pengaturan.

    | Pengaturan | Nilai |
    | -- | -- |
    | **Langganan** | *(Langganan Azure Anda)* |
    | **Langganan > Grup sumber daya** | **my-test-rg** |
    | **Wilayah** | **(AS) AS Timur** |

1. Pilih **Tinjau + buat**, lalu pilih **Buat**.

## <a name="explore-predefined-policies"></a>Jelajahi kebijakan yang telah ditentukan sebelumnya

Sebelum Mengonfigurasi kebijakan lokasi, mari kita lihat beberapa kebijakan yang telah ditentukan sebelumnya. Sebagai contoh, Anda akan melihat kebijakan yang terkait dengan layanan Azure Compute.

1. Dari portal Microsoft Azure, di bagian atas halaman, pilih **Beranda** untuk kembali ke halaman mulai.

1. Di bagian atas halaman, masukkan **kebijakan** di kotak pencarian. Kemudian, pilih **Policy** dari daftar hasil untuk mengakses Azure Policy.

1. Di bawah **Penulisan**, pilih **Definisi**.

1. Dari daftar tarik turun **Kategori**, pilih hanya **Hitung**.

    Perhatikan bahwa definisi **SKU komputer virtual yang** diizinkan memungkinkan Anda menentukan seperangkat SKU komputer virtual yang dapat digunakan organisasi Anda.

    :::image type="content" source="../media/10-policy-category-compute.png" alt-text="Cuplikan layar portal Microsoft Azure memperlihatkan definisi kebijakan di bawah kategori Komputasi. Definisi SKU komputer virtual yang diizinkan disorot.":::

Sebagai langkah opsional, jelajahi kebijakan atau kategori lain yang menarik bagi Anda.

## <a name="configure-the-location-policy"></a>Mengonfigurasi kebijakan lokasi

Di sini Anda mengonfigurasi kebijakan lokasi yang diizinkan dengan menggunakan Azure Policy. Kemudian Anda menetapkan kebijakan tersebut ke grup sumber daya Anda. Untuk melakukannya:

1. Dari panel **Kebijakan**, di bawah **Penulisan**, pilih **Tugas**.

    :::image type="content" source="../media/10-policy-assignments.png" alt-text="Cuplikan layar dari portal Microsoft Azure memperlihatkan item menu Tugas.":::

    Tugas adalah kebijakan yang telah ditetapkan untuk berlangsung dalam lingkup tertentu. Misalnya, definisi dapat ditetapkan ke lingkup langganan.

1. Pilih **Tetapkan Kebijakan**.

    :::image type="content" source="../media/10-assign-policy.png" alt-text="Cuplikan layar dari portal Microsoft Azure memperlihatkan item menu Tetapkan kebijakan.":::

    Anda akan diarahkan ke panel **Tetapkan kebijakan**.

1. Di bawah **Cakupan**, pilih elipsis.

    Dari kotak dialog yang muncul, atur:

    1. Bidang **Langganan** ke langganan Azure Anda.
    1. Bidang **Grup Sumber Daya** ke **my-test-rg**.
    1. Pilih **Pilih**.

1. Di bawah **Definisi kebijakan**, pilih elipsis.

    1. Di bilah pencarian, masukkan *lokasi*.
    1. Pilih definisi **Lokasi yang diizinkan**.
    1. Pilih **Pilih**.

    :::image type="content" source="../media/9-available-definitions-pane.png" alt-text="Cuplikan layar dari portal Microsoft Azure memperlihatkan bilah pencarian. Di panel hasil, definisi kebijakan Lokasi yang diizinkan disorot.":::

    Definisi kebijakan ini menentukan lokasi di mana semua sumber daya harus digunakan. Jika lokasi berbeda dipilih, penyebaran akan gagal.

1. Pilih **Berikutnya** untuk pindah ke tab **Parameter**.

1. Dari daftar tarik-turun **Lokasi yang diizinkan**, pilih **AS Timur**.

1. Pilih **Tinjau + buat**, lalu pilih **Buat**.

    Anda melihat bahwa penetapan kebijakan **Lokasi yang diizinkan** sekarang tercantum di **Kebijakan | Panel Tugas**. Ini memberlakukan kebijakan pada grup sumber daya **my-test-rg**.

    :::image type="content" source="../media/10-policy-assignment-result.png" alt-text="Cuplikan layar dari portal Microsoft Azure menunjukkan penetapan kebijakan Lokasi yang diizinkan yang tercantum dalam Kebijakan | Panel Tugas.":::

## <a name="verify-the-location-policy"></a>Verifikasi kebijakan lokasi

Di sini Anda mencoba menambahkan akun penyimpanan ke grup sumber daya Anda di lokasi yang melanggar kebijakan lokasi Anda.

1. Dari portal Microsoft Azure, di bagian atas halaman, pilih **Beranda** untuk kembali ke halaman mulai.

1. Pilih **Buat sumber daya**.

1. Masukkan **akun penyimpanan** di kotak telusur, dan tekan <kbd>Enter</kbd>.

1. Jika Anda dibawa ke panel hasil pencarian, pilih **Akun penyimpanan** dari hasil tersebut.

1. Pilih **Buat**. Lalu, masukkan nilai berikut untuk setiap pengaturan.

    > [!NOTE]
    > Ganti **NNN** dengan serangkaian angka. Numbers membantu memastikan bahwa nama akun penyimpanan Anda unik.

    | Pengaturan | Nilai |
    | --- | --- |
    | **Langganan** | *(Langganan Azure Anda)* |
    | **Langganan > Grup sumber daya** | **my-test-rg** |
    | **Nama akun penyimpanan** | **mysaNNN** |
    | **Lokasi** | **(Asia Timur) Jepang Timur** |
    | **Performa** | **Standard** |
    | **Jenis akun** | **StorageV2 (V2 serbaguna)** |
    | **Replikasi** | **Penyimpanan redundan secara lokal (LRS)** |
    | **Tingkat akses (default)** | **Populer** |

    Jika sebelumnya Anda memilih **Jepang Timur** dalam kebijakan lokasi Anda, pilih wilayah lain dari daftar.

1. Pilih **Tinjau + buat**, lalu pilih **Buat**.

    Anda melihat pesan yang menyatakan bahwa penyebaran gagal karena pelanggaran kebijakan. Anda juga melihat detail penyebaran.

    Berikut adalah contoh yang menunjukkan detail penerapan untuk akun penyimpanan bernama **mysa1234**.

    :::image type="content" source="../media/10-create-sa-error-policy-violation.png" alt-text="Cuplikan layar dari portal Microsoft Azure memperlihatkan pesan detail penyebaran. Detailnya termasuk nama sumber daya, jenisnya, dan status Terlarang.":::

## <a name="delete-the-policy-assignment"></a>Hapus penetapan kebijakan

Anda tidak lagi memerlukan penetapan kebijakan Anda. Di sini Anda menghapusnya dari langganan Anda.

1. Dari portal Microsoft Azure, pilih **Beranda** > **Kebijakan**.

1. Di bawah **Penulisan**, pilih **Tugas**.

1. Pada baris **Lokasi yang diizinkan**, pilih elipsis. Kemudian, pilih **Hapus tugas**. Saat diminta, pilih **Ya**.

    :::image type="content" source="../media/10-policy-delete-assignment.png" alt-text="Cuplikan layar dari portal Microsoft Azure memperlihatkan item menu Hapus tugas.":::

    Anda melihat bahwa penetapan kebijakan **Lokasi yang diizinkan** sudah tidak ada.

Sebagai langkah opsional, Anda dapat mencoba membuat akun penyimpanan untuk kedua kalinya untuk memverifikasi bahwa kebijakan tersebut tidak lagi berlaku.

## <a name="delete-the-resource-group"></a>Menghapus grup sumber daya

Anda tidak lagi memerlukan grup sumber daya Anda. Di sini Anda menghapusnya dari langganan Anda.

1. Dari portal Microsoft Azure, pilih **Beranda** > **Grup sumber daya** > **my-test-rg** untuk masuk ke grup sumber daya Anda.

1. Pilih **Gambaran Umum**, lalu pilih **Hapus grup sumber daya**.

1. Saat diminta, masukkan **my-test-rg**, lalu pilih **OK**.

    Operasi penghapusan mungkin membutuhkan beberapa saat untuk selesai.
1. Setelah operasi selesai, pilih **Beranda** > **Grup sumber daya**.

    Anda melihat bahwa grup sumber daya **my-test-rg** tidak ada lagi di akun Anda.

Bagus sekali! Anda telah berhasil menerapkan kebijakan dengan menggunakan Azure Policy untuk membatasi penyebaran sumber daya Azure ke lokasi tertentu. Anda sekarang dapat menerapkan kebijakan yang Anda perlukan di grup manajemen, langganan, atau tingkat grup sumber daya.
