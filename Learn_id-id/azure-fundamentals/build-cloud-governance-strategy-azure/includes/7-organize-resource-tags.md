Seiring pertumbuhan penggunaan cloud Anda, semakin penting untuk tetap terorganisir. Strategi organisasi yang baik membantu Anda memahami penggunaan cloud dan dapat membantu Anda mengelola biaya.

Misalnya, ketika Tailwind Traders membuat prototipe cara baru untuk menerapkan aplikasinya di Azure, perlu cara untuk menandai lingkungan pengujiannya sehingga dapat dengan mudah mengidentifikasi dan menghapus sumber daya di lingkungan ini saat tidak lagi diperlukan.

Salah satu cara untuk mengatur sumber daya terkait adalah dengan menempatkannya dalam langganan mereka sendiri. Anda juga dapat menggunakan grup sumber daya untuk mengelola sumber daya terkait. Tag _sumber daya_ adalah cara lain untuk mengatur sumber daya. Tag menyediakan informasi tambahan, atau metadata, mengenai sumber daya Anda. Metadata ini berguna untuk:

* **Manajemen sumber daya**

    Tag memungkinkan Anda menemukan dan bertindak berdasarkan sumber daya yang terkait dengan beban kerja, lingkungan, unit bisnis, dan pemilik tertentu.
* **Manajemen dan pengoptimalan biaya**

    Tag memungkinkan Anda untuk mengelompokkan sumber daya sehingga Anda dapat melaporkan biaya, mengalokasikan pusat biaya internal, melacak anggaran, dan memperkirakan perkiraan biaya.
* **Manajemen operasi**

    Tag memungkinkan Anda untuk mengelompokkan sumber daya sesuai dengan seberapa penting ketersediaannya bagi bisnis Anda. Pengelompokan ini membantu Anda merumuskan perjanjian tingkat layanan (SLA). SLA adalah jaminan waktu aktif atau kinerja antara Anda dan pengguna Anda.
* **Keamanan**

    Tag memungkinkan Anda mengklasifikasikan data berdasarkan tingkat keamanannya, seperti *publik* atau *rahasia*.
* **Tata kelola dan kepatuhan terhadap peraturan**

    Tag memungkinkan Anda mengidentifikasi sumber daya yang selaras dengan persyaratan tata kelola atau kepatuhan terhadap peraturan, seperti ISO 27001.

    Tag juga dapat menjadi bagian dari upaya penegakan standar Anda. Misalnya, Anda mungkin mengharuskan semua sumber daya ditandai dengan pemilik atau nama departemen.
* **Pengoptimalan dan otomatisasi beban kerja**

    Tag dapat membantu Anda memvisualisasikan semua sumber daya yang berpartisipasi dalam penyebaran yang kompleks. Misalnya, Anda dapat menandai sumber daya dengan beban kerja atau nama aplikasi terkait dan menggunakan perangkat lunak seperti Azure DevOps untuk melakukan tugas otomatis pada sumber daya tersebut.

## <a name="how-do-i-manage-resource-tags"></a>Bagaimana cara mengelola tag sumber daya?

Anda dapat menambahkan, memodifikasi, atau menghapus tag sumber daya melalui PowerShell, Azure CLI, templat Azure Resource Manager, REST API, atau portal Microsoft Azure.

Anda juga dapat mengelola tag dengan menggunakan Azure Policy. Misalnya, Anda dapat menerapkan tag ke grup sumber daya, tetapi tag tersebut tidak secara otomatis diterapkan ke sumber daya dalam grup sumber daya tersebut. Anda dapat menggunakan Azure Policy untuk memastikan bahwa sumber daya mewarisi tag yang sama dengan grup sumber daya induknya. Anda akan mempelajari selengkapnya tentang Azure Policy nanti dalam modul ini.

Anda juga dapat menggunakan Azure Policy untuk menerapkan aturan dan konvensi penandaan. Misalnya, Anda dapat mengharuskan tag tertentu ditambahkan ke sumber daya baru saat disediakan. Anda juga dapat menentukan aturan yang menerapkan ulang tag yang telah dihapus.

## <a name="an-example-tagging-structure"></a>Contoh struktur penandaan

Tag sumber daya terdiri dari nama dan nilai. Anda dapat menetapkan satu atau beberapa tag untuk setiap sumber daya Azure.

Setelah meninjau persyaratan bisnisnya, Tailwind Traders memutuskan tag berikut.

| Nama          | Nilai |
|---------------|-----------|
|**NamaAplikasi**    |Nama aplikasi tempat sumber daya menjadi bagiannya.|
|**PusatBiaya** |Kode pusat biaya internal.|
|**Pemilik**      |Nama pemilik bisnis yang bertanggung jawab atas sumber daya.|
|**Lingkungan**|Nama lingkungan, seperti "Prod," "Dev," atau "Uji."|
|**Dampak**     |Betapa pentingnya sumber daya untuk operasi bisnis, seperti "Misi-kritis," "Dampak tinggi," atau "Dampak rendah."|

Berikut adalah contoh yang menunjukkan tag ini saat diterapkan ke komputer virtual selama penyediaan.

:::image type="content" source="../media/8-vm-tags.png" alt-text="Cuplikan layar yang memperlihatkan tag komputer virtual. Nama tag adalah NamaAplikasi, PusatBiaya, Pemilik, Lingkungan, dan Dampak.":::

Tim Tailwind Traders dapat menjalankan kueri, misalnya, dari PowerShell atau Azure CLI, untuk mencantumkan semua sumber daya yang berisi tag ini.

Perlu diingat bahwa Anda tidak perlu memberlakukan bahwa tag tertentu ada di semua sumber daya Anda. Misalnya, Anda mungkin memutuskan bahwa hanya sumber daya yang sangat penting yang memiliki tag **Dampak**. Semua sumber daya yang tidak ditandai kemudian tidak akan dianggap sebagai misi-kritis.
