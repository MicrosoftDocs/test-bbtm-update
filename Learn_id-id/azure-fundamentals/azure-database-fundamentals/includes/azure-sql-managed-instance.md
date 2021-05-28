:::row:::
  :::column span="3":::
Azure SQL Managed Instance adalah layanan data cloud yang dapat diskalakan yang menyediakan kompatibilitas mesin database SQL Server terluas dengan semua manfaat platform as a service yang dikelola sepenuhnya. Bergantung pada skenario Anda, Azure SQL Managed Instance dapat menawarkan lebih banyak opsi untuk kebutuhan database Anda.
  :::column-end:::
  :::column:::
    :::image type="icon" source="../media/icon-service-managed-sql-instance.png" border="false":::
  :::column-end:::
:::row-end:::

## <a name="features"></a>Fitur

Seperti Azure SQL Database, Azure SQL Managed Instance adalah mesin database platform as a service (PaaS), yang berarti bahwa perusahaan Anda akan dapat memanfaatkan fitur terbaik untuk memindahkan data ke cloud dalam lingkungan yang dikelola sepenuhnya. Misalnya, perusahaan Anda tidak perlu lagi membeli dan mengelola perangkat keras yang mahal, dan Anda tidak perlu mengurus biaya tambahan dalam mengelola infrastruktur lokal Anda. Di sisi lain, perusahaan Anda akan mendapat manfaat dari penyediaan cepat dan fitur penskalaan layanan dari Azure, yang disertai dengan patching otomatis dan peningkatan versi. Selain itu, Anda dapat memastikan bahwa data Anda akan selalu ada saat dibutuhkan melalui fitur ketersediaan tinggi bawaan dan perjanjian tingkat layanan dengan waktu aktif (SLA) 99,99%. Anda juga dapat melindungi data dengan pencadangan otomatis dan periode retensi cadangan yang dapat dikonfigurasi.

Azure SQL Database dan Azure SQL Managed Instance menawarkan banyak fitur yang sama; namun, Azure SQL Managed Instance menyediakan beberapa opsi yang mungkin tidak tersedia pada Azure SQL Database. Misalnya, Tailwind Traders saat ini menggunakan beberapa server lokal yang menjalankan SQL Server, dan mereka ingin memigrasikan database yang sudah ada ke database SQL yang berjalan di cloud. Namun, beberapa database mereka menggunakan karakter Sirilik untuk kolase. Dalam skenario ini, Tailwind Traders harus memigrasikan database mereka ke Azure SQL Managed Instance, karena Azure SQL Database hanya menggunakan `SQL_Latin1_General_CP1_CI_AS` kolase server default.

> [!NOTE]
>
> Untuk daftar detail tentang perbedaan antara Azure SQL Database dan Azure SQL Managed Instance, lihat [Perbandingan fitur: Azure SQL Database dan Azure SQL Managed Instance](https://docs.microsoft.com/azure/azure-sql/database/features-comparison/?azure-portal=true).


## <a name="migration"></a>Migration

Azure SQL Managed Instance memudahkan migrasi data lokal Anda dari SQL Server ke cloud menggunakan Azure Database Migration Service (DMS) atau pencadangan dan pemulihan asli. Setelah menemukan semua fitur yang digunakan perusahaan, Anda perlu menilai instans SQL Server lokal mana yang dapat Anda migrasikan ke Azure SQL Managed Instance untuk melihat apakah Anda memiliki masalah pemblokiran. Setelah menyelesaikan masalah yang ada, Anda dapat memigrasikan data langsung dari SQL Server lokal ke Azure SQL Managed Instance dengan mengubah string koneksi di aplikasi Anda.

![Alur proses migrasi data ke Azure SQL Managed Instance.](../media/migration-process-flow-small.png)

> [!NOTE]
>
> Untuk deskripsi detail tentang proses migrasi, lihat [Panduan migrasi: SQL Server ke SQL Managed Instance](https://docs.microsoft.com/azure/azure-sql/migration-guides/managed-instance/sql-server-to-managed-instance-guide)
