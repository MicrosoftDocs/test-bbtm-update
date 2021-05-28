Meskipun Azure Firewall dan Azure DDoS Protection dapat membantu mengontrol lalu lintas apa yang dapat berasal dari sumber luar, Tailwind Traders juga ingin memahami cara melindungi jaringan internalnya di Azure. Melakukannya akan memberi perusahaan lapisan pertahanan ekstra terhadap serangan.

Di bagian ini, Anda akan memeriksa kelompok keamanan jaringan (NSG).

## <a name="what-are-network-security-groups"></a>Apa itu kelompok keamanan jaringan?

[Kelompok keamanan jaringan](https://docs.microsoft.com/azure/virtual-network/security-overview#network-security-groups?azure-portal=true) memungkinkan Anda memfilter lalu lintas jaringan ke dan dari sumber daya Azure dalam jaringan virtual Azure. Anda dapat membayangkan NSG seperti firewall internal. NSG dapat berisi beberapa aturan keamanan masuk dan keluar yang memungkinkan Anda memfilter lalu lintas ke dan dari sumber daya berdasarkan port, protokol, serta sumber dan alamat IP tujuan.

## <a name="how-do-i-specify-nsg-rules"></a>Bagaimana cara menentukan aturan NSG?

Kelompok keamanan jaringan dapat berisi aturan sebanyak yang Anda butuhkan, dalam batas langganan Azure. Setiap aturan menentukan properti ini:

| Properti | Deskripsi|
| --- | --- |
| Nama | Nama unik untuk NSG. |
| Prioritas | Angka antara 100 dan 4096. Aturan diproses dalam urutan prioritas, dengan angka yang lebih rendah diproses sebelum angka yang lebih tinggi. |
| Sumber atau Tujuan | Satu alamat IP atau rentang alamat IP, tag layanan, atau grup keamanan aplikasi. |
| Protokol | **TCP**, **UDP**, atau **Apa pun**.|
| Arah | Apakah aturan tersebut berlaku untuk lalu lintas masuk atau keluar. |
| Rentang Port | Satu port atau sekumpulan port. |
| Tindakan | **Izinkan** atau **Tolak**. |

Saat Anda membuat grup keamanan jaringan, Azure membuat serangkaian aturan default untuk memberikan tingkat keamanan garis besar. Anda tidak dapat menghapus aturan default, tetapi Anda dapat menggantinya dengan membuat aturan baru dengan prioritas yang lebih tinggi.
