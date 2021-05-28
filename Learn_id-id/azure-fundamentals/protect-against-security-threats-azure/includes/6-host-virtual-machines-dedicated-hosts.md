Di Azure, komputer virtual (VM) berjalan pada perangkat keras bersama yang dikelola Microsoft. Meskipun perangkat keras yang mendasarinya dibagikan, beban kerja VM Anda diisolasi dari beban kerja yang dijalankan pelanggan Azure lainnya.

Beberapa organisasi harus mengikuti kepatuhan terhadap peraturan yang mengharuskan mereka menjadi satu-satunya pelanggan yang menggunakan komputer fisik yang menghosting komputer virtual mereka. [Azure Dedicated Host](https://azure.microsoft.com/services/virtual-machines/dedicated-host/?azure-portal=true) menyediakan server fisik khusus untuk menghosting VM Azure Anda untuk Windows dan Linux.

Berikut adalah diagram yang menunjukkan bagaimana VM berhubungan dengan host dan grup host khusus. *Host khusus* dipetakan ke server fisik di pusat data Azure. *Grup host* adalah kumpulan host khusus.

:::image type="content" source="../media/6-dedicated-hosts.png" alt-text="Diagram yang menunjukkan hubungan antara komputer virtual, host khusus, dan grup host." border="false":::

## <a name="what-are-the-benefits-of-azure-dedicated-host"></a>Apa manfaat Azure Dedicated Host?

Azure Dedicated Host:

* Memberi Anda visibilitas ke, dan kontrol atas, infrastruktur server yang menjalankan VM Azure Anda.
* Membantu memenuhi persyaratan kepatuhan dengan menerapkan beban kerja Anda di server yang terisolasi.
* Memungkinkan Anda memilih jumlah prosesor, kemampuan server, seri VM, dan ukuran VM dalam host yang sama.

## <a name="availability-considerations-for-dedicated-host"></a>Pertimbangan ketersediaan untuk Dedicated Host

Setelah host khusus disediakan, Azure menetapkannya ke server fisik di pusat data cloud Microsoft.

Untuk ketersediaan tinggi, Anda dapat menyediakan beberapa host dalam *grup host*, dan menyebarkan VM Anda di seluruh grup ini. VM pada host khusus juga dapat memanfaatkan *kontrol pemeliharaan*. Fitur ini memungkinkan Anda mengontrol kapan pembaruan pemeliharaan rutin terjadi, dalam jangka bergulir 35 hari.

## <a name="pricing-considerations"></a>Pertimbangan harga

Anda dikenakan biaya per host khusus, yang terpisah dari berapa banyak VM yang Anda sebarkan ke host tersebut. Harga host didasarkan pada rangkaian VM, jenis (ukuran perangkat keras), dan wilayah.

Lisensi perangkat lunak, penyimpanan, dan penggunaan jaringan ditagih secara terpisah dari host dan VM. Untuk informasi selengkapnya. lihat [Harga Azure Dedicated Host](https://aka.ms/ADHPricing/?azure-portal=true).
