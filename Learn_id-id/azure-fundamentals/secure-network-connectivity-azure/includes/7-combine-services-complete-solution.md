Saat Anda mempertimbangkan solusi keamanan Azure, pertimbangkan semua elemen pertahanan mendalam.

Berikut adalah beberapa rekomendasi tentang cara menggabungkan layanan Azure untuk membuat solusi keamanan jaringan lengkap.

## <a name="secure-the-perimeter-layer"></a>Amankan lapisan perimeter

Lapisan perimeter digunakan untuk melindungi sumber daya organisasi Anda dari serangan berbasis jaringan. Mengidentifikasi serangan ini, memperingatkan tim keamanan yang sesuai, dan menghilangkan dampaknya penting untuk menjaga keamanan jaringan Anda. Untuk melakukan ini:

+ Gunakan Azure DDoS Protection untuk memfilter serangan skala besar sebelum dapat menyebabkan penolakan layanan bagi pengguna.
+ Gunakan firewall perimeter untuk mengidentifikasi dan memberi tahu serangan berbahaya terhadap jaringan Anda.

## <a name="secure-the-network-layer"></a>Amankan lapisan jaringan

Pada lapisan ini, fokusnya adalah membatasi konektivitas jaringan di semua sumber daya Anda untuk hanya memungkinkan apa yang diperlukan. Segmentasikan sumber daya Anda dan gunakan kontrol tingkat jaringan untuk membatasi komunikasi hanya untuk apa yang diperlukan.

Dengan membatasi konektivitas, Anda mengurangi risiko pergerakan lateral di seluruh jaringan Anda dari serangan. Gunakan kelompok keamanan jaringan untuk membuat aturan yang menentukan komunikasi masuk dan keluar yang diizinkan pada lapisan ini. Berikut adalah beberapa praktik yang direkomendasikan:

+ Membatasi komunikasi antar sumber daya dengan membuat segmentasi jaringan dan mengonfigurasi kontrol akses.
+ Menolak secara default.
+ Membatasi akses internet masuk dan membatasi akses keluar jika sesuai.
+ Menerapkan konektivitas aman ke jaringan lokal.

## <a name="combine-services"></a>Menggabungkan layanan

Anda dapat menggabungkan layanan jaringan dan keamanan Azure untuk mengelola keamanan jaringan Anda dan memberikan perlindungan berlapis yang ditingkatkan. Berikut adalah dua cara yang dapat Anda gunakan untuk menggabungkan layanan:

+ **Kelompok keamanan jaringan dan Azure Firewall**

    Azure Firewall melengkapi fungsi kelompok keamanan jaringan. Bersama-sama, keduanya memberikan keamanan jaringan pertahanan yang lebih baik.

    Kelompok keamanan jaringan menyediakan pemfilteran lalu lintas lapisan jaringan terdistribusi untuk membatasi lalu lintas ke sumber daya dalam jaringan virtual di setiap langganan.

    Azure Firewall adalah firewall jaringan terpusat yang sepenuhnya mendukung berbagai status sebagai layanan. Firewall ini memberikan perlindungan tingkat jaringan dan tingkat aplikasi di berbagai langganan dan jaringan virtual.

+ **Firewall aplikasi web Azure Application Gateway dan Azure Firewall**

    Firewall aplikasi web (WAF) adalah fitur Azure Application Gateway yang menyediakan aplikasi web Anda dengan perlindungan masuk terpusat terhadap eksploitasi dan kerentanan umum.

    Azure Firewall menyediakan:
    
    - Perlindungan masuk untuk protokol non-HTTP/S (misalnya, RDP, SSH, dan FTP).
    - Perlindungan tingkat jaringan keluar untuk semua port dan protokol.
    - Perlindungan tingkat aplikasi untuk HTTP/S keluar. 
    
    Menggabungkannya memberikan lebih banyak lapisan perlindungan.
