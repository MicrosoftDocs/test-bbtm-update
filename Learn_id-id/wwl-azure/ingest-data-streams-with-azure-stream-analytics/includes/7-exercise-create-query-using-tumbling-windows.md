Dalam latihan ini, Anda membuat kueri Synapse Analytics menggunakan [Jendela Jatuh](https://docs.microsoft.com/stream-analytics-query/tumbling-window-azure-stream-analytics). Kueri akan menggabungkan data streaming yang diterima dari input Pusat Aktivitas dan mengirimkannya ke Power BI dan Azure Synapse Analytics untuk visualisasi dan analisis.

1. Dari blade pekerjaan Analisis Aliran di [portal Microsoft Azure](https://portal.azure.com/), pilih **Kueri** di menu navigasi sebelah kiri.

    ![Tautan Kueri dipilih di menu sebelah kiri.](../media/query-link.png 'Tautan kueri')

2. Kosongkan jendela edit **Kueri** dan tempelkan yang berikut ini di tempatnya:

    ```sql
    WITH Averages AS (
        SELECT
            AVG(engineTemperature) averageEngineTemperature,
            AVG(speed) averageSpeed
        FROM
            eventhub TIMESTAMP BY [timestamp]
        GROUP BY
            TumblingWindow(Duration(second, 2))
    ),
    Anomalies AS (
        select
            t.vin,
            t.[timestamp],
            t.city,
            t.region,
            t.outsideTemperature,
            t.engineTemperature,
            a.averageEngineTemperature,
            t.speed,
            a.averageSpeed,
            t.fuel,
            t.engineoil,
            t.tirepressure,
            t.odometer,
            t.accelerator_pedal_position,
            t.parking_brake_status,
            t.headlamp_status,
            t.brake_pedal_status,
            t.transmission_gear_position,
            t.ignition_status,
            t.windshield_wiper_status,
            t.abs,
            (CASE WHEN a.averageEngineTemperature >= 405 OR a.averageEngineTemperature <= 15 THEN 1 ELSE 0 END) AS enginetempanomaly,
            (CASE WHEN t.engineoil <= 1 THEN 1 ELSE 0 END) AS oilanomaly,
            (CASE WHEN (t.transmission_gear_position = 'first' OR
                t.transmission_gear_position = 'second' OR
                t.transmission_gear_position = 'third') AND
                t.brake_pedal_status = 1 AND
                t.accelerator_pedal_position >= 90 AND
                a.averageSpeed >= 55 THEN 1 ELSE 0 END) AS aggressivedriving
        FROM eventhub t TIMESTAMP BY [timestamp]
        INNER JOIN Averages a ON DATEDIFF(second, t, a) BETWEEN 0 And 2
    ),
    VehicleAverages AS (
        SELECT
            AVG(engineTemperature) averageEngineTemperature,
            AVG(speed) averageSpeed,
            System.TimeStamp() AS snapshot
        FROM
            eventhub TIMESTAMP BY [timestamp]
        GROUP BY
            TumblingWindow(Duration(minute, 2))
    )

    -- INSERT INTO POWER BI
    SELECT
        *
    INTO
        powerBIAlerts
    FROM
        Anomalies
    WHERE aggressivedriving = 1 OR enginetempanomaly = 1 OR oilanomaly = 1

    -- INSERT INTO SYNAPSE ANALYTICS
    SELECT
        *
    INTO
        synapse
    FROM
        VehicleAverages
    ```

    ![Kueri di atas telah dimasukkan ke dalam jendela Kueri.](../media/stream-analytics-query.png 'Jendela kueri')

    Kueri rata-rata suhu dan kecepatan mesin selama durasi dua detik dengan menambahkan `TumblingWindow(Duration(second, 2))` ke klausul `GROUP BY` kueri. Kemudian kueri ini memilih semua data telemetri, termasuk nilai rata-rata dari langkah sebelumnya, dan menentukan anomali berikut sebagai bidang baru:

    a. **enginetempanomaly**: Ketika suhu mesin rata-rata \>= 405 atau \<= 15.

    b. **oilanomaly**: Ketika oli mesin \<= 1.

    c. **agresifdriving**: Ketika posisi roda gigi transmisi berada di urutan pertama, kedua, atau ketiga, dan status pedal rem adalah 1, posisi pedal akselerator \>= 90, dan kecepatan rata-rata \>= 55.

    Kueri menghasilkan semua bidang dari anomali yang masuk ke `powerBIAlerts` output di mana `aggressivedriving = 1` atau `enginetempanomaly = 1` atau `oilanomaly = 1` untuk pelaporan. Kueri juga menggabungkan suhu dan kecepatan mesin rata-rata semua kendaraan selama dua menit terakhir, menggunakan `TumblingWindow(Duration(minute, 2))`, dan menghasilkan bidang ini ke output `synapse`.

3. Pilih **Simpan kueri** di bar alat atas saat Anda selesai memperbarui kueri.

4. Untuk memulai kueri, pilih **Gambaran Umum** dalam menu navigasi kiri dari blade pekerjaan Analisis Aliran. Di atas blade Gambaran Umum, pilih **Mulai**.

    ![Tombol Mulai disorot di atas blade Gambaran Umum.](../media/stream-analytics-overview-start-button.png 'Gambaran Umum')

5. Di blade Mulai pekerjaan yang muncul, pilih **Sekarang** untuk waktu mulai output pekerjaan, lalu pilih **Mulai**. Ini akan memulai pekerjaan Analisis Aliran, sehingga akan siap untuk mulai memproses dan mengirim peristiwa ke Power BI nanti.

    ![Tombol Sekarang dan Mulai disorot dalam blade Mulai pekerjaan.](../media/stream-analytics-start-job.png 'Mulai pekerjaan')
