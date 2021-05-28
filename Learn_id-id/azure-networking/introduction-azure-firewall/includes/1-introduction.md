Azure Firewall melindungi Azure Virtual Network dengan memungkinkan Anda mengontrol dan memantau akses ke sumber daya Azure. Azure Firewall Manager menyediakan titik pusat konfigurasi dan manajemen beberapa instans Azure Firewall.

Misalnya Anda bekerja di Contoso, Ltd., sebuah perusahaan jasa keuangan di Seattle dengan kantor-kantor besar yang tersebar di seluruh dunia. Lingkungan komputasi Contoso tersebar di beberapa wilayah Azure, masing-masing dengan beberapa jaringan virtual dan koneksi ke jaringan lokal.

Staf IT Contoso mengkhawatirkan ancaman eksternal dalam bentuk orang jahat yang mencoba menyusup ke jaringan. IT juga mengkhawatirkan ancaman internal dalam bentuk karyawan yang secara tidak sengaja mencoba mengakses situs web berbahaya. Misalkan Anda seorang teknisi keamanan jaringan Contoso. Anda bertanggung jawab untuk menentukan apakah Azure Firewall memungkinkan Contoso untuk menolak ancaman masuk dan keluar sekaligus mengizinkan lalu lintas yang sah. Mandat Anda juga mencakup menemukan cara paling efisien untuk menerapkan kebijakan firewall di beberapa wilayah Azure Contoso.

Dalam modul ini, Anda akan mempelajari dasar-dasar Azure Firewall dan Azure Firewall Manager. Anda akan mempelajari apa, bagaimana mereka bekerja, dan kapan Anda harus menggunakannya. Pada akhir modul ini, Anda akan dapat mengevaluasi apakah Azure Firewall adalah solusi yang sesuai untuk mengontrol dan memantau akses ke sumber daya virtual Contoso. Anda juga dapat mengevaluasi apakah Azure Firewall Manager dapat membantu mengurangi kompleksitas penerapan kebijakan ke beberapa firewall.

## <a name="learning-objectives"></a>Tujuan pembelajaran

Dalam modul ini, Anda akan:

- Menjelaskan bagaimana Azure Firewall dan Azure Firewall Manager bekerja sama untuk melindungi Azure Virtual Network.
- Mengevaluasi apakah Azure Firewall adalah solusi yang tepat untuk melindungi jaringan virtual Azure Anda dari lalu lintas masuk dan keluar yang berbahaya.
- Mengevaluasi apakah Azure Firewall Manager adalah solusi yang tepat untuk menerapkan kebijakan pada beberapa firewall.
- Mengidentifikasi dan menjelaskan kasus penggunaan untuk Azure Firewall dan Azure Firewall Manager.

## <a name="prerequisites"></a>Prasyarat

Untuk mendapatkan pengalaman belajar terbaik dari modul ini, Anda harus memiliki:

- Pengetahuan tingkat pemula tentang Azure, termasuk Zona Ketersediaan, Azure Virtual Network, dan ExpressRoute.
- Pengetahuan tingkat pemula tentang jaringan, termasuk alamat IP, alamat IP publik versus privat, hub dan topologi jaringan spoke, subnet, dan paket jaringan.
- Pengetahuan tingkat pemula tentang komputasi cloud, termasuk skalabilitas dan ketersediaan.
