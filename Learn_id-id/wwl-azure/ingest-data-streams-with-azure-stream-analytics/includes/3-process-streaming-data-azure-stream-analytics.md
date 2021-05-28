[Azure Stream Analytics](https://docs.microsoft.com/azure/stream-analytics/stream-analytics-introduction) adalah layanan yang direkomendasikan untuk analisis aliran di Azure. Analisis Aliran memberi Anda kemampuan menyerap, memproses, dan menganalisis data streaming dari Azure Event Hub (termasuk [Azure Event Hubs dari Apache Kafka](https://docs.microsoft.com/azure/event-hubs/event-hubs-for-kafka-ecosystem-overview)) dan Azure IoT Hub. Anda juga dapat mengonfigurasi penyerapan data statis dari Azure Blob Storage. Integrasi ini memungkinkan Anda membuat dengan cepat alur analitik jalur eksekusi paling sering untuk menghasilkan wawasan yang kuat untuk mendorong tindakan real-time. Azure Stream Analytics dimaksudkan untuk berbagai skenario yang disertakan, tetapi tidak terbatas pada:

- Dasbor untuk visualisasi data
- [Peringatan real-time](https://docs.microsoft.com/azure/stream-analytics/stream-analytics-set-up-alerts) dari pola sementara dan spasial atau anomali
- Ekstraksi, Transformasi, dan Pemuatan (ETL)
- [Pola Sumber Kejadian](https://docs.microsoft.com/azure/architecture/patterns/event-sourcing)
- [IoT Edge](https://docs.microsoft.com/azure/stream-analytics/stream-analytics-edge)

Contoso mengumpulkan telemetri kendaraan dan ingin menggunakan Pusat Aktivitas untuk menyerap dan menyimpan data dalam bentuk mentahnya. Mereka ingin melakukan beberapa agregasi pada data telemetri hampir secara real-time. Pada akhirnya, mereka ingin memvisualisasikan data agregat di dasbor yang diperbarui secara otomatis dengan data baru saat tiba. Mereka ingin dasbor berisi berbagai visualisasi anomali yang terdeteksi, seperti mesin yang terlalu panas, tekanan oli abnormal, dan mengemudi yang agresif. Mereka tertarik memanfaatkan komponen pemetaan untuk menunjukkan penyimpangan yang terkait dengan lokasi, serta berbagai bagan dan grafik yang menggambarkan informasi ini. CIO meminta Anda membantu mereka dalam menyiapkan alur analitik yang hampir real-time yang dibangun di Pusat Aktivitas, Azure Stream Analytics, dan Power BI.

![Diagram ini menggambarkan solusi end-to-end menggunakan Pusat Aktivitas untuk menyerap data streaming, Azure Stream Analytics untuk mengubah data, dan Power BI untuk memvisualisasikan dan menganalisisnya.](../media/stream-analytics-end-to-end-solution.png "Solusi Analisis Aliran End-to-end")

Cara tercepat mendapatkan analitik streaming yang berjalan di Azure adalah menambahkan pekerjaan [Azure Stream Analytics](https://docs.microsoft.com/azure/stream-analytics/stream-analytics-introduction) ke aplikasi. Pekerjaan Analisis Aliran akan menyerap data streaming dari salah satu input yang didukung dan menjalankan kueri analitik real-time terhadap stream. Integrasi bawaan dengan Azure Event Hubs dan IoT Hub menyediakan mekanisme cepat untuk membuat saluran analitik streaming ini. Analisis Aliran juga mendukung berbagai input dan output. Ini juga menyediakan kemampuan menggunakan fungsi Azure Machine Learning untuk menjadikannya alat yang kuat untuk menganalisis aliran data. Manfaat utama pemrosesan data streaming dengan Azure Stream Analytics meliputi:

- Kemampuan **mempratinjau dan memvisualisasikan data masuk** langsung di portal Microsoft Azure.
- Menggunakan portal Microsoft Azure untuk **menulis dan menguji kueri transformasi** menggunakan [Bahasa Kueri Analisis Aliran](https://docs.microsoft.com/stream-analytics-query/built-in-functions-azure-stream-analytics) (SAQL) seperti SQL. Anda dapat menggunakan fungsi bawaan SAQL untuk menemukan pola menarik dari aliran data masuk.
- **Penyebaran kueri dengan cepat ke dalam produksi** dengan membuat dan memulai pekerjaan Azure Stream Analytics.

Dengan Azure Stream Analytics, Anda dapat menyiapkan dasbor dan peringatan real-time dengan cepat. Contoh solusi sederhana, seperti yang digambarkan dalam diagram di bawah ini, termasuk menyerap data streaming dari Pusat Aktivitas atau ioT Hub. Kemudian data streaming dapat ditransformasikan menggunakan kueri pembuatan jendela Analisis Aliran. Kemudian data agregat dikirim ke dasbor Power BI dengan kumpulan data streaming.

![Diagram ini menggambarkan solusi end-to-end menggunakan Pusat Aktivitas dan ioT Hub untuk menyerap data streaming, Azure Stream Analytics untuk mengubah data, dan Power BI untuk memvisualisasikan dan menganalisisnya.](../media/stream-analytics-end-to-end-solution-event-iot-hubs.png "Solusi Analisis Aliran End-to-end")

Fungsionalitas Azure Stream Analytics yang lengkap memungkinkan Anda segera memanfaatkan fitur-fitur berikut tanpa penyiapan tambahan:

- Operator sementara bawaan, seperti agregat berjendela, gabungan sementara, dan fungsi analitik sementara
- Adaptor input dan output Azure asli
- Dukungan untuk data referensi yang berubah lambat (juga dikenal sebagai tabel pencarian), termasuk bergabung dengan data referensi geospasial untuk geofencing
- Solusi terintegrasi, seperti Deteksi Anomali
- Jendela beberapa waktu dalam kueri yang sama
- Kemampuan menyusun beberapa operator sementara dengan urutan arbitrer

## <a name="operational-aspects"></a>Aspek operasional

Azure Stream Analytics adalah layanan pekerjaan PaaS, sehingga dikelola sepenuhnya dan sangat dapat diandalkan. Anda tidak perlu menghabiskan waktu mengelola kluster atau mengkhawatirkan waktu henti. Penagihan tingkat pekerjaan memastikan biaya startup yang rendah (tiga Unit Streaming, secara default). Dan, pekerjaan dapat diskalakan hingga 192 Unit Streaming untuk memberikan kinerja yang diperlukan untuk menjalankan bahkan pekerjaan yang paling menuntut secara efektif. Akan jauh lebih hemat menjalankan beberapa pekerjaan Analisis Aliran daripada menjalankan dan memelihara kluster Spark.

[Unit Streaming](https://docs.microsoft.com/azure/stream-analytics/stream-analytics-streaming-unit-consumption) (SU) mewakili sumber daya komputasi yang ditunjuk untuk menjalankan pekerjaan Analisis Aliran. Meningkatkan jumlah SU berarti lebih banyak sumber daya CPU dan memori dialokasikan untuk pekerjaan tersebut. Pekerjaan Azure Stream Analytics melakukan semua pemrosesan dalam memori untuk mencapai latensi rendah yang diperlukan untuk pemrosesan stream yang efisien. Menangani kapasitas komputasi dengan cara ini memungkinkan Anda fokus pada penulisan kueri dan menyerahkan manajemen perangkat keras kepada Microsoft.
