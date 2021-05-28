Sejauh ini, Anda telah menjelajahi sejumlah fitur Azure yang dapat membantu Anda menerapkan keputusan tata kelola, memantau kepatuhan sumber daya cloud Anda, serta mengontrol akses serta melindungi sumber daya penting dari penghapusan yang tidak disengaja.

Apa yang terjadi ketika lingkungan cloud Anda mulai berkembang lebih dari satu langganan? Bagaimana Anda dapat menskalakan konfigurasi fitur ini, mengetahui bahwa fitur tersebut perlu diberlakukan untuk sumber daya di langganan baru?

Daripada harus mengonfigurasi fitur seperti Azure Policy untuk setiap langganan baru, dengan [Azure Blueprints](https://azure.microsoft.com/services/blueprints?azure-portal=true) Anda dapat menentukan sekumpulan alat tata kelola yang berulang serta sumber daya Azure standar yang diperlukan organisasi Anda. Dengan cara ini, tim pengembangan dapat dengan cepat membangun serta menerapkan lingkungan baru dengan pengetahuan yang mereka bangun dalam kepatuhan organisasi dengan sekumpulan komponen bawaan yang mempercepat fase pengembangan dan penerapan.

Azure Blueprints mengatur penyebaran berbagai templat sumber daya serta artefak lainnya, seperti:

* Penetapan peran
* Penetapan kebijakan
* Templat Azure Resource Manager
* Grup sumber daya

## <a name="azure-blueprints-in-action"></a>Azure Blueprints beraksi

Saat Anda membentuk tim pusat keunggulan cloud atau tim penjaga cloud, tim tersebut dapat menggunakan Azure Blueprints untuk mengukur praktik tata kelola mereka di seluruh organisasi.

Menerapkan cetak biru di Azure Blueprints melibatkan tiga langkah berikut:

1. Membuat Azure blueprint.
1. Tetapkan cetak birunya.
1. Lacak penugasan cetak biru.

Dengan Azure Blueprints, hubungan antara definisi cetak biru (apa yang harus digunakan) serta penetapan cetak biru (apa yang digunakan) dipertahankan. Dengan kata lain, Azure membuat rekaman yang mengaitkan sumber daya dengan cetak biru yang mendefinisikannya. Sambungan ini membantu Anda untuk melacak serta mengaudit penyebaran.

Cetak biru juga memiliki versi. Penerapan versi memungkinkan Anda melacak serta mengomentari perubahan pada cetak biru Anda.

## <a name="what-are-blueprint-artifacts"></a>Apa itu artefak cetak biru?

Setiap komponen dalam definisi cetak biru dikenal sebagai *artefak*.

Dimungkinkan bagi artefak untuk tidak memiliki parameter tambahan (konfigurasi). Contohnya adalah kebijakan **Menerapkan deteksi ancaman pada server SQL**, yang tidak memerlukan konfigurasi tambahan.

Artefak juga dapat berisi satu atau beberapa parameter yang dapat Anda konfigurasikan. Tangkapan layar berikut menunjukkan kebijakan **Lokasi yang diizinkan**. Kebijakan ini mencakup parameter yang menentukan lokasi yang diizinkan.

:::image type="content" source="../media/10-allowed-locations.png" alt-text="Cuplikan layar yang memperlihatkan kebijakan Lokasi yang diizinkan. Kebijakan ini mencakup parameter yang menentukan lokasi yang diizinkan.":::

Anda dapat menentukan nilai parameter saat Anda membuat definisi cetak biru atau saat Anda menetapkan definisi cetak biru ke cakupan. Dengan cara ini, Anda dapat mempertahankan satu cetak biru standar tetapi memiliki fleksibilitas untuk menentukan parameter konfigurasi yang relevan di setiap cakupan tempat definisi tersebut ditetapkan.

## <a name="how-will-tailwind-traders-use-azure-blueprints-for-iso-27001-compliance"></a>Bagaimana Tailwind Traders akan menggunakan Azure Blueprints untuk mematuhi ISO 27001?

[ISO 27001](https://www.iso.org/isoiec-27001-information-security.html?azure-portal=true) merupakan standar yang berlaku untuk keamanan sistem TI, yang diterbitkan oleh Organisasi Internasional untuk Standardisasi. Sebagai bagian dari proses kualitasnya, Tailwind Traders ingin menyatakan bahwa ia telah mematuhi standar ini. Azure Blueprints memiliki beberapa definisi cetak biru bawaan yang terkait dengan ISO 27001.

Sebagai administrator TI, Anda memutuskan untuk menyelidiki definisi **ISO 27001: Cetak Biru Layanan Bersama**. Berikut ini adalah garis besar rencana Anda.

1. Menentukan sebuah grup manajemen yang bernama **PROD-MG**.

    Mengingat bahwa grup manajemen mengelola akses, kebijakan, serta kepatuhan di beberapa langganan Azure. Setiap langganan Azure baru akan ditambahkan ke grup manajemen ini ketika langganan dibuat.
1. Buat definisi cetak biru yang didasarkan pada template **ISO 27001: Cetak Biru Layanan Bersama**. Kemudian terbitkan cetak biru.
1. Tetapkan cetak biru tersebut ke grup manajemen **PROD-MG** Anda.

Gambar berikut menunjukkan artefak yang dibuat saat Anda menjalankan cetak biru ISO 27001 dari sebuah templat.

:::image type="content" source="../media/10-iso-27001-shared-blueprint.png" alt-text="Cuplikan layar yang memperlihatkan artefak yang tercantum saat Anda membuat cetak biru ISO 27001 dari templat.":::

Anda melihat bahwa templat cetak biru berisi penetapan kebijakan, templat Azure Resource Manager, serta grup sumber daya. Cetak biru menyebarkan artefak ini ke langganan yang terdapat di dalam grup manajemen **PROD-MG**. Cetak biru juga menyebarkan artefak ini ke langganan baru saat dibuat serta ditambahkan ke grup manajemen.
