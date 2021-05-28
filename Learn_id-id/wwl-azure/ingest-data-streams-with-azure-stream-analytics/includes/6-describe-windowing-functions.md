Fungsi pembuatan jendela adalah operasi yang dilakukan terhadap data yang terdapat dalam jendela sementara atau kotak waktu. Jendela berisi data kejadian di sepanjang garis waktu. Menggunakan pembuatan jendela menyediakan cara menggabungkan peristiwa selama berbagai interval waktu tergantung pada definisi jendela tertentu.

Dalam aplikasi yang memproses peristiwa real-time, komputasi atau agregasi kotak waktu, seperti menghitung berapa kali peristiwa terjadi selama periode tertentu, adalah pola yang sering digunakan. Kemampuan mengkueri segmen waktu dengan mudah adalah kebutuhan mendasar untuk sistem pemrosesan peristiwa. Azure Stream Analytics menyertakan dukungan asli untuk [lima jenis fungsi pembuatan jendela sementara.](https://docs.microsoft.com/stream-analytics-query/windowing-azure-stream-analytics) Fungsi-fungsi ini memungkinkan Anda mengembangkan solusi analitik real-time yang kuat menggunakan [bahasa seperti SQL](https://docs.microsoft.com/stream-analytics-query/stream-analytics-query-language-reference) yang mudah dan deklaratif dengan dukungan tersemat untuk logika sementara.

Fungsi pembuatan jendela yang didukung yaitu [Jatuh](https://docs.microsoft.com/stream-analytics-query/tumbling-window-azure-stream-analytics), [Lompat](https://docs.microsoft.com/stream-analytics-query/hopping-window-azure-stream-analytics), [Geser](https://docs.microsoft.com/stream-analytics-query/sliding-window-azure-stream-analytics), [Sesi](https://docs.microsoft.com/stream-analytics-query/session-window-azure-stream-analytics), dan [Rekam Jepret](https://docs.microsoft.com/stream-analytics-query/snapshot-window-azure-stream-analytics).

## <a name="tumbling"></a>Jatuh

Fungsi jendela **Jatuh** membagi aliran data menjadi serangkaian segmen waktu berukuran tetap dan tidak tumpang tindih dan beroperasi terhadapnya. Peristiwa tidak boleh dimiliki lebih dari satu jendela jatuh.

![Diagram ini menggambarkan stream dengan serangkaian peristiwa yang dipetakan ke dalam jendela jatuh berdurasi 10 menit.](../media/tumble-window.png "Jendela jatuh")

Contoh jendela Jatuh, yang diwakili oleh kueri di bawah ini, menghitung berapa kali setiap peristiwa terjadi selama jendela 10 menit. Fungsi pembuatan jendela diterapkan dalam pekerjaan Analisis Aliran menggunakan klausul [GRUP MENURUT](https://docs.microsoft.com/stream-analytics-query/group-by-azure-stream-analytics) dari sintaks kueri. Klausul `GROUP BY`dalam kueri di bawah ini berisi fungsi `TumblingWindow()`, yang menentukan ukuran jendela 10 menit.

```sql
SELECT EventName, COUNT(*) AS Count
FROM EventStream TIMESTAMP BY EventTimestamp
GROUP BY EventName, TumblingWindow(minute, 10)
```

Jendela Azure Stream Analytics terbuka pada waktu mulai jendela dan tutup pada waktu akhir jendela. Dalam contoh di atas, jika jendela 10 menit terjadi dari pukul 12:00 sampai 12:10, jendela akan mencakup semua peristiwa dengan tanda waktu yang lebih besar dari pukul 12:00 dan hingga 12:10 termasuk. Secara default, jendela termasuk bagian akhir jendela dan tidak termasuk bagian awal. Namun, Anda dapat menggunakan parameter `Offset` untuk mengubah perilaku ini. Output jendela akan menjadi peristiwa tunggal berdasarkan fungsi agregat yang digunakan dengan tanda waktu yang sama dengan waktu akhir jendela. Semua fungsi pembuatan jendela memberikan hasilnya di akhir jendela yang ditentukan.

## <a name="hopping"></a>Lompat

Model fungsi jendela **Lompat** yang dijadwalkan tumpang tindih antarjendela, melompat maju dalam waktu dengan periode tetap. Mungkin paling mudah untuk menganggapnya sebagai jendela Jatuh yang dapat tumpang tindih dan dipancarkan lebih sering daripada ukuran jendela. Ternyata, jendela yang jatuh hanyalah jendela lompat yang `hop` sama dengan `size`. Saat menggunakan jendela Jatuh, peristiwa bisa menjadi milik lebih dari satu set hasil jendela.

![Diagram ini mengilustrasikan stream dengan serangkaian acara. Kotak mewakili setiap jendela lompat dan peristiwa yang dihitung sebagai bagian dari jendela itu. Lompatan adalah 5, dan ukurannya 10](../media/hop-window.png "Jendela lompat")

Untuk membuat jendela lompat, Anda harus menentukan tiga parameter. Parameter pertama menunjukkan unit waktu, seperti detik, menit, atau jam. Parameter berikut mengatur ukuran jendela, yang menentukan berapa lama setiap jendela berlangsung. Parameter akhir yang diperlukan adalah ukuran lompat, yang menentukan berapa banyak setiap jendela bergerak maju relatif terhadap yang sebelumnya. Parameter keempat opsional yang menunjukkan ukuran offset juga dapat digunakan.

Kueri di bawah ini menunjukkan menggunakan `HoppingWindow()` di mana `timeunit` diatur ke `second`. `windowsize`10 detik, dan `hopsize` 5 detik. Kueri ini menghasilkan peristiwa setiap lima detik yang berisi hitungan peristiwa yang terjadi selama 10 detik terakhir.

```sql
-- Count the number of times each event occurs every 10 seconds
SELECT EventName, COUNT(*) AS Count
FROM EventStream TIMESTAMP BY EventTimestamp
GROUP BY EventName, HoppingWindow(second, 10, 5)
```

## <a name="sliding"></a>Geser

Jendela **geser** menghasilkan peristiwa untuk titik-titik pada waktunya ketika konten jendela benar-benar berubah. Untuk membatasi jumlah jendela yang perlu dipertimbangkan, Azure Stream Analytics menghasilkan peristiwa hanya untuk titik-titik tersebut pada waktunya ketika peristiwa memasuki atau keluar dari jendela. Dengan demikian, setiap jendela berisi minimal satu peristiwa. Peristiwa di jendela Geser dapat dimiliki lebih dari satu jendela geser, mirip dengan jendela Lompat.

![Diagram ini menggambarkan stream dengan serangkaian peristiwa yang dipetakan ke dalam jendela geser berdurasi 10 menit.](../media/slide-window.png "Jendela geser")

Kueri di bawah ini menggunakan fungsi `SlidingWindow()` untuk menemukan peristiwa yang telah terjadi lebih dari tiga kali dalam sepuluh menit terakhir.

```sql
SELECT
    DateAdd(minute,-5,System.Timestamp()) AS WinStartTime,
    System.Timestamp() AS WinEndTime,
    EventName,
    COUNT(*) AS Count
FROM EventStream TIMESTAMP BY EventTimestamp
GROUP BY EventName, SlidingWindow(minute, 10)
HAVING COUNT(*) > 3
```

## <a name="session"></a>Sesi

Fungsi jendela **sesi** mengelompokkan peristiwa yang tiba pada waktu yang sama, menyaring periode waktu di mana tidak ada data. Fungsi jendela ini memiliki tiga parameter utama: batas waktu, durasi maksimum, dan kunci partisi (opsional).

![Diagram ini mengilustrasikan stream dengan serangkaian acara yang dipetakan ke dalam jendela sesi dengan batas waktu 5 menit dan durasi maksimum 10 menit.](../media/session-window.png "Jendela sesi")

Terjadinya peristiwa pertama memulai jendela sesi. Misalkan kejadian lain terjadi dalam batas waktu yang ditentukan dari peristiwa terakhir yang diserap. Dalam hal ini, jendela akan diperluas untuk menggabungkan acara baru. Namun, jika tidak ada kejadian lain yang terjadi dalam periode batas waktu yang ditentukan, jendela akan ditutup pada saat batas waktu. Jika peristiwa terus terjadi dalam batas waktu yang ditentukan, jendela sesi akan diperpanjang hingga durasi maksimum tercapai.

Kueri berikut mengukur durasi sesi pengguna dengan membuat `SessionWindow` data aliran klik berlebih dengan `timeoutsize` 5 menit dan `maximumdurationsize` 60 menit.

```sql
-- Output the count of events that occur within 2 minutes of each other with a maximum duration of 60 minutes.
SELECT
    Username,
    MIN(ClickTime) AS WindowStart,
    System.Timestamp() AS WindowEnd,
    DATEDIFF(s, MIN(ClickTime), System.Timestamp()) AS DurationInSeconds
FROM Clickstream TIMESTAMP BY ClickTime
GROUP BY Username, SessionWindow(minute, 2, 60) OVER (PARTITION BY Username)
```

Kueri di atas juga mendefinisikan kunci partisi `Username`. Kunci partisi mengakibatkan peristiwa dikelompokkan menurut kunci, dan jendela sesi diterapkan ke setiap grup secara independen. Pengelompokan ini berguna untuk kasus di mana Anda memerlukan jendela sesi yang berbeda untuk pengguna atau perangkat yang berbeda. Partisi yang ditentukan dalam kueri di atas berarti masing-masing `Username` dilacak dalam jendela sesi independen. Untuk setiap jendela, kueri ini akan menghasilkan output yang berisi `Username`, waktu mulai jendela (`WindowStart`), akhir jendela (`WindowEnd`), dan total durasi sesi pengguna (`DurationInSeconds`).

## <a name="snapshot"></a>Snapshot

**Jendela** snapshot mengelompokkan peristiwa menurut nilai tanda waktu yang sama. Tidak seperti jenis jendela lainnya, fungsi jendela tertentu (seperti [SessionWindow()](https://docs.microsoft.com/stream-analytics-query/session-window-azure-stream-analytics), tidak diperlukan. Anda dapat menggunakan jendela snapshot dengan menambahkan `System.Timestamp()` ke klausul `GROUP BY` kueri.

![Diagram ini menggambarkan stream dengan serangkaian peristiwa yang dipetakan ke dalam jendela snapshot.](../media/snapshot-window.png "Jendela snapshot")

Misalnya, kueri berikut menghasilkan jumlah peristiwa dengan nama sama yang terjadi pada saat yang sama.

```sql
SELECT EventName, COUNT(*) AS Count
FROM EventStream TIMESTAMP BY EventTimestamp
GROUP BY EventName, System.Timestamp()
```

`System.Timestamp()` dianggap dalam klausul `GROUP BY` sebagai definisi jendela snapshot karena mengelompokkan peristiwa ke dalam jendela berdasarkan kesetaraan tanda waktu.
