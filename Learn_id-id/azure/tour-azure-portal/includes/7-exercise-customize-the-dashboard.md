Dasbor adalah alat yang fleksibel untuk mengelola berbagai aspek layanan Azure melalui Portal. Mereka membuatnya nyaman untuk memantau keadaan layanan Anda. Karena dapat dibagikan, mereka membantu memastikan bahwa semua orang di tim Anda melihat data yang sama serta tetap mengetahui keadaan komponen penting Anda. Mari kita membuat dasbor baru dan menambahkan beberapa ubin ke dalamnya.

## <a name="create-a-new-dashboard"></a>Buat dasbor baru

1. Di [portal Microsoft Azure](https://portal.azure.com/learn.docs.microsoft.com?azure-portal=true), dari sisi kiri atas, pilih **Tampilkan menu portal** >  **Dasbor**.
1. Pilih **Dasbor Baru**.

1. Di panel tengah, ubah **Dasbor Saya** menjadi `Customer Dashboard`.

## <a name="add-and-configure-the-clock-tile"></a>Menambahkan dan mengonfigurasi Ubin Jam

1. Di galeri ubin, seret jam ke ruang kerja. Letakkan di kanan atas ruang yang tersedia.

1. Pada panel **Edit jam**, ubah Lokasi ke **Waktu Pasifik (AS & Kanada)**.

1. Di bawah **Format waktu**, pilih **24 jam**.

1. Pilih **Selesai**.

1. Ulangi empat langkah sebelumnya, kecuali memilih **Waktu Timur (AS & Kanada)**. Anda sekarang harus memiliki dua jam, satu menunjukkan waktu di Pantai Barat, yang lain di Pantai Timur.

## <a name="resize-a-tile"></a>Mengubah ukuran ubin

1. Di bawah **Galeri Ubin**, seret ubin **Semua sumber daya** dan lepaskan ke sisi kiri atas ruang kerja dasbor baru.

1. Arahkan kursor ke ubin **Semua sumber daya** baru dan pilih ikon elipsis (**...**); lalu pilih ukuran **6x6**.

1. Pilih sudut abu-abu di sisi kanan bawah ubin, serta mengubah ukuran ubin menjadi 3,5 kuadrat secara vertikal sebesar enam secara horizontal. Saat Anda selesai mengubah ukuran, ubin menyesuaikan dengan 4x6.

1. Di Galeri Ubin, seret ubin **Grup Sumber Daya** ke ruang kerja. Letakkan di bawah ubin **Semua sumber daya**.

1. Di Galeri Ubin, pilih ubin **Bagan metrik**, dan seret ke ruang kerja. Tempatkan di sebelah kanan ubin **Semua sumber daya**.

1. Terus tambahkan ubin berikut ini, susun ulang agar pas:

    - Bantuan + dukungan
    - Tugas Cepat
    - Marketplace

1. Setelah Anda menambahkan ubin ini, pilih **Selesai menyesuaikan**. Dasbor **Dasbor Pelanggan** akan muncul.

## <a name="clone-a-dashboard"></a>Mengkloning dasbor

Anda sekarang ingin membuat dasbor serupa untuk beberapa pelanggan lain.

1. Pilih tombol **Klon**.

1. Ubah nama dasbor dari **Klon Dasbor Pelanggan** menjadi **Dasbor Admin Microsoft Azure AD**.

1. Pada ubin **Grup Sumber Daya**, pilih ikon tong sampah **Hapus dari dasbor** untuk menghapus ubin ini.

1. Dari Galeri Ubin, tambahkan ubin berikut ini:

    - Identitas Organisasi
    - Pengguna dan Grup
    - Ringkasan Aktivitas Pengguna

1. Ubah posisi ubin seperlunya, lalu pilih **Selesai menyesuaikan**.

## <a name="share-a-dashboard"></a>Mengkloning dasbor

Anda sekarang ingin membuat dasbor ini tersedia untuk pengguna lain. Di lingkungan kotak pasir, Anda tidak akan dapat menerbitkan dasbor bersama. Namun, Anda dapat melihat cara berbagi dasbor dengan menyelesaikan langkah-langkah berikut.

1. Dari dasbor Admin Microsoft Azure AD, pilih tombol **Bagikan** di bagian atas. Panel **Berbagi dan kontrol akses** yang muncul.
1. Untuk menerbitkan ke grup sumber daya tertentu, hapus centang dari kotak **Publikasikan ke grup sumber daya 'dasbor'**.
1. Pilih grup sumber daya <rgn>[nama grup sumber daya kotak pasir]</rgn> dari tarik turun **Grup sumber daya**.
1. Pilih **Terbitkan**.
1. Pada titik ini di lingkungan sandbox, Anda akan menerima kesalahan. Tidak masalah. 
1. Tutup panel **Berbagi + kontrol akses**.

## <a name="edit-a-dashboardjson-file"></a>Mengedit file dashboard.json

Untuk memperlihatkan bagaimana Anda bisa mengunduh serta mengedit file dasbor, lakukan langkah-langkah berikut:

1. Pilih **Unduh**.

1. Buka penjelajah file di komputer Anda dan navigasikan ke tempat browser web Anda mengunduh dasbor, biasanya di folder **Unduhan**.

1. Temukan file *Customer Dashboard.json* dan buka di editor teks.

1. Di editor Anda, cari teks *ClockPart*.

1. Pada kemunculan pertama ClockPart, ubah nilai **posisi** > **rowSpan** sebelumnya menjadi 1.

1. Pada kemunculan kedua ClockPart, ubah juga nilai **posisi** > **rowSpan** sebelumnya menjadi 1.

1. Saat kemunculan kedua ClockPart, ubah nilai **posisi** > **y** dari 2 menjadi 1.

1. Simpan file *Customer Dashboard.json* dan tutup editor kode Anda.

1. Di dasbor Azure, pilih **Unggah**.

1. Di kotak dialog **Buka**, telusuri folder Unduhan, dan klik dua kali *Dasbor Pelanggan.json*.

    Jam telah berubah ukuran menjadi satu baris tinggi, serta jam bawah telah bergerak naik satu baris.

## <a name="delete-a-dashboard"></a>Menghapus dasbor

1. Pastikan dasbor **Admin Microsoft Azure AD** dipilih.

1. Pilih tombol **Hapus**.

1. Di kotak pesan **Konfirmasi**, pilih kotak centang untuk mengonfirmasi bahwa dasbor ini tidak lagi terlihat, lalu pilih **OK**.

## <a name="reset-a-dashboard"></a>Menyetel ulang dasbor

1. Pastikan bahwa **Dasbor Pelanggan** dipilih.

1. Pilih **Edit**.

1. Klik kanan pada ruang kerja, dan pilih **Reset ke keadaan default**.

1. Di kotak pesan **Reset dasbor ke keadaan default**, pilih **Ya**.

    Dasbor Pelanggan telah disetel ulang ke ubin defaultnya.

1. Pilih **Selesai menyesuaikan**.

1. Pilih nama Anda di kanan atas portal.

1. Pilih **Keluar**.

1. Tutup browser Anda.

Selamat! Anda sekarang telah membuat dan mengedit dasbor, membagikannya, mengubahnya sebagai file **JSON**, serta terakhir, menyetel ulang ke status default. Anda sekarang dapat melihat dasbor alat canggih apa serta bagaimana Anda dapat menggunakannya untuk membuat antarmuka yang efisien untuk peran yang berbeda dalam organisasi.
