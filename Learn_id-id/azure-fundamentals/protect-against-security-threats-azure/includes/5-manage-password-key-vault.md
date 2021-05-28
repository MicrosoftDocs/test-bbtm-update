Dalam latihan ini, Anda menambahkan kata sandi ke Azure Key Vault. Kata sandi adalah contoh informasi sensitif yang perlu Anda lindungi. Kemudian, Anda membaca kata sandi dari Azure Key Vault untuk memverifikasi bahwa kata sandi tersebut dapat diakses.

Dalam praktiknya, ada beberapa cara untuk menambahkan rahasia ke dan membaca rahasia dari Key Vault. Anda dapat menggunakan portal Azure, Azure CLI, atau Azure PowerShell. Dengan menggunakan bahasa pemrograman favorit Anda, aplikasi Anda juga dapat mengakses rahasia yang dibutuhkan dengan aman.

Di sini, Anda membuat rahasia di Key Vault menggunakan portal Azure. Kemudian, Anda mengakses rahasia dari portal dan dari Azure CLI di Azure Cloud Shell.

Azure CLI adalah cara untuk bekerja dengan sumber daya Azure dari baris perintah atau dari skrip. Cloud Shell adalah pengalaman shell berbasis browser untuk mengelola dan mengembangkan sumber daya Azure. Bayangkan Cloud Shell sebagai konsol interaktif yang berjalan di cloud.

## <a name="create-a-key-vault"></a>Membuat brankas kunci

1. Masuk ke [portal Azure](https://portal.azure.com/learn.docs.microsoft.com?azure-portal=true).

1. Pada menu portal Azure, atau dari halaman **Beranda**, pilih **Buat sumber daya**.

1. Dari bilah pencarian, masukkan **Key Vault**, lalu pilih **Key Vault** dari hasil.

1. Pada panel **Key Vault**, pilih **Buat**. Panel **Buat brankas kunci** akan muncul.

1. Pada tab **Dasar**, isi nilai berikut ini untuk setiap pengaturan.

    > [!NOTE]
    > Ganti *NNN* dengan serangkaian angka. Ini membantu memastikan bahwa nama brankas kunci Anda bersifat unik.

    | Pengaturan | Nilai |
    | --- | --- |
     **Detail proyek** |
    | Langganan | **Langganan Concierge** |
    | Grup sumber daya | **<rgn>[nama grup sumber daya kotak pasir]</rgn>** |
    | **Detail instans** |
    | Nama brankas kunci | **my-keyvault-NNN** |

    Biarkan pengaturan lain pada nilai defaultnya.

1. Pilih **Tinjau + buat**, dan setelah melewati validasi, pilih **Buat**.

    Tunggu penyebaran berhasil diselesaikan.

1. Pilih **Buka sumber daya**.

1. Perhatikan beberapa detail tentang brankas kunci Anda.

    Misalnya, bidang **URI Vault** menampilkan URI yang dapat digunakan aplikasi Anda untuk mengakses brankas Anda dari REST API.

    Berikut adalah contoh brankas kunci yang bernama **my-keyvault-321**:

    :::image type="content" source="../media/5-portal-key-vault-overview.png" alt-text="Cuplikan layar portal Azure yang menampilkan detail tentang brankas kunci. Ini menampilkan bidang seperti grup sumber daya induk, lokasi, dan nama DNS.":::

1. Sebagai langkah opsional, di panel menu kiri, pada **Pengaturan**, periksa beberapa fitur lainnya.

    Meskipun awalnya kosong, di sini Anda akan menemukan tempat untuk menyimpan kunci, rahasia, dan sertifikat.

    > [!NOTE]
    > Langganan Azure Anda adalah satu-satunya yang diotorisasi untuk mengakses brankas ini. Pada **Pengaturan**, fitur **Kebijakan akses** memungkinkan Anda mengonfigurasi akses ke brankas.

## <a name="add-a-password-to-the-key-vault"></a>Menambahkan kata sandi ke brankas kunci

1. Di panel menu kiri, pada **Pengaturan**, pilih **Rahasia**. Panel brankas kunci Anda akan muncul.

1. Dari bilah menu teratas, pilih **Buat/Impor**. Panel **Buat rahasia** akan muncul.

1. Isi nilai berikut untuk setiap pengaturan.

    | Pengaturan | Nilai |
    | --- | --- |
    | Opsi pengunggahan | **Manual** |
    | Nama | **MyPassword** |
    | Nilai | **hVFkk96** |

    Biarkan pengaturan lain pada nilai defaultnya. Perhatikan bahwa Anda dapat menentukan properti seperti tanggal aktivasi dan tanggal kedaluwarsa. Anda juga dapat menonaktifkan akses ke rahasia.

1. Pilih **Buat**.

## <a name="show-the-password"></a>Menampilkan kata sandi

Di sini, Anda mengakses kata sandi dari Key Vault dua kali. Pertama, Anda mengaksesnya dari portal Azure. Selanjutnya, Anda mengaksesnya dari Azure CLI.

1. Dari panel **Key Vault/Rahasia**, pilih **MyPassword**. Panel **MyPassword/Versi** akan muncul. Anda melihat bahwa versi saat ini diaktifkan.

1. Pilih versi saat ini. Panel **Versi Rahasia** akan muncul.

    Pada **Pengidentifikasi Rahasia**, Anda melihat URI yang sekarang dapat digunakan dengan aplikasi untuk mengakses rahasia. Ingat bahwa hanya aplikasi yang diotorisasi yang dapat mengakses rahasia ini.

1. Pilih **Tampilkan Nilai Rahasia**.

    :::image type="content" source="../media/5-portal-secret-value.png" alt-text="Cuplikan layar portal Azure yang menampilkan nilai rahasia di brankas kunci":::.

1. Dari Cloud Shell, jalankan perintah ini.

    > [!NOTE]
    > Jika Anda tidak memahami Azure CLI, ikuti saja perintahnya.

    ```azurecli
    az keyvault secret show \
      --name MyPassword \
      --vault-name $(az keyvault list --query [0].name --output tsv) \
      --query value \
      --output tsv
    ```

    Anda melihat kata sandi dalam output.

    ```output
    hVFkk96
    ```

Kerja bagus! Pada titik ini, Anda memiliki brankas kunci yang berisi rahasia kata sandi yang disimpan dengan aman untuk digunakan dengan aplikasi Anda.

[!include[](../../../includes/azure-sandbox-cleanup.md)]
