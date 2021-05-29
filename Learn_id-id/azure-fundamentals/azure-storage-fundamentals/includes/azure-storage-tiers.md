:::row:::
  :::column span="3":::
Data yang disimpan di cloud dapat tumbuh dengan kecepatan eksponensial. Untuk mengelola biaya kebutuhan penyimpanan Anda yang makin besar, sebaiknya atur data berdasarkan atribut seperti frekuensi akses dan periode retensi yang direncanakan. Data yang disimpan di cloud dapat berbeda berdasarkan bagaimana data tersebut dihasilkan, diproses, dan diakses selama masa pakainya. Beberapa data secara aktif diakses dan dimodifikasi sepanjang masa hidupnya. Beberapa data sering diakses di awal masa pakainya, dengan akses yang menurun drastis seiring bertambahnya usia data. Beberapa data tetap diam di cloud dan jarang, jika pernah, diakses setelah disimpan. Untuk mengakomodasi berbagai kebutuhan akses ini, Azure menyediakan beberapa _tingkat akses_, yang dapat Anda gunakan untuk menyeimbangkan biaya penyimpanan dengan kebutuhan akses Anda.
  :::column-end:::
  :::column:::
    :::image type="icon" source="../media/icon-storage-tiers.png" border="false":::
  :::column-end:::
:::row-end:::

Microsoft Azure Storage menawarkan tingkat akses yang berbeda untuk penyimpanan blob, membantu Anda menyimpan data objek dengan cara yang paling hemat biaya. Tingkat akses yang tersedia meliputi:

- **Tingkat akses hot**: Dioptimalkan untuk menyimpan data yang sering diakses (misalnya, gambar untuk situs web).

- **Tingkat akses cool**: Dioptimalkan untuk data yang jarang diakses dan disimpan setidaknya selama 30 hari (misalnya, faktur untuk pelanggan).

- **Tingkat akses arsip**: Sesuai untuk data yang jarang diakses dan disimpan setidaknya selama 180 hari, dengan persyaratan latensi yang fleksibel (misalnya, cadangan jangka panjang).

Pertimbangan berikut berlaku untuk berbagai tingkat akses:

- Hanya tingkat akses hot dan cool yang dapat diatur di tingkat akun. Tingkat akses arsip tidak tersedia di tingkat akun.

- Tingkat hot, cool, dan arsip dapat diatur di tingkat blob, selama pengunggahan atau setelah diunggah.

- Data dalam tingkat akses cool dapat menoleransi ketersediaan yang sedikit lebih rendah, tetapi masih membutuhkan daya tahan tinggi, latensi pengambilan, dan karakteristik throughput yang mirip dengan data hot. Untuk data cool, perjanjian tingkat layanan (SLA) ketersediaan yang sedikit lebih rendah dan biaya akses yang lebih tinggi dibandingkan dengan data hot merupakan trade-off yang dapat diterima untuk biaya penyimpanan yang lebih rendah.

- Penyimpanan arsip menyimpan data secara offline dan menawarkan biaya penyimpanan terendah, tetapi juga biaya tertinggi untuk mengimpor dan mengakses data.

Ilustrasi berikut menunjukkan memilih antara tingkat akses hot dan cool di akun penyimpanan tujuan umum.

[![Cuplikan layar menentukan tingkat akses Azure](../media/account-tier.png)](../media/account-tier.png#lightbox).
