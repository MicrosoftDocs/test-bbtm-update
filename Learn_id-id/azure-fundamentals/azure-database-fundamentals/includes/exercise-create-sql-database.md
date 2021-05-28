Tailwind Traders memilih Azure SQL Database sebagai bagian dari migrasinya. Anda telah ditugaskan untuk membuat database.

Dalam latihan ini, Anda akan membuat database SQL di Azure lalu melakukan kueri data pada database tersebut.

## <a name="task-1-create-the-database"></a>Tugas 1: Membuat database

Dalam tugas ini, Anda membuat database SQL berdasarkan sampel database _AdventureWorksLT_.

1. Masuk ke [portal Microsoft Azure](https://portal.azure.com/learn.docs.microsoft.com?azure-portal=true).

2. Pilih **Buat sumber daya** > **Database** > **Database SQL**. Masukkan informasi berikut.

    | Pengaturan | Nilai |
    | --- | --- |
    | Pada tab **Dasar**, di bagian **Detail proyek**: |
    | Langganan | **Langganan Pramutamu** |
    | Grup sumber daya | **<rgn>[nama grup sumber daya sandbox]</rgn>** |
    | Di bagian **Detail database**: |
    | Nama database | **db1** |
    | Server | Pilih **Buat baru**. |

3. Muncul **Panel server** baru. Masukkan informasi berikut (ganti **nnnn** di nama server dengan huruf dan angka, sedemikian rupa sehingga namanya unik secara global).

    | Pengaturan | Nilai |
    | --- | --- |
    | Nama server | **sqlservernnnn** (harus unik) |
    | Nama masuk admin server | **sqluser** |
    | Kata sandi | **Pa$$w 0rd1234** |
    | Lokasi | **(AS) AS Timur** |

    [![Cuplikan layar panel Server dan panel Server Baru dengan bidang yang diisi.](../media/server-pane.png)](../media/server-pane-expanded.png#lightbox)

4. Pilih **OK** setelah Anda selesai.

5. Pilih **Berikutnya : Jaringan,** dan konfigurasikan pengaturan berikut (biarkan default untuk bidang sisanya).

    | Pengaturan | Nilai |
    | --- | --- |
    | Di bagian **Konektivitas Jaringan**: |
    | Metode konektivitas | **Titik akhir publik** |

    :::image type="content" source="../media/tab.png" alt-text="Cuplikan layar tab Jaringan pada panel Buat SQL Database dengan pengaturan yang dipilih.":::

6. Pilih **Selanjutnya: Keamanan**, dan di sebelah **Aktifkan Azure Defender for SQL**, pilih **Tidak sekarang**.

   :::image type="content" source="../media/security-tab.png" alt-text="Cuplikan layar tab Keamanan pada panel Buat SQL Database dengan pengaturan yang dipilih.":::
7. Pilih **Selanjutnya: Pengaturan tambahan**, dan konfigurasikan pengaturan berikut.

    | Pengaturan | Nilai |
    | --- | --- |
    | Di bagian **Sumber data**: |
    | Gunakan data yang sudah ada | **Sampel** (ini akan membuat sampel database _AdventureWorksLT)_ |
    | Di bagian **Kolase database**: |
    | Kolase | *default* |

    :::image type="content" source="../media/additional-settings-tab.png" alt-text="Cuplikan layar tab Pengaturan tambahan pada panel Buat SQL Database dengan pengaturan yang dipilih.":::

8. Pilih **Tinjau + buat**.

9. Setelah validasi berhasil, pada jendela **Buat SQL Database**, pilih **Buat** untuk menyebarkan server dan database.

    Dibutuhkan sekitar dua hingga lima menit untuk membuat server dan menyebarkan database sampel.

10. Pilih **Buka sumber daya**.

11. Pilih **Atur firewall server**, lalu pilih **Ya** untuk **Mengizinkan layanan dan sumber daya Azure mengakses server ini**.

12. Pilih **Simpan**.

13. Pilih **OK**.

## <a name="task-2-test-the-database"></a>Tugas 2: Menguji database

Dalam tugas ini, Anda akan mengonfigurasi server dan menjalankan kueri SQL.

1. Dari panel **Semua sumber daya**, cari dan pilih **database SQL** dan pastikan Anda sudah membuat database baru. Anda mungkin perlu me-refresh halaman.

    ![Cuplikan layar editor Kueri database SQL (pratinjau).](../media/sql-database.png)

2. Pilih entri **db1** yang mewakili database SQL yang Anda buat, lalu pilih **Editor kueri (pratinjau)** pada bilah navigasi.

    ![Cuplikan layar database dan server SQL yang baru saja disebarkan.](../media/query-editor-preview.png)

3. Masuk sebagai **sqluser**, dengan kata sandi **Pa$$w0rd1234**.

4. Anda tidak akan dapat masuk.
    > [!NOTE]
    > Baca informasi kesalahan dengan cermat dan catat alamat IP yang perlu diizinkan melewati firewall.

    ![Cuplikan layar halaman masuk Penyunting Kueri dengan informasi kesalahan alamat IP.](../media/query-editor-login.png)

5. Pilih **Ringkasan** > **Atur firewall server**.

6. Di bagian **Alamat IP Klien**, IP Anda akan ditampilkan (periksa apakah itu alamat IP klien yang sama dari informasi kesalahan di atas). Klik **+ Tambahkan IP klien**, yang akan menambahkan **Nama aturan** dan masukkan IP Anda di bidang **Awal IP** dan **Akhir IP**, lalu pilih **Simpan**.

    ![Cuplikan layar halaman pengaturan firewall SQL Server, dengan sorotan aturan IP baru.](../media/sql-server-firewall-settings.png)

7. Kembali ke database SQL Anda dan halaman masuk Penyunting Kueri. Masuk lagi sebagai **sqluser**, dengan kata sandi **Pa$$w0rd1234**. Kali ini Anda seharusnya berhasil masuk. Mungkin memerlukan waktu beberapa menit untuk menyebarkan aturan firewall baru. Jika Anda masih mendapati informasi kesalahan, periksa alamat IP klien pada informasi kesalahan, dan coba pilih **Pengaturan firewall >** dan tambahkan lagi alamat IP klien yang benar.

8. Setelah Anda berhasil masuk, panel kueri akan muncul. Masukkan kueri berikut ke dalam panel editor.

    ```SQL
    SELECT TOP 20 pc.Name as CategoryName, p.name as ProductName
    FROM SalesLT.ProductCategory pc
    JOIN SalesLT.Product p
    ON pc.productcategoryid = p.productcategoryid;
    ```

    [![Cuplikan layar editor kueri dengan panel kueri dan perintah berhasil dijalankan.](../media/query-editor.png)](../media/query-editor-expanded.png#lightbox)

9. Pilih **Jalankan**, lalu tinjau hasil kueri di panel **Hasil**. Kueri seharusnya berhasil dijalankan.

    ![Cuplikan layar panel editor kueri database, dengan kode SQL telah berhasil dijalankan dan output terlihat pada panel hasil.](../media/database-query-editor-pane.png)

Selamat! Anda telah membuat database SQL di Azure dan berhasil melakukan kueri data pada database tersebut.
