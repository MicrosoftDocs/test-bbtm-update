Meskipun komputer virtual adalah cara yang sangat baik untuk mengurangi biaya dibandingkan investasi yang diperlukan untuk perangkat keras fisik, namun tetap masih dibatasi satu sistem operasi per komputer virtual. Jika Anda ingin menjalankan beberapa instans aplikasi pada satu komputer host, kontainer adalah pilihan yang sangat baik.

## <a name="what-are-containers"></a>Apa itu kontainer?

Kontainer adalah lingkungan virtualisasi. Sangat mirip dengan menjalankan beberapa komputer virtual pada satu host fisik, Anda dapat menjalankan beberapa kontainer pada satu host fisik atau virtual. Tidak seperti komputer virtual, Anda tidak mengelola sistem operasi untuk kontainer. Komputer virtual tampaknya merupakan instans sistem operasi yang dapat Anda hubungkan dan Anda kelola, tetapi kontainer ringan dan dirancang untuk dibuat, diskalakan, dan dihentikan secara dinamis. Meskipun Anda dapat membuat dan menyebarkan komputer virtual seiring dengan meningkatnya permintaan aplikasi, kontainer dirancang untuk memungkinkan Anda merespons perubahan sesuai permintaan. Dengan kontainer, Anda dapat dengan cepat memulai ulang jika terjadi berupa macet atau gangguan perangkat keras. Salah satu mesin kontainer paling populer adalah Docker, yang didukung oleh Azure.

## <a name="compare-virtual-machines-to-containers"></a>Bandingkan komputer virtual dengan kontainer

Video berikut menyoroti beberapa perbedaan penting antara komputer virtual dan kontainer.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE2yuaq]

## <a name="manage-containers"></a>Mengelola kontainer

Kontainer dikelola melalui orkestrator kontainer, yang dapat memulai, menghentikan, dan meningkatkan skala instans aplikasi sesuai kebutuhan. Ada dua cara untuk mengelola kontainer berbasis Docker dan Microsoft di Azure: Azure Container Instances dan Azure Kubernetes Service (AKS).

:::row:::
  :::column span="3":::

### <a name="azure-container-instances"></a>Azure Container Instances

[Azure Container Instances](https://azure.microsoft.com/services/container-instances?azure-portal=true) menawarkan cara tercepat dan paling sederhana untuk menjalankan kontainer di Azure tanpa harus mengelola komputer virtual apa pun atau mengadopsi layanan tambahan. Platform ini merupakan platform sebagai platform as a service (PaaS) yang memungkinkan Anda untuk mengunggah kontainer Anda, yang dijalankan untuk Anda.

  :::column-end:::
  :::column:::
    :::image type="icon" source="../media/icon-container-instance.png" border="false":::
  :::column-end:::
:::row-end:::
:::row:::
  :::column:::
    :::image type="icon" source="../media/icon-kubernetes.png" border="false":::
  :::column-end:::
  :::column span="3":::

### <a name="azure-kubernetes-service"></a>Azure Kubernetes Service

Tugas mengotomatiskan, mengelola, dan berinteraksi dengan banyak kontainer dikenal sebagai orkestrasi. [Azure Kubernetes Service](https://azure.microsoft.com/services/kubernetes-service?azure-portal=true) adalah layanan orkestrasi lengkap untuk kontainer dengan arsitektur terdistribusi dan kontainer dalam volume yang besar. Orkestrasi adalah tugas mengotomatiskan dan mengelola kontainer dalam jumlah besar dan bagaimana kontainer-kontainer tersebut berinteraksi.

  :::column-end:::
:::row-end:::

### <a name="what-is-kubernetes"></a>Apa itu Kubernetes?

Video berikut membahas beberapa detail penting tentang orkestrasi kontainer Kubernetes.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE2yEuX]

## <a name="use-containers-in-your-solutions"></a>Menggunakan kontainer dalam solusi Anda

Kontainer sering digunakan untuk membuat solusi menggunakan _arsitektur layanan mikro._ Arsitektur ini adalah tempat untuk memecah solusi menjadi potongan-potongan yang lebih kecil dan independen. Misalnya, Anda mungkin membagi sebuah situs web menjadi kontainer yang menghosting front-end Anda, yang lain menghosting back-end Anda, dan sepertiganya untuk penyimpanan. Dengan pemisahan ini, Anda dapat memisahkan bagian aplikasi menjadi bagian logis yang dapat dipertahankan, diskalakan, atau diperbarui secara independen.

Bayangkan back-end situs web Anda telah mencapai kapasitas tetapi front-end dan penyimpanannya tidak dalam tekanan. Anda bisa:

* Menskalakan back-end secara terpisah untuk meningkatkan performa.
* Memutuskan untuk menggunakan layanan penyimpanan yang berbeda.
* Mengganti kontainer penyimpanan tanpa mempengaruhi aplikasi lainnya.

### <a name="what-is-a-microservice"></a>Apa itu layanan mikro?

Video berikut membahas beberapa detail penting tentang layanan mikro.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE2yual]

[//]: # (CATATAN: SUDAH DIHAPUS YANG BERIKUT INI)
[//]: # (## Migrasi aplikasi ke kontainer)
[//]: # (Anda dapat memindahkan aplikasi yang ada ke kontainer dan menjalankannya dalam AKS. Anda dapat mengontrol akses melalui integrasi dengan Azure Active Directory dan mengakses layanan Azure yang didukung Service Level Agreement, seperti Azure Database for MySQL untuk kebutuhan data apa pun, melalui Open Service Broker untuk Azure OSBA.)
[//]: #  (![Diagram yang menggambarkan pemindahan aplikasi yang ada ke kontainer dan menjalankannya dalam Azure Kubernetes Service, atau AKS/]../media/kubernetes-migration.png)
[//]: # (Angka sebelumnya menggambarkan proses ini sebagai berikut:)
[//]: # (1. Anda mengonversi aplikasi yang ada ke satu atau beberapa kontainer, lalu menerbitkan satu atau beberapa citra kontainer ke Azure Container Registry.)
[//]: # (1. Dengan menggunakan portal Azure atau baris perintah, Anda menyebarkan kontainer ke kluster AKS.)
[//]: # (1. Azure AD mengontrol akses ke sumber daya AKS.)
[//]: # (1. Anda mengakses layanan Azure yang didukung SLA, seperti Azure Database untuk MySQL, melalui OSBA.)
[//]: # (1. Secara opsional, AKS disebarkan dengan jaringan virtual.)
