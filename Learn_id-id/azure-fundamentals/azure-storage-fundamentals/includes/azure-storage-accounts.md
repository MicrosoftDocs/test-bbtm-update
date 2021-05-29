Kepala Petugas Teknologi (CTO) untuk perusahaan Anda, Tailwind Traders, telah menugaskan tim untuk memigrasikan semua file Anda ke cloud. Tim Anda telah memilih [MIcrosoft Azure Storage](https://azure.microsoft.com/product-categories/storage?azure-portal=true), yang merupakan layanan yang dapat Anda gunakan untuk menyimpan file, pesan, tabel, dan jenis informasi lainnya. Klien seperti situs web, aplikasi seluler, aplikasi desktop, dan banyak jenis solusi kustom lainnya dapat membaca data dari dan menulis data ke Microsoft Azure Storage. Microsoft Azure Storage juga digunakan oleh komputer virtual infrastruktur sebagai layanan, dan layanan cloud platform sebagai layanan.

Video berikut memperkenalkan berbagai layanan yang harus tersedia dengan Microsoft Azure Storage.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4MAbS]

Untuk mulai menggunakan Microsoft Azure Storage, Anda terlebih dahulu membuat akun Microsoft Azure Storage untuk menyimpan objek data. Anda dapat membuat akun Microsoft Azure Storage menggunakan portal Microsoft Azure, PowerShell, atau Azure CLI.

[![Cuplikan layar membuat akun penyimpanan.](../media/create-storage-account.png)](../media/create-storage-account-expanded.png#lightbox)

Akun penyimpanan Anda akan berisi semua objek data Microsoft Azure Storage, seperti blob, file, dan disk.

> [!NOTE]
> 
> Komputer Virtual Azure menggunakan Azure Disk Storage untuk menyimpan disk virtual. Namun, Anda tidak dapat menggunakan Azure Disk Storage untuk menyimpan disk di luar komputer virtual.

![Diagram hierarki akun penyimpanan.](../media/account-container-blob.png)

Akun penyimpanan menyediakan namespace unik untuk data Microsoft Azure Storage, yang dapat diakses dari mana saja di seluruh dunia melalui HTTP atau HTTPS. Data dalam akun ini aman, sangat tersedia, tahan lama, dan dapat diskalakan secara besar-besaran.

Untuk informasi selengkapnya, lihat [Membuat akun penyimpanan](https://docs.microsoft.com/azure/storage/common/storage-account-create?azure-portal=true).
