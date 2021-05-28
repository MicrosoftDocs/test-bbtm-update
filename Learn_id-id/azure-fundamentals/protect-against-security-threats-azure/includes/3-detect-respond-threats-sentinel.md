Manajemen keamanan dalam skala besar dapat memperoleh manfaat dari sistem informasi keamanan dan manajemen peristiwa (SIEM) khusus. Sistem SIEM menggabungkan data keamanan dari berbagai sumber (selama sumber tersebut mendukung format pengelogan standar terbuka). Ini juga menyediakan kemampuan untuk deteksi dan respons terhadap ancaman.

[Azure Sentinel](https://azure.microsoft.com/services/azure-sentinel/?azure-portal=true) adalah sistem SIEM berbasis cloud dari Microsoft. Sistem ini menggunakan analitik keamanan cerdas dan analisis ancaman.

## <a name="azure-sentinel-capabilities"></a>Kemampuan Azure Sentinel

Azure Sentinel memungkinkan Anda untuk:

+ **Mengumpulkan data cloud dalam skala besar**

    Kumpulkan data di semua pengguna, perangkat, aplikasi, dan infrastruktur, baik secara lokal maupun dari beberapa cloud.

+ **Mendeteksi ancaman yang sebelumnya tidak terdeteksi**

    Minimalkan positif palsu dengan menggunakan inteligensi ancaman dan analitik komprehensif Microsoft.

+ **Menyelidiki ancaman dengan kecerdasan buatan**

    Periksa aktivitas mencurigakan dalam skala besar, dengan memanfaatkan pengalaman keamanan siber selama bertahun-tahun dari Microsoft.

+ **Menanggapi insiden dengan cepat**

    Gunakan orkestrasi bawaan dan otomatisasi tugas umum.

## <a name="connect-your-data-sources"></a>Menyambungkan sumber data Anda

Tailwind Traders memutuskan untuk mengeksplorasi kemampuan Azure Sentinel. Pertama, perusahaan tersebut mengidentifikasi dan menyambungkan sumber datanya.

Azure Sentinel mendukung sejumlah sumber data, yang dapat dianalisis terkait peristiwa keamanan. Koneksi tersebut ditangani oleh konektor bawaan atau format log standar industri dan API.

+ **Menyambungkan solusi Microsoft**

    Konektor menyediakan integrasi real time untuk layanan seperti solusi Microsoft Threat Protection, sumber Microsoft 365 (termasuk Office 365), Azure Active Directory, dan Windows Defender Firewall.

+ **Menyambungkan layanan dan solusi lain**

    Konektor tersedia untuk layanan dan solusi umum non-Microsoft, termasuk AWS CloudTrail, Citrix Analytics (Security), Sophos XG Firewall, VMware Carbon Black Cloud, dan Okta SSO.

+ **Menyambungkan sumber data standar industri**

    Azure Sentinel mendukung data dari sumber lain yang menggunakan standar olahpesan Common Event Format (CEF), Syslog, atau REST API.

## <a name="detect-threats"></a>Mendeteksi ancaman

Tailwind Trader perlu diberi tahu ketika sesuatu yang mencurigakan terjadi. Ini memutuskan untuk menggunakan analitik bawaan dan aturan kustom untuk mendeteksi ancaman.

**Analitik bawaan** menggunakan templat yang dirancang oleh tim pakar dan analis keamanan Microsoft berdasarkan ancaman yang diketahui, vektor serangan umum, dan rantai eskalasi untuk aktivitas yang mencurigakan. Templat ini dapat dikustomisasi dan mencari aktivitas apa pun yang terlihat mencurigakan di seluruh lingkungan. Beberapa templat menggunakan analitik perilaku pembelajaran mesin yang didasarkan pada algoritme milik Microsoft.

**Analitik kustom** adalah aturan yang Anda buat untuk mencari kriteria tertentu dalam lingkungan Anda. Anda dapat mempratinjau jumlah hasil yang akan dibuat kueri (berdasarkan peristiwa log sebelumnya) dan mengatur jadwal kueri untuk dijalankan. Anda juga dapat mengatur ambang peringatan.

## <a name="investigate-and-respond"></a>Menyelidiki dan merespons

Saat Azure Sentinel mendeteksi peristiwa mencurigakan, Tailwind Traders dapat menyelidiki peringatan atau *insiden* tertentu (sekelompok peringatan terkait). Dengan grafik investigasi, perusahaan dapat meninjau informasi dari entitas yang tersambung langsung ke peringatan, dan melihat kueri eksplorasi umum untuk membantu memandu penyelidikan.

Berikut adalah contoh yang menunjukkan tampilan grafik investigasi di Azure Sentinel.

:::image type="content" source="../media/3-investigate-incidents.png" alt-text="Contoh grafik investigasi insiden di Azure Sentinel." lightbox="../media/3-investigate-incidents.png":::

Perusahaan juga akan menggunakan [Buku Kerja Azure Monitor](https://docs.microsoft.com/azure/azure-monitor/platform/workbooks-overview/?azure-portal=true) untuk mengotomatiskan respons terhadap ancaman. Misalnya, ini bisa mengatur pemberitahuan yang mencari alamat IP berbahaya yang mengakses jaringan dan membuat buku kerja yang melakukan langkah-langkah berikut:

1. Ketika peringatan dipicu, buka tiket dalam sistem tiket TI.
1. Kirim pesan ke saluran operasi keamanan di Microsoft Teams atau Slack untuk memastikan analis keamanan mengetahui insiden tersebut.
1. Kirim semua informasi dalam pemberitahuan ke admin jaringan senior dan ke admin keamanan. Pesan email mencakup dua tombol opsi pengguna: **Blokir** atau **Abaikan**.

Saat admin memilih **Blokir**, alamat IP diblokir di firewall, dan pengguna dinonaktifkan di Azure Active Directory. Saat admin memilih **Abaikan**, peringatan ditutup di Azure Sentinel, dan insiden ditutup dalam sistem tiket TI.

Buku kerja terus berjalan setelah menerima respons dari admin.

Buku kerja dapat dijalankan secara manual atau otomatis saat aturan memicu peringatan.
