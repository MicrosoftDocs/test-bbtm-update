:::row:::
  :::column span="3":::
Selama bertahun-tahun, Tailwind Traders telah mengakuisisi beberapa perusahaan kecil. Setiap perusahaan ini memiliki tim pengembang yang menggunakan berbagai layanan database dan beragam API untuk menggunakan data mereka. Rencana jangka panjang mungkin agar dapat memindahkan semua data yang berlainan ke layanan database umum. Namun, untuk saat ini, Anda ingin memungkinkan setiap tim ini untuk menggunakan lingkungan tempat mereka dapat menggunakan keterampilan yang ada. Untungnya bagi Anda, Azure Cosmos DB dapat membantu.
  :::column-end:::
  :::column:::
    :::image type="icon" source="../media/icon-service-Azure-Cosmos-DB.png" border="false":::
  :::column-end:::
:::row-end:::

Azure Cosmos DB adalah layanan database multi model yang tersebar secara global. Anda dengan bebas dan independen dapat menskalakan hasil dan penyimpanan di sejumlah wilayah Azure di seluruh dunia. Anda dapat dengan cepat memanfaatkan akses data dalam hitungan milidetik menggunakan API populer mana pun. Azure Cosmos DB memberikan perjanjian tingkat layanan yang komprehensif untuk jaminan hasil, latensi, ketersediaan, dan konsistensi.  

Azure Cosmos DB mendukung data tanpa skema, yang memungkinkan Anda membangun aplikasi yang sangat responsif dan "Selalu Aktif" untuk mendukung data yang terus berubah. Anda dapat menggunakan fitur ini untuk menyimpan data yang diperbarui dan dikelola oleh pengguna di seluruh dunia.

Misalnya, Tailwind Traders menyediakan portal pelatihan publik yang digunakan oleh pelanggan di seluruh dunia untuk mempelajari berbagai alat yang dibuat oleh Trader Tailwind. Pengembang Tailwind Traders memelihara dan memperbarui datanya. Ilustrasi berikut menampilkan contoh database Azure Cosmos DB yang digunakan untuk menyimpan data untuk situs web portal pelatihan Tailwind Traders.

[![Diagram database Azure Cosmos DB di situs web portal pelatihan.](../media/azure-cosmos-db.png)](../media/azure-cosmos-db-expanded.png#lightbox)

Azure Cosmos DB bersifat fleksibel. Pada level terendah, Azure Cosmos DB menyimpan data dalam format urutan rekaman atom (ARS). Data kemudian diabstraksi dan diproyeksikan sebagai API, yang Anda tentukan saat membuat database. Pilihan Anda termasuk SQL, MongoDB, Cassandra, Tables, dan Gremlin. Tingkat fleksibilitas ini berarti bahwa saat Anda memigrasikan database perusahaan Anda ke Azure Cosmos DB, pengembang Anda dapat tetap menggunakan API yang paling nyaman bagi mereka.
