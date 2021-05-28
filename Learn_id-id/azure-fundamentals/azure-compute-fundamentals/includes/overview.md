Komputasi Azure adalah layanan komputasi sesuai permintaan untuk menjalankan aplikasi berbasis cloud. Layanan ini menyediakan sumber daya komputasi seperti disk, prosesor, memori, jaringan, dan sistem operasi. Sumber daya tersedia sesuai permintaan dan biasanya dapat disediakan dalam hitungan menit atau bahkan detik. Anda hanya perlu membayar sumber daya yang Anda gunakan, dan hanya selama Anda menggunakannya.

Azure mendukung beragam solusi komputasi untuk pengembangan dan pengujian, menjalankan aplikasi, dan memperluas pusat data Anda. Layanan ini mendukung Linux, Windows Server, SQL Server, Oracle, IBM, dan SAP. Azure juga memiliki banyak layanan yang dapat menjalankan komputer virtual (VM). Setiap layanan menyediakan opsi yang berbeda, tergantung kebutuhan Anda. Beberapa layanan yang paling menonjol adalah:

* Azure Virtual Machines
* Azure Container Instances
* Azure App Service
* Azure Functions (atau _komputasi tanpa server)_

![Cuplikan layar halaman layanan komputasi portal Azure yang mencakup VM dan kontainer.](../media/compute-services.png)

:::row:::
  :::column span="3":::

## <a name="virtual-machines"></a>Komputer virtual

Komputer virtual adalah emulasi perangkat lunak dari komputer fisik. Komputer virtual ini mencakup prosesor virtual, memori, penyimpanan, dan sumber daya jaringan. VM menghosting sistem operasi, dan Anda dapat menginstal dan menjalankan perangkat lunak seperti komputer fisik. Saat menggunakan klien desktop jarak jauh, Anda dapat menggunakan dan mengontrol VM seolah-olah Anda duduk di depannya.

Dengan [Azure Virtual Machines,](https://azure.microsoft.com/services/virtual-machines/?azure-portal=true) Anda dapat membuat dan menggunakan VM di cloud. Virtual Machines menyediakan infrastructure as a service (IaaS) dan dapat digunakan dengan cara yang berbeda. Ketika Anda membutuhkan kontrol penuh atas sistem operasi dan lingkungan, VM adalah pilihan yang ideal. Sama seperti komputer fisik, Anda dapat menyesuaikan semua perangkat lunak yang berjalan di VM. Kemampuan ini sangat membantu saat Anda menjalankan perangkat lunak kustom atau konfigurasi hosting kustom.

  :::column-end:::
  :::column:::
    :::image type="icon" source="../media/icon-virtual-machine.png" border="false":::
  :::column-end:::
:::row-end:::
:::row:::
  :::column:::
    :::image type="icon" source="../media/icon-scale-sets.png" border="false":::
  :::column-end:::
  :::column span="3":::

## <a name="virtual-machine-scale-sets"></a>Rangkaian skala komputer virtual

[Set skala komputer virtual](https://azure.microsoft.com/services/virtual-machine-scale-sets?azure-portal=true) adalah sumber daya komputasi Azure yang dapat Anda gunakan untuk menyebarkan dan mengelola serangkaian VM yang identik. Dengan semua VM dikonfigurasi sama, set skala komputer virtual dirancang untuk mendukung skala otomatis sejati. Tidak diperlukan pra-penyediaan VM. Untuk alasan ini, lebih mudah membangun layanan skala besar yang menargetkan komputasi besar, big data, dan beban kerja kontainer. Ketika permintaan naik, maka semakin banyak instans VM yang dapat ditambahkan. Saat permintaan turun, instans VM dapat dihapus. Prosesnya dapat manual, otomatis, atau kombinasi dari keduanya.

  :::column-end:::
:::row-end:::
:::row:::
  :::column span="3":::

## <a name="containers-and-kubernetes"></a>Kontainer dan Kubernetes

[Container Instances](https://azure.microsoft.com/services/container-instances?azure-portal=true) dan [Azure Kubernetes Service](https://azure.microsoft.com/services/kubernetes-service?azure-portal=true) adalah sumber daya komputasi Azure yang dapat digunakan untuk menyebarkan dan mengelola kontainer. Kontainer adalah lingkungan aplikasi ringan dan virtual. Kontainer dirancang agar bisa dibuat, diskalakan, dan dihentikan secara dinamis secara cepat. Anda dapat menjalankan beberapa contoh aplikasi kontainer pada satu komputer host.

  :::column-end:::
  :::column:::
    :::image type="icon" source="../media/icon-container-instance.png" border="false":::
  :::column-end:::
:::row-end:::
:::row:::
  :::column:::
    :::image type="icon" source="../media/icon-app-service.png" border="false":::
  :::column-end:::
  :::column span="3":::

## <a name="app-service"></a>App Service

Dengan [Azure App Service](https://azure.microsoft.com/services/app-service?azure-portal=true), Anda dapat dengan cepat membangun, menyebarkan, dan menskalakan aplikasi web, seluler, dan API tingkat perusahaan yang berjalan di platform apa pun. Anda dapat memenuhi persyaratan performa, skalabilitas, keamanan, dan kepatuhan yang ketat saat menggunakan platform yang terkelola sepenuhnya untuk melakukan pemeliharaan infrastruktur. App Service adalah penawaran platform as a service (PaaS).

  :::column-end:::
:::row-end:::
:::row:::
  :::column span="3":::

## <a name="functions"></a>Fungsi

[Functions](https://azure.microsoft.com/services/functions?azure-portal=true) sangat ideal ketika Anda hanya sangat mengkhawatirkan kode yang menjalankan layanan Anda dan bukan platform atau infrastruktur yang mendasarinya. Functions umumnya digunakan saat Anda perlu melakukan pekerjaan sebagai respons terhadap suatu peristiwa (seringkali melalui permintaan REST), timer, atau pesan dari layanan Azure lain, dan kapan pekerjaan tersebut dapat diselesaikan dengan cepat, dalam hitungan detik atau kurang.

  :::column-end:::
  :::column:::
    :::image type="icon" source="../media/icon-functions.png" border="false":::
  :::column-end:::
:::row-end:::
