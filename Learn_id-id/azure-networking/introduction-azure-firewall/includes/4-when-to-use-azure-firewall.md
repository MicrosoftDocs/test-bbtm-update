Anda tahu apa itu Azure Firewall dan cara kerjanya. Sekarang, Anda memerlukan beberapa kriteria untuk membantu Anda mengevaluasi apakah Azure Firewall dan Azure Firewall Manager adalah pilihan yang cocok untuk perusahaan Anda. Untuk membantu Anda memutuskan, mari kita pertimbangkan skenario berikut:

- Anda ingin melindungi jaringan Anda dari infiltrasi.
- Anda ingin melindungi jaringan Anda dari kesalahan pengguna.
- Bisnis Anda mencakup pembayaran e-niaga atau kartu kredit.
- Anda ingin mengonfigurasi konektivitas spoke-to-spoke.
- Anda ingin memantau lalu lintas masuk dan keluar.
- Jaringan Anda memerlukan beberapa firewall.
- Anda ingin menerapkan kebijakan firewall hierarkis.

Sebagai bagian dari evaluasi Azure Firewall dan Azure Firewall Manager, Anda tahu bahwa Contoso telah menghadapi beberapa skenario tersebut. Baca bagian terkait berikut ini untuk mengetahui detail selengkapnya.

## <a name="you-want-to-protect-your-network-against-infiltration"></a>Anda ingin melindungi jaringan Anda dari infiltrasi

Tujuan umum dari kebanyakan orang jahat adalah menyusup ke jaringan Anda. Penyusup ini mungkin ingin menggunakan sumber daya jaringan Anda atau memeriksa, mencuri, atau menghancurkan data sensitif atau eksklusif.

Azure Firewall dirancang untuk membantu mencegah penyusupan tersebut. Misalnya, peretas jahat mungkin mencoba menyusup ke jaringan dengan meminta akses ke sumber daya jaringan. Azure Firewall menggunakan inspeksi paket jaringan dalam berbagai status untuk memeriksa konteks permintaan tersebut. Jika permintaan adalah respons terhadap aktivitas yang sah sebelumnya, firewall kemungkinan akan mengizinkan permintaan; jika permintaan yang asalnya tidak jelas—seperti permintaan yang dikirim oleh seseorang yang sepertinya penyusup—firewall akan menolak permintaan tersebut.

## <a name="you-want-to-protect-your-network-against-user-error"></a>Anda ingin melindungi jaringan Anda dari kesalahan pengguna

Mungkin metode yang paling umum untuk menyusup ke jaringan atau menginstal malware di komputer jaringan adalah dengan mengelabui pengguna jaringan untuk mengklik tautan dalam pesan email. Tautan itu mengirim pengguna ke situs web berbahaya yang dikendalikan peretas yang menginstal malware atau menipu pengguna untuk memasukkan info masuk jaringan.

Azure Firewall mencegah serangan tersebut dengan menggunakan inteligensi ancaman untuk menolak akses ke domain dan alamat IP berbahaya yang diketahui.

## <a name="your-business-includes-e-commerce-or-credit-card-payments"></a>Bisnis Anda mencakup pembayaran e-niaga atau kartu kredit

Apakah bisnis Anda memiliki komponen e-niaga, atau apakah bisnis Anda memproses pembayaran kartu kredit online? Jika demikian, perusahaan Anda mungkin harus mematuhi Standar Keamanan Data Industri Kartu Pembayaran (PCI DSS). PCI DSS adalah serangkaian standar keamanan yang dibuat dan dikelola oleh Dewan Standar Keamanan PCI. Demi mematuhi aturan PCI, PCI DSS mencantumkan banyak persyaratan. Berikut persyaratan pertama:

- *Menginstal dan mempertahankan konfigurasi firewall untuk melindungi data pemegang kartu.*

PCI DSS menyatakan bahwa Anda harus mengatur konfigurasi firewall yang membatasi semua lalu lintas masuk dan keluar dari jaringan dan host yang tidak tepercaya. Firewall juga harus menolak semua lalu lintas lainnya kecuali untuk protokol yang diperlukan untuk memproses kartu pembayaran.

## <a name="you-want-to-configure-spoke-to-spoke-connectivity"></a>Anda ingin mengonfigurasi konektivitas spoke-to-spoke

Topologi jaringan spoke dan hub biasa memiliki karakteristik berikut:

- Satu jaringan virtual yang bertindak sebagai titik koneksi pusat—*hub*.
- Satu atau beberapa jaringan virtual yang di-peer ke hub—*spoke*. Jaringan lokal yang terhubung melalui sirkuit ExpressRoute atau gateway VPN juga dapat dianggap sebagai spoke dalam topologi ini.

Jaringan spoke dapat bertukar data dengan hub, tetapi spoke tidak dapat berkomunikasi langsung dengan satu sama lain. Anda mungkin perlu koneksi langsung. Misalnya, satu jaringan spoke mungkin menghosting antarmuka pemrograman aplikasi (API) yang memerlukan informasi dari database SQL yang diterapkan dalam spoke yang berbeda.

Salah satu solusinya adalah dengan mem-peer jaringan spoke dengan satu sama lain. Solusi tersebut efektif untuk beberapa koneksi seperti itu, tetapi efektivitas dapat menurun dengan cepat saat jumlah koneksi meningkat.

