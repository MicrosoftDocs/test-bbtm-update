Dalam latihan ini, Anda mengonfigurasi [Azure Event Hubs](https://docs.microsoft.com/azure/event-hubs/event-hubs-about) sebagai input untuk Azure Stream Analytics untuk menyerap data telemetri kendaraan streaming. Pusat Aktivitas bertindak sebagai titik masuk ke alur analitik yang hampir real-time yang dibangun di Azure Event Hubs, Azure Stream Analytics, dan Power BI.

1. Dari blade pekerjaan Analisis Aliran di [portal Microsoft Azure](https://portal.azure.com/), pilih **Input** di menu navigasi sebelah kiri.

    ![Tautan Input dipilih di menu sebelah kiri.](../media/inputs-link.png "Tautan input")

2. Dari blade Input, pilih **+ Tambahkan input stream** di bar alat atas, lalu pilih **Pusat Aktivitas** untuk membuat input Pusat Aktivitas baru.

    ![Tombol Tambahkan input stream dan item menu Pusat Aktivitas disorot.](../media/stream-analytics-add-input-link.png "Menambahkan input stream - Pusat Aktivitas")

3. Di blade **Input Baru**, konfigurasikan yang berikut ini:

    - **Nama:** Masukkan "eventhub".
    - **Pilih Pusat Aktivitas dari langganan:** Dipilih.
    - **Langganan:** Pastikan langganan yang Anda gunakan untuk lab ini dipilih.
    - **Namespace Pusat Aktivitas:** Pilih namespace Pusat Aktivitas yang Anda gunakan untuk lab ini.
    - **Nama Pusat Aktivitas:** Pilih **Gunakan yang ada**, lalu pilih **telemetri**, yang Anda buat sebelumnya.
    - **Grup konsumen Pusat Aktivitas:** Pilih **Gunakan yang ada**, lalu pilih **$Default**.
    - **Mode autentikasi:** Pilih **String koneksi**.
    - **Nama kebijakan Pusat Aktivitas:** Pilih **Gunakan yang ada**, lalu pilih **Baca**.
    - Biarkan semua nilai lainnya pada defaultnya.

        ![Formulir Input Baru diisi dengan pengaturan yang disebutkan sebelumnya dimasukkan ke bidang yang sesuai.](../media/stream-analytics-new-input.png "Input baru")

4. Pilih **Simpan** di bagian bawah formulir saat Anda selesai memasukkan nilai.
