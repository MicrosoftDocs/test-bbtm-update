Azure menawarkan tiga cara utama untuk menyiapkan jaringan virtual:

- Jaringan virtual Azure
- VPN gateway Azure
- Azure ExpressRoute

Jaringan virtual Azure dapat menghubungkan sumber daya seperti komputer virtual dan set skala komputer virtual dalam wilayah yang sama, memungkinkan mereka untuk berkomunikasi. Jaringan virtual Azure juga dapat menyambungkan ke titik akhir layanan Azure tertentu, seperti Azure Storage, database, dan aplikasi web.

Gateway VPN Azure dapat mengaktifkan komunikasi dengan klien atau jaringan lokal melalui internet publik, atau menyambungkan jaringan virtual di wilayah Azure yang berbeda. Saat Anda membutuhkan rute khusus yang sangat aman, Anda dapat menggunakan Azure ExpressRoute. Ini menciptakan koneksi pribadi bandwidth tinggi ke pusat data Azure yang mencapai tingkat keandalan dan keamanan tertinggi.

## <a name="cleanup"></a>Pembersihan

Latihan interaktif dalam modul ini menciptakan dua kelompok sumber daya, `VpnGatewayDemo` dan `vm-networks`. Hapus grup sumber daya ini.

1. Jalankan perintah berikut untuk menghapus grup sumber daya vm-networks dan sumber daya yang ada di dalamnya.

   ```PowerShell
   Remove-AzResourceGroup -Name vm-networks
   ```

1. Jalankan perintah berikut untuk menghapus grup sumber daya VpnGatewayDemo dan sumber daya yang ada di dalamnya.

   ```PowerShell
   Remove-AzResourceGroup -Name VpnGatewayDemo
   ```

Grup sumber daya dan sumber daya yang ada di dalamnya mungkin membutuhkan waktu beberapa menit untuk dihapus.