Solusi yang lebih mudah dan lebih aman adalah menggunakan Azure Firewall untuk mengatur konektivitas langsung antar spoke. Anda mencapai konektivitas ini dengan menerapkan instans Azure Firewall terlebih dahulu di hub. Kemudian konfigurasikan jaringan virtual spoke dengan rute yang ditentukan pengguna (UDR) yang secara khusus merutekan data melalui firewall dan ke spoke lain.

:::image type="content" source="../media/4-using-firewall.png" alt-text="Diagram jaringan koneksi spoke-to-spoke antara komputer virtual dan database SQL melalui Azure Firewall." border="false":::

## <a name="you-want-to-monitor-incoming-and-outgoing-traffic"></a>Anda ingin memantau lalu lintas masuk dan keluar

Perusahaan Anda mungkin ingin menganalisis laporan terperinci tentang lalu lintas jaringan masuk dan keluar. Ada banyak alasan untuk mewajibkan laporan tersebut, termasuk kepatuhan terhadap peraturan, menegakkan kebijakan perusahaan tentang penggunaan internet, dan pemecahan masalah.

Anda dapat mengonfigurasi Azure Firewall untuk mempertahankan log diagnostik dari empat tipe aktivitas firewall:

- Aturan aplikasi
- Aturan jaringan
- Inteligensi ancaman
- Proksi DNS

Misalnya, log untuk aturan aplikasi firewall Anda mungkin menyertakan entri seperti berikut ini untuk permintaan keluar:

- *HTTPS request from 10.1.0.20:24352 to somewebsite.com:443. Action: Allow. Rule Collection: collection100. Rule: rule105*

Demikian pula, log untuk aturan jaringan firewall Anda mungkin menyertakan entri seperti berikut ini untuk permintaan masuk:

- *TCP request from 73.121.236.17:12354 to 10.0.0.30:3389. Action: Deny*

Setelah mengaktifkan pembuatan log diagnostik, Anda dapat memantau dan menganalisis log dengan cara berikut:

- Anda dapat memeriksa log langsung dalam format JSON asli log.
- Anda dapat memeriksa log di Azure Monitor.
- Anda dapat memeriksa dan menganalisis log di Azure Firewall Workbook.

## <a name="your-network-requires-multiple-firewalls"></a>Jaringan Anda memerlukan beberapa firewall

Jika jejak Azure perusahaan Anda mencakup beberapa wilayah Azure, Anda memiliki beberapa koneksi internet, yang berarti Anda memerlukan instans firewall yang diterapkan untuk setiap koneksi tersebut. Anda dapat mengonfigurasi dan mengelola firewall tersebut secara terpisah, tetapi tindakan tersebut akan menciptakan beberapa masalah:

- Mengelola beberapa firewall sangatlah merepotkan.
- Perubahan aturan dan pengaturan global harus disebarluaskan ke setiap firewall.
- Sulit untuk menjaga konsistensi di semua firewall.

Azure Firewall Manager memecahkan masalah tersebut dengan memberi Anda antarmuka manajemen terpusat untuk setiap instans Azure Firewall di semua wilayah dan langganan Azure Anda. Anda dapat membuat kebijakan firewall, lalu menerapkan kebijakan ke setiap firewall untuk menjaga konsistensi. Perubahan pada kebijakan secara otomatis disebarluaskan ke semua instans firewall.

## <a name="you-want-to-implement-hierarchical-firewall-policies"></a>Anda ingin menerapkan kebijakan firewall hierarkis

Banyak perusahaan kecil hanya dapat menggunakan kebijakan firewall satu ukuran untuk semua. Artinya, perusahaan kecil sering membuat satu kebijakan firewall yang berlaku untuk setiap pengguna dan sumber daya di jaringan.

Namun, untuk sebagian besar perusahaan yang lebih besar, pendekatan yang lebih kontekstual dan terperinci diperlukan. Misalnya, pertimbangkan dua skenario berikut:

- Toko Azure DevOps mungkin memiliki jaringan virtual untuk mengembangkan aplikasi, jaringan virtual lain untuk pentahapan aplikasi, dan jaringan virtual ketiga untuk versi produksi aplikasi.
- Bisnis besar mungkin memiliki tim terpisah untuk pengguna database, teknik, dan penjualan. Masing-masing tim memiliki serangkaian aplikasi sendiri yang berjalan di jaringan virtual terpisah.

Meskipun tentunya akan ada aturan firewall yang umum untuk semua, pengguna dan sumber daya di setiap jaringan virtual akan memerlukan aturan firewall tertentu. Jadi, perusahaan yang lebih besar hampir selalu memerlukan kebijakan firewall *hierarkis*. Kebijakan firewall hierarkis terdiri dari dua komponen berikut:

- Satu *kebijakan firewall dasar* yang menerapkan aturan yang perlu diberlakukan perusahaan secara luas.
- Satu atau beberapa *kebijakan firewall lokal* yang menerapkan aturan yang khusus untuk aplikasi, tim, atau layanan tertentu. Kebijakan lokal mewarisi kebijakan firewall dasar, lalu menambahkan aturan yang terkait dengan aplikasi, tim, atau layanan yang mendasarinya.

Saat menggunakan Azure Firewall Manager, Anda dapat menyiapkan kebijakan firewall dasar, lalu membuat kebijakan lokal yang mewarisi kebijakan dasar dan menerapkan aturan khusus yang dirancang untuk sumber daya yang mendasarinya.

