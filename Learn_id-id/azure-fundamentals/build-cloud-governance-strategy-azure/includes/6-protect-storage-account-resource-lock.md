Dalam latihan ini, Anda akan melihat bagaimana kunci sumber daya membantu mencegah penghapusan sumber daya Azure Anda secara tidak disengaja.

Untuk melakukannya, Anda membuat grup sumber daya dari portal Microsoft Azure. Pikirkan grup sumber daya sebagai kontainer untuk sumber daya Azure terkait. Kemudian Anda menambahkan kunci ke grup sumber daya dan memverifikasi bahwa Anda tidak dapat menghapus grup sumber daya.

Anda kemudian menambahkan akun penyimpanan ke grup sumber daya Anda dan melihat bagaimana kunci dari grup sumber daya induk mencegah akun penyimpanan dihapus. Akun penyimpanan adalah wadah yang mengelompokkan sekumpulan layanan Microsoft Azure Storage.

> [!IMPORTANT]
> Anda memerlukan [langganan Azure](https://azure.microsoft.com/free/?azure-portal=true) Anda sendiri untuk menyelesaikan latihan dalam modul ini. Jika Anda tidak memiliki langganan Azure, maka Anda masih bisa membacanya.

## <a name="create-the-resource-group"></a>Membuat grup sumber daya

Di sini Anda membuat grup sumber daya yang bernama **my-test-rg**.

1. Buka [portal Microsoft Azure](https://portal.azure.com?azure-portal=true) dan masuk.

1. Di bagian atas halaman, pilih **Grup sumber daya**.

1. Pilih **+ Baru**. Halaman **Buat grup sumber daya** muncul.

1. Di tab **Dasar**, isi bidang berikut ini.

    | Pengaturan | Nilai |
    | -- | -- |
    | **Detail Proyek**| |
    | Langganan | *Pilih langganan Azure Anda* |
    | Grup sumber daya | **my-test-rg** |
    | **Detail sumber daya**| |
    | Wilayah | **(AS) AS Timur** |

    Anda juga dapat memilih wilayah yang lebih dekat dengan Anda.

1. Pilih **Tinjau + buat**, lalu pilih **Buat**.

## <a name="add-a-lock-to-the-resource-group"></a>Menambahkan kunci ke grup sumber daya

Menambahkan kunci sumber daya ke grup sumber daya. Untuk melakukannya:

1. Dari portal Microsoft Azure, pilih grup sumber daya Anda, **my-test-rg**.

1. Di bawah **Setelan**, pilih **Kunci**, lalu pilih **Tambahkan**.

    :::image type="content" source="../media/7-portal-add-lock.png" alt-text="Cuplikan layar dari portal Microsoft Azure memperlihatkan cara menambahkan kunci sumber daya.":::

1. Isi bidang ini.

    | Pengaturan | Nilai |
    | -- | -- |
    | Nama kunci | **rg-delete-lock** |
    | Jenis kunci | **Hapus** |

1. Pilih **OK**.

    Anda melihat bahwa kunci sumber daya diterapkan ke grup sumber daya Anda.

    :::image type="content" source="../media/7-portal-rg-lock.png" alt-text="Cuplikan layar dari portal Microsoft Azure memperlihatkan kunci sumber daya. Tipe kunci adalah Hapus, dan lingkupnya adalah grup sumber daya induk.":::

## <a name="verify-that-the-resource-group-is-protected-from-deletion"></a>Memverifikasi bahwa grup sumber daya dilindungi dari penghapusan

Di sini, Anda memverifikasi proteksi dengan mencoba menghapus grup sumber daya.

1. Dari bagian atas halaman, pilih **my-test-rg untuk** masuk ke halaman gambaran umum grup sumber daya Anda.

    :::image type="content" source="../media/7-portal-select-rg.png" alt-text="Cuplikan layar dari portal Microsoft Azure memperlihatkan lokasi tautan ke halaman gambaran umum grup sumber daya.":::

1. Pilih **Hapus grup sumber daya**.

    :::image type="content" source="../media/7-portal-delete-rg.png" alt-text="Cuplikan layar portal Microsoft Azure yang menampilkan entri Hapus grup sumber daya.":::

1. Saat diminta, masukkan **my-test-rg**, lalu pilih **OK**.

    Anda akan melihat pesan yang memberi tahu Anda bahwa grup sumber daya dikunci dan tidak dapat dihapus.

    :::image type="content" source="../media/6-delete-locks-failed.png" alt-text="Cuplikan layar dari pesan kegagalan. Pesan memberi tahu Anda bahwa sumber daya tidak dapat dihapus karena terkunci.":::

## <a name="protect-a-storage-account-from-accidental-deletion"></a>Lindungi akun penyimpanan dari penghapusan yang tidak disengaja

Di sini, Anda menambahkan akun penyimpanan ke grup sumber daya Anda dan melihat bagaimana kunci dari grup sumber daya induk mencegah akun penyimpanan dihapus. Untuk melakukannya:

1. Dari portal Microsoft Azure, di bagian atas halaman, pilih **Beranda** untuk kembali ke halaman mulai.

1. Pilih **Akun penyimpanan**. Kemudian pilih **+ Baru**. Panel **Buat akun penyimpanan** muncul.

1. Di tab **Dasar**, isi bidang berikut ini.

    > [!NOTE]
    > Ganti **NNN** dengan serangkaian angka. Angka-angka tersebut membantu memastikan bahwa nama akun penyimpanan Anda unik.

    | Pengaturan | Nilai |
    | --- | --- |
    | **Detail Proyek**| |
    | Langganan | *Pilih langganan Azure Anda* |
    | Grup sumber daya | **my-test-rg** |
    | **contoh detail**| |
    | Nama akun penyimpanan | **mysaNNN** |
    | Lokasi | **(AS) AS Timur** |
    | Performa | **Standard** |
    | Jenis akun | **StorageV2 (V2 serbaguna)** |
    | Replikasi | **Penyimpanan redundan secara lokal (LRS)** |

    Seperti sebelumnya, Anda juga dapat memilih wilayah yang lebih dekat dengan Anda.

1. Pilih **Tinjau + buat**, lalu pilih **Buat**.

    Penyebaran mungkin perlu beberapa saat untuk menyelesaikannya.

1. Pilih **Buka sumber daya**.

1. Di bagian atas halaman, pilih **Hapus**.

    :::image type="content" source="../media/7-portal-delete-sa.png" alt-text="Cuplikan layar dari portal Microsoft Azure memperlihatkan lokasi tombol Hapus.":::

    Anda akan melihat pesan yang memberi tahu Anda sumber daya atau induknya terkunci dan tidak dapat dihapus. Berikut ini contoh yang memperlihatkan pesan kesalahan untuk akun penyimpanan yang bernama **mysa1234**.

    :::image type="content" source="../media/6-delete-failed.png" alt-text="Cuplikan layar dari portal Microsoft Azure memperlihatkan pesan kesalahan. Pesan kesalahan menyatakan bahwa akun penyimpanan tidak dapat dihapus karena sumber daya atau grup sumber daya induknya dikunci.":::

Meskipun Anda tidak membuat kunci khusus untuk akun penyimpanan, kunci yang Anda buat untuk grup sumber daya induk mencegah Anda menghapus sumber daya. Dengan kata lain, akun penyimpanan mewarisi kunci dari grup sumber daya induk.

## <a name="delete-the-resource-group-and-the-storage-account"></a>Menghapus grup sumber daya dan akun penyimpanan

Anda tidak lagi memerlukan grup sumber daya atau akun penyimpanan Anda. Di sini Anda menghapus keduanya.

Saat menghapus grup sumber daya, Anda juga menghapus sumber daya anaknya, seperti akun penyimpanan yang sebelumnya Anda buat.

Untuk menghapus grup sumber daya, Anda harus menghapus kunci sumber daya terlebih dahulu.

1. Dari portal Microsoft Azure, pilih **Beranda** > **Grup sumber daya** > **my-test-rg** untuk masuk ke grup sumber daya Anda.

1. Di bawah **Setelan**, pilih **Kunci**.

1. Temukan **rg-delete-lock**, dan pilih **Hapus** di baris yang sama.

1. Pilih **Gambaran Umum**, lalu pilih **Hapus grup sumber daya**.

1. Saat diminta, masukkan **my-test-rg**, lalu pilih **OK**.

    Operasi penghapusan mungkin membutuhkan beberapa saat untuk selesai.

1. Saat operasi selesai, pilih **Beranda** > **Grup sumber daya**.

    Anda melihat bahwa grup sumber daya **my-test-rg** tidak ada lagi di akun Anda. Akun penyimpanan Anda juga dihapus.

Kerja bagus. Sekarang Anda dapat menerapkan kunci sumber daya untuk membantu mencegah penghapusan sumber daya Azure Anda yang tidak disengaja.
