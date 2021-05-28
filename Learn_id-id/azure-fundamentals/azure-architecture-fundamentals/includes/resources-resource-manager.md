Setelah Anda membuat langganan untuk Tailwind Trader, Anda siap untuk mulai membuat sumber daya dan menyimpannya dalam grup sumber daya. Dengan mengingat hal itu, penting untuk menentukan istilah-istilah tersebut:

- **Sumber daya**: Item yang dapat dikelola yang tersedia melalui Azure. Komputer Virtual (VMs), akun penyimpanan, aplikasi web, database, dan jaringan virtual adalah contoh sumber daya.
- **Grup sumber daya**: Kontainer yang menyimpan sumber daya terkait untuk solusi Azure. Grup sumber daya menyertakan sumber daya yang ingin Anda kelola sebagai grup. Anda memutuskan sumber daya mana yang termasuk dalam grup sumber daya berdasarkan apa yang paling masuk akal bagi organisasi Anda.

## <a name="azure-resource-groups"></a>Grup sumber daya Azure

Grup sumber daya adalah elemen mendasar dari platform Azure. Grup sumber daya adalah kontainer logis untuk sumber daya yang diterapkan di Azure. Sumber daya ini adalah apa pun yang Anda buat dalam langganan Azure seperti VM, instans Azure Application Gateway, dan instans Azure Cosmos DB. Semua sumber daya harus berada dalam grup sumber daya, dan sumber daya hanya dapat menjadi anggota grup sumber daya tunggal. Banyak sumber daya dapat dipindahkan antar grup sumber daya dengan beberapa layanan memiliki batasan atau persyaratan khusus untuk dipindahkan. Grup sumber daya tidak dapat ditumpuk. Sebelum sumber daya apa pun dapat disediakan, Anda memerlukan grup sumber daya untuk ditempatkan.

### <a name="logical-grouping"></a>Pengelompokan logika

Grup sumber daya ada untuk membantu mengelola dan mengatur sumber daya Azure Anda. Dengan menempatkan sumber daya penggunaan, jenis, atau lokasi serupa dalam grup sumber daya, Anda bisa menyediakan pesanan dan organisasi ke sumber daya yang Anda buat di Azure. Pengelompokan logis adalah aspek yang paling Anda minati di sini, karena ada banyak gangguan di antara sumber daya kami.

![Gambar konseptual menunjukkan kotak grup sumber daya dengan fungsi, VM, database, dan aplikasi disertakan.](../media/resource-group.png)

### <a name="life-cycle"></a>Siklus hidup

Jika Anda menghapus grup sumber daya, semua sumber daya yang terdapat di dalamnya juga akan dihapus. Mengatur sumber daya berdasarkan siklus hidup dapat berguna di lingkungan nonproduksi, di mana Anda dapat mencoba eksperimen dan kemudian membuangnya. Grup sumber daya memudahkan untuk menghapus sekumpulan sumber daya sekaligus.

### <a name="authorization"></a>Authorization

Grup sumber daya juga merupakan ruang lingkup untuk menerapkan izin kontrol akses berbasis peran (RBAC). Dengan menerapkan izin RBAC ke grup sumber daya, Anda dapat mempermudah administrasi dan membatasi akses untuk hanya mengizinkan apa yang diperlukan.

## <a name="azure-resource-manager"></a>Azure Resource Manager

Azure Resource Manager adalah layanan penerapan dan manajemen untuk Azure. Azure Resource Manager menyediakan lapisan manajemen yang memungkinkan Anda membuat, memperbarui, dan menghapus sumber daya di akun Azure Anda. Anda menggunakan fitur manajemen seperti kontrol akses, kunci, dan tag untuk mengamankan dan mengatur sumber daya Anda setelah penerapan.

Saat pengguna mengirim permintaan dari salah satu alat Azure, API, atau SDK, Resource Manager akan menerima permintaan tersebut. Resource Manager mengotentikasi dan mengotorisasi permintaan. Resource Manager mengirimkan permintaan ke layanan Azure, yang mengambil tindakan yang diminta. Karena semua permintaan ditangani melalui API yang sama, Anda akan melihat hasil dan kemampuan yang konsisten di semua alat yang berbeda.

Gambar berikut menunjukkan peran Resource Manager yang dimainkan dalam menangani permintaan Azure.

[![Diagram menunjukkan model permintaan Resource Manager.](../media/consistent-management-layer.png)](../media/consistent-management-layer-expanded.png#lightbox)

Semua kemampuan yang tersedia di portal Azure juga tersedia melalui PowerShell, Azure CLI, REST API, dan SDK klien. Fungsionalitas yang awalnya dirilis melalui API akan diwakili di portal dalam waktu 180 hari sejak rilis awal.

### <a name="the-benefits-of-using-resource-manager"></a>Manfaat menggunakan Resource Manager

Dengan Resource Manager, Anda dapat:

- Mengelola infrastruktur Anda melalui templat deklaratif daripada skrip. Templat Resource Manager adalah file JSON yang menentukan apa yang ingin Anda terapkan ke Azure.
- Terapkan, kelola, dan pantau semua sumber daya untuk solusi Anda sebagai grup, daripada menangani sumber daya ini satu per satu.
- Terapkan ulang solusi Anda sepanjang siklus hidup pengembangan dan percayalah sumber daya Anda diterapkan dalam keadaan yang konsisten.
- Tentukan dependensi antar sumber daya sehingga diterapkan dalam urutan yang benar.
- Terapkan kontrol akses ke semua layanan karena RBAC secara alami terintegrasi ke dalam platform manajemen.
- Terapkan tag ke sumber daya untuk menata semua sumber daya dalam langganan Anda secara logis.
- Klarifikasi tagihan organisasi Anda dengan menampilkan biaya untuk sekelompok sumber daya yang memiliki tag yang sama.

[//]: # (CATATAN: HAPUS YANG BERIKUT INI)
[//]: # (### Pahami ruang lingkup)
[//]: # (Azure menyediakan empat tingkat lingkup: grup manajemen, langganan, grup sumber daya, dan sumber daya. Gambar berikut menunjukkan contoh lapisan ini.)
[//]: # (![Hierarki dari berbagai tingkat manajemen.].. /media/scope-levels.png)
[//]: # (### Tingkat manajemen)
[//]: # (Anda menerapkan pengaturan manajemen di salah satu tingkat lingkup ini. Tingkat yang Anda pilih menentukan seberapa luas pengaturan diterapkan. Tingkat yang lebih rendah mewarisi pengaturan dari tingkat yang lebih tinggi. Misalnya, saat Anda menerapkan kebijakan ke langganan, kebijakan diterapkan ke semua grup sumber daya dan sumber daya di langganan Anda. Saat Anda menerapkan kebijakan pada grup sumber daya, kebijakan tersebut diterapkan grup sumber daya dan semua sumber dayanya. Namun, grup sumber daya lain tidak memiliki penetapan kebijakan tersebut.)
[//]: # (Anda dapat menggunakan templat ke penyewa, grup manajemen, langganan, atau grup sumber daya.)

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RWyvOc]