Dalam latihan ini, Anda mengonfigurasi output Azure Stream Analytics untuk Power BI dan output kedua untuk [Azure Synapse Analytics](https://docs.microsoft.com/azure/synapse-analytics/overview-what-is). [Power BI](https://docs.microsoft.com/power-bi/fundamentals/power-bi-overview) menyediakan platform untuk memvisualisasikan dan menganalisis data agregat dalam alur analitik yang hampir real-time yang dibangun di Azure Event Hubs, Azure Stream Analytics, dan Power BI.

1. Dari blade pekerjaan Analisis Aliran di [portal Microsoft Azure](https://portal.azure.com/), pilih **Input** di menu navigasi sebelah kiri.

    ![Tautan Output dipilih di menu sebelah kiri.](../media/outputs-link.png 'Tautan Output')

2. Di blade Output, pilih **+ Tambahkan** di bar alat atas, lalu pilih **Power BI** untuk membuat output Power BI baru.

    ![Tombol Tambahkan dan item menu Power BI disorot.](../media/stream-analytics-add-output-link.png 'Menambahkan output - Power BI')

3. Di blade **Output Baru**, pilih tombol **Otorisasi** untuk mengotorisasi koneksi dari Analisis Aliran ke akun Power BI Anda.

    ![Tombol Otorisasi disorot di blade Output Baru.](../media/stream-analytics-new-output-authorize.png 'Output Baru')

4. Ketika diminta, masuk ke akun Power BI Anda, yang merupakan nama pengguna dan kata sandi yang sama dengan yang Anda berikan dan digunakan untuk masuk ke portal Microsoft Azure.

    ![Formulir masuk Power BI ditampilkan.](../media/power-bi-sign-in.png 'Masuk Power BI')

5. Setelah berhasil masuk ke akun Power BI Anda, blade Output Baru akan diperbarui untuk menunjukkan bahwa Anda saat ini diotorisasi.

    ![Blade Output Baru telah diperbarui untuk memperlihatkan pengguna diotorisasi ke Power BI.](../media/stream-analytics-new-output-authorized.png 'Diotorisasi')

6. Di blade **Input Baru**, konfigurasikan yang berikut ini:

    - **Alias output:** Masukkan "powerBIAlerts".
    - **Mode autentikasi:** Pilih "Token pengguna".
    - **Ruang kerja grup:** Pilih "Ruang Kerja Saya" (jika Anda tidak melihat opsi ini, pilih mode autentikasi "Token pengguna" terlebih dahulu).
    - **Nama himpunan data:** Masukkan "ContosoAutoVehicleAnomalies".
    - **Nama tabel:** Masukkan "Peringatan".

        ![Formulir Output Baru diisi dengan pengaturan yang disebutkan sebelumnya dimasukkan ke bidang yang sesuai.](../media/stream-analytics-new-output.png 'Output Baru')

7. Pilih **Simpan** di bagian bawah formulir saat Anda selesai memasukkan nilai.

## <a name="create-an-azure-synapse-analytics-output"></a>Membuat output Azure Synapse Analytics

1. Pilih **+ Tambahkan** di bar alat atas untuk kedua kalinya dan pilih **Azure Synapse Analytics (sebelumnya SQL DW)** untuk membuat output Synapse Analytics baru.

    ![Item menu Azure Synapse Analytics disorot.](../media/stream-analytics-add-output-synapse-link.png "Menambahkan output - Azure Synapse Analytics")

2. Di blade **Input Baru**, konfigurasikan yang berikut ini:

    - **Alias output:** Masukkan "synapse".
    - **Pilih Azure Synapse Analytics dari langganan:** Dipilih.
    - **Langganan:** Pilih langganan yang Anda gunakan untuk lab ini.
    - **Database:** Pilih "ContosoAuto". Pastikan nama ruang kerja Synapse Anda yang benar muncul di bawah "Nama server".
    - **Tabel:** Masukkan `dbo.VehicleAverages`
    - **Mode autentikasi:** Pilih "String koneksi".
    - **Nama pengguna:** Masukkan `asa.sql.admin`
    - **Kata sandi:** Masukkan nilai kata sandi admin SQL yang Anda masukkan saat menyebarkan lingkungan lab.

        ![Formulir Output Baru diisi dengan pengaturan yang disebutkan sebelumnya dimasukkan ke bidang yang sesuai.](../media/synapse-new-output.png "Output Baru")

3. Pilih **Simpan** di bagian bawah formulir saat Anda selesai memasukkan nilai.
