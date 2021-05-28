Sebagai bagian dari penelitian Anda untuk Tailwind Traders, Anda perlu mempelajari struktur pengorganisasian untuk sumber daya Azure, yang memiliki empat tingkat: grup manajemen, langganan, grup sumber daya, dan sumber daya.

Gambar berikut ini menunjukkan hierarki organisasi teratas untuk tingkat ini.

[![Cuplikan layar hierarki untuk objek di Azure.](../media/hierarchy.png)](../media/hierarchy-expanded.png#lightbox)

Setelah melihat hierarki organisasi teratas, mari kita jelaskan masing-masing tingkatan tersebut dari bawah ke atas:

- **Sumber Daya**: Sumber daya adalah contoh layanan yang Anda buat, seperti mesin virtual, penyimpanan, atau database SQL.
- **Grup sumber daya**: Sumber daya digabungkan ke dalam grup sumber daya, yang bertindak sebagai kontainer logis di mana sumber daya Azure seperti aplikasi web, database, dan akun penyimpanan yang diterapkan dan dikelola.
- **Langganan**: Langganan menyatukan akun pengguna dan sumber daya yang telah dibuat oleh akun pengguna tersebut. Untuk setiap langganan, ada batasan atau kuota pada jumlah sumber daya yang dapat Anda buat dan gunakan. Organisasi dapat menggunakan langganan untuk mengelola biaya dan sumber daya yang dibuat oleh pengguna, tim, atau proyek.
- **Grup manajemen**: Grup ini membantu Anda mengelola akses, kebijakan, dan kepatuhan untuk beberapa langganan. Semua langganan dalam grup manajemen secara otomatis mewarisi kondisi yang diterapkan ke grup manajemen.

Anda akan memeriksa masing-masing dari empat tingkat organisasi ini dalam beberapa unit berikutnya.
