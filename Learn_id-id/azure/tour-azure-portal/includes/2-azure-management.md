Anda dapat mengonfigurasi dan mengelola Azure menggunakan berbagai alat serta platform. Ada alat yang tersedia untuk baris perintah, Kit Pengembangan Perangkat Lunak (SDK) khusus bahasa, alat pengembang, alat untuk migrasi, serta banyak lainnya.

Alat yang biasa digunakan untuk manajemen serta interaksi sehari-hari meliputi:

- portal Microsoft Azure **Portal Azure** untuk berinteraksi dengan Azure melalui Antarmuka Pengguna Grafis (GUI)
- **Azure PowerShell** dan **Azure Command-Line Interface** (CLI) untuk baris perintah serta interaksi berbasis otomatisasi dengan Azure
- **Azure Cloud Shell** untuk antarmuka baris perintah berbasis web
- **Aplikasi ponsel Azure** untuk memantau dan mengelola sumber daya Anda dari perangkat seluler Anda

## <a name="azure-portal"></a>Portal Azure

[portal Microsoft Azure](https://portal.azure.com) adalah situs web publik yang dapat Anda akses dengan browser web apa pun. Setelah masuk dengan akun Azure, Anda bisa membuat, mengelola, serta memantau layanan Azure yang tersedia. Anda dapat mengidentifikasi layanan yang Anda cari, mendapatkan tautan untuk mendapatkan bantuan tentang sebuah topik, serta menerapkan, mengelola, dan menghapus sumber daya. Ini juga memandu Anda melalui tugas administratif yang rumit menggunakan wizard dan tips alat.

![Cuplikan layar dari portal Microsoft Azure memperlihatkan navigasi sebelah kiri dan layanan Azure yang disarankan.](../media/2-azure-portal.png)

Tampilan dasbor menyediakan detail tingkat tinggi tentang lingkungan Azure Anda. Anda dapat mengkostumisasi dasbor dengan memindahkan dan mengubah ukuran ubin serta menampilkan layanan yang Anda minati.

Portal tidak menyediakan cara apa pun untuk mengotomatiskan tugas berulang. Misalnya, untuk menyiapkan beberapa VM, Anda harus membuatnya satu per satu dengan menyelesaikan wizard untuk setiap VM. Proses ini membuat pendekatan portal memakan waktu serta rawan kesalahan untuk tugas yang kompleks.

## <a name="azure-powershell"></a>Azure PowerShell

Azure PowerShell adalah modul yang dapat Anda instal untuk Windows PowerShell atau PowerShell Core, yang merupakan Versi lintas platform PowerShell yang berjalan pada Windows, Linux, atau macOS. Azure PowerShell memungkinkan Anda menyambungkan ke langganan Azure serta mengelola sumber daya. Windows PowerShell dan PowerShell Core menyediakan layanan seperti jendela shell serta penguraian perintah. Azure PowerShell kemudian menambahkan perintah khusus Azure.

Misalnya, Azure PowerShell menyediakan perintah `New-AzVM` yang membuat komputer virtual untuk Anda di dalam langganan Azure Anda. Untuk menggunakannya, Anda harus menjalankan PowerShell, menginstal modul Azure PowerShell, masuk ke akun Azure Anda menggunakan perintah `Connect-AzAccount`, lalu mengeluarkan perintah seperti:

```powershell
New-AzVM `
    -ResourceGroupName "MyResourceGroup" `
    -Name "TestVm" `
    -Image "UbuntuLTS" `
    ...
```

Membuat skrip administrasi adalah cara yang ampuh untuk mengoptimalkan alur kerja Anda. Anda dapat mengotomatisasi tugas berulang. Setelah skrip diverifikasi, skrip berjalan secara konsisten, yang dapat mengurangi kesalahan. Lingkungan skrip lainnya adalah Azure CLI.

## <a name="azure-cli"></a>Azure CLI

Azure CLI adalah program baris perintah lintas platform yang terhubung ke Azure dan menjalankan perintah administratif pada sumber daya Azure. *Lintas platform* berarti dapat dijalankan di Windows, Linux, atau macOS. Misalnya, untuk membuat VM, Anda akan membuka jendela prompt perintah, masuk ke Azure menggunakan perintah `az login`, membuat grup sumber daya, lalu menggunakan perintah seperti:

```azurecli
az vm create \
  --resource-group MyResourceGroup \
  --name TestVm \
  --image UbuntuLTS \
  --generate-ssh-keys \
  ...
```

## <a name="azure-cloud-shell"></a>Azure Cloud Shell

[Azure Cloud Shell](https://shell.azure.com/) adalah shell yang interaktif, terautentikasi, dan dapat diakses dengan browser untuk mengelola sumber daya Azure. Ini memberikan fleksibilitas memilih pengalaman shell yang paling sesuai dengan cara Anda bekerja, baik Bash atau PowerShell.

![Cuplikan layar dari instans Azure Cloud Shell menggunakan Bash dalam jendela browser Microsoft Edge.](../media/2-cloud-shell.png)

Anda dapat beralih di antara dua shell, dan keduanya mendukung modul Azure CLI serta Azure PowerShell. Bash secara default menggunakan Azure CLI (dengan perintah `az` yang telah dipasang sebelumnya), tetapi Anda dapat beralih ke PowerShell Core dalam Linux dengan mengetik `pwsh`. Lingkungan PowerShell memiliki kedua alat CLI yang telah diinstal sebelumnya. Selain alat administratif ini, Cloud Shell memiliki serangkaian alat pengembang, editor teks, serta alat lain yang tersedia, termasuk:

:::row:::
  :::column:::
**Alat Pengembang**

- .NET Core
- Python
- Java
- Node.js
- Go
  :::column-end:::
  :::column:::
**Editor**

- kode (Cloud Shell Editor)
- vim
- nano
- emacs
  :::column-end:::
  :::column:::
**Alat lain**

- git
- maven
- make
- npm
- [dan banyak lagi...](https://docs.microsoft.com/azure/cloud-shell/features#tools)
  :::column-end:::
:::row-end:::

Anda dapat membuat, membangun, dan menyebarkan aplikasi langsung dari lingkungan berbasis browser ini. Semuanya juga persisten - Anda diminta untuk membuat Akun Azure Storage saat Anda mengakses Azure Cloud Shell. Area penyimpanan ini digunakan sebagai folder $HOME, serta skrip atau data apa pun yang Anda tempatkan di sini disimpan di seluruh sesi. Setiap langganan memiliki akun penyimpanan unik yang terkait dengannya, sehingga Anda dapat menyimpan data serta alat yang Anda butuhkan khusus untuk setiap akun yang Anda kelola.

Kami akan menggunakan Cloud Shell di Microsoft Learn untuk berbagai latihan interaktif untuk mencoba fitur Azure.

## <a name="azure-mobile-app"></a>Aplikasi seluler Azure

:::row:::
  :::column:::
![Cuplikan layar aplikasi seluler Azure yang berjalan di ponsel memperlihatkan daftar Favorit sumber daya Azure.](../media/2-azure-mobile-app.png)
  :::column-end:::
  :::column span="3":::
[Aplikasi ponsel Microsoft Azure](https://aka.ms/azuremobileapp/) memungkinkan Anda untuk mengakses, mengelola, dan memantau semua akun dan sumber daya Azure dari ponsel atau tablet iOS atau Android Anda. Setelah diinstal, Anda dapat:

- Memeriksa status saat ini serta metrik penting layanan Anda
- Tetap mendapat informasi tentang pemberitahuan serta peringatan tentang masalah kesehatan penting
- Cepat mendiagnosis serta memperbaiki masalah kapan saja, di mana saja
- Meninjau pemberitahuan Azure terbaru
- Mulai, hentikan, dan mulai ulang komputer virtual atau aplikasi web
- Sambungkan ke komputer virtual Anda
- Kelola izin dengan kontrol akses berbasis peran (role-based access control/RBAC)
- Menggunakan Azure Cloud Shell untuk menjalankan skrip yang disimpan atau melakukan tugas administratif ad hoc
- dan banyak lagi...
  :::column-end:::
:::row-end:::

## <a name="other-options"></a>Opsi lainnya

Ada juga Azure SDK untuk berbagai bahasa dan kerangka kerja serta API REST yang dapat Anda gunakan untuk mengelola serta mengontrol sumber daya Azure secara terprogram. Untuk daftar lengkap alat yang tersedia, lihat halaman [Unduh](https://azure.microsoft.com/downloads/).

Saat memulai dengan Azure, Anda akan paling sering menggunakan portal Microsoft Azure. Mari kita lihat lebih dekat pada pendekatan portal.
