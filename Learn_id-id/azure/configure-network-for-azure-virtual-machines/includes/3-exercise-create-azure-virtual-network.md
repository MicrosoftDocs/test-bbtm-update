Dalam latihan ini, Anda akan membuat jaringan virtual di Microsoft Azure. Anda kemudian akan membuat dua komputer virtual, dan menggunakan jaringan virtual untuk menghubungkan komputer virtual dan ke internet.

> [!IMPORTANT]
> Latihan dalam modul ini memerlukan langganan Azure penuh. Latihan bersifat opsional, dan tidak diwajibkan untuk menyelesaikan modul ini. Jika berpartisipasi dalam latihan interaktif dalam modul ini, biaya akan ditagihkan ke langganan Azure yang Anda gunakan untuk menyelesaikannya. Biaya yang dibebankan dapat diminimalkan dengan membersihkan sumber daya yang Anda buat sesegera mungkin. Arahan pembersihan ada di unit akhir.

## <a name="sign-in-to-your-subscription"></a>Masuk ke langganan Azure Anda

Masuk ke Azure baik dengan menggunakan cmdlet PowerShell `Connect-AzAccount` di komputer lokal Anda atau dengan menggunakan [shell.azure.com/powershell](https://shell.azure.com/powershell).

## <a name="create-a-resource-group"></a>Membuat grup sumber daya

Pertama, buat grup sumber daya untuk menampung semua sumber daya yang akan Anda buat dalam modul ini. Beri nama `vm-networks` dan ganti `EastUS` dalam perintah berikut ini dengan nama wilayah tempat Anda ingin membuat grup.

```PowerShell
$Location="WestUS" 
New-AzResourceGroup -Name vm-networks -Location $Location
```

## <a name="create-a-subnet-and-virtual-network"></a>Membuat subnet dan jaringan virtual

Untuk membuat subnet dan jaringan virtual, jalankan perintah berikut ini.

```PowerShell
 $Subnet=New-AzVirtualNetworkSubnetConfig -Name default -AddressPrefix 10.0.0.0/24
 New-AzVirtualNetwork -Name myVnet -ResourceGroupName vm-networks -Location $Location -AddressPrefix 10.0.0.0/16 -Subnet $Subnet
```

## <a name="create-two-virtual-machines"></a>Buat dua komputer virtual

Semua komputer virtual Azure tersambung ke jaringan virtual. Jika Anda membuat komputer virtual menggunakan Azure PowerShell dan tidak menentukan nama jaringan virtual yang sudah ada, Azure PowerShell akan membuat jaringan virtual baru secara otomatis.

Di sini, kita membuat dua komputer virtual dan menentukan jaringan virtual.

1. Untuk membuat komputer virtual pertama, jalankan perintah berikut untuk membuat Windows VM dengan alamat IP publik yang dapat diakses melalui port 3389 (Desktop Jarak Jauh). Ini membuat VM Pusat Data Windows 2016 bernama `dataProcStage1` yang menggunakan jaringan virtual myVnet.

   ```PowerShell
   New-AzVm `
    -ResourceGroupName "vm-networks" `
    -Name "dataProcStage1" `
    -VirtualNetworkName "myVnet" `
    -SubnetName "default" `
    -image "Win2016Datacenter" `
    -Size "Standard_DS2_v2"
    ```

    Port 3389 dibuka secara otomatis secara default saat Anda membuat Windows VM di Azure. 

1. Memasukkan nama pengguna dan kata sandi untuk VM. Tulis nama pengguna dan kata sandi. Anda memerlukannya nanti untuk masuk ke server.

1. Jalankan perintah berikut untuk mendapatkan alamat IP publik untuk VM Anda sehingga Anda dapat menggunakannya nanti. Salin **IpAddress**.

   ```PowerShell
   Get-AzPublicIpAddress -Name dataProcStage1
    ```

1. Buat VM kedua bernama `dataProcStage2`.

   ```PowerShell
   New-AzVm `
    -ResourceGroupName "vm-networks" `
    -Name "dataProcStage2" `
    -VirtualNetworkName "myVnet" `
    -SubnetName "default" `
    -image "Win2016Datacenter" `
    -Size "Standard_DS2_v2"
    ```

1. Memasukkan nama pengguna dan kata sandi untuk VM. Salin nama pengguna dan kata sandi Anda. Anda memerlukannya nanti untuk masuk ke server.

1. Memisahkan alamat IP publik yang dibuat secara default untuk VM.

   ```PowerShell
   $nic = Get-AzNetworkInterface -Name dataProcStage2 -ResourceGroup vm-networks
   $nic.IpConfigurations.publicipaddress.id = $null
   Set-AzNetworkInterface -NetworkInterface $nic 
   ```

## <a name="connect-to-dataprocstage1-using-remote-desktop"></a>Menyambungkan ke dataProcStage1 menggunakan Desktop Jarak Jauh

1. Buka Desktop Jarak Jauh, dan `dataProcStage1` sambungkan dengan alamat IP publik yang Anda catat dari langkah sebelumnya. Jika Anda menggunakan PowerShell secara lokal, jalankan perintah berikut ini, dan `publicIpAddress` ganti dengan alamat IP publik VM.

   ```PowerShell
   mstsc /v:publicIpAddress
   ```

1. Masuk ke komputer jarak jauh dengan nama pengguna dan kata sandi yang Anda buat.

1. Di sesi jarak jauh, buka prompt perintah Windows, dan jalankan perintah berikut ini.

    ```cmd
    ping dataProcStage2 -4
    ```

1. Dalam hasilnya, Anda akan melihat bahwa semua waktu permintaan untuk `dataProcStage2` habis. Ini karena konfigurasi Firewall Windows default `dataProcStage2` mencegahnya untuk menanggapi ping.

## <a name="connect-to-dataprocstage2-using-remote-desktop"></a>Menyambungkan ke dataProcStage2 menggunakan Desktop Jarak Jauh

Mengonfigurasi Tembok api Windows `dataProcStage2` pada saat menggunakan sesi desktop jarak jauh baru. Anda tidak dapat mengakses `dataProcStage2` dari desktop karena tidak memiliki alamat IP `dataProcStage2` publik. Anda akan menggunakan desktop jarak jauh `dataProcStage1` untuk menyambungkan ke `dataProcStage2`.

1. Di sesi jarak jauh `dataProcStage1`, buka Desktop Jarak Jauh.

1. Sambungkan ke `dataProcStage2` berdasarkan nama. Berdasarkan konfigurasi jaringan default, `dataProcStage1`dapat mengatasi alamat untuk `dataProcStage2` menggunakan nama komputer.

1. Masuk ke `dataProcStage2` dengan nama pengguna dan kata sandi yang Anda buat.

1. Pada `dataProcStage2`, pilih Menu Mulai, masukkan **Firewall**, dan tekan <kbd>Enter</kbd>. Konsol **Windows Firewall dengan Keamanan Tingkat Lanjut** muncul.

1. Di panel sebelah kiri, pilih **Aturan Masuk**.

1. Di panel kanan, gulir ke bawah, dan klik kanan **Berbagi File dan Printer (Permintaan Echo - ICMPv4-In)**, lalu pilih **Aktifkan Aturan**.

1. Beralih kembali ke sesi jarak jauh `dataProcStage1`, dan jalankan perintah berikut ini di prompt perintah.

    ```cmd
    ping dataProcStage2 -4
    ```

1. `dataProcStage2` merespons dengan empat balasan, menunjukkan konektivitas antara dua VM.

Anda berhasil membuat jaringan virtual, membuat dua VM yang melekat pada jaringan virtual itu, terhubung ke salah satu VM dan menunjukkan konektivitas jaringan ke VM lainnya dalam jaringan virtual yang sama. Anda dapat menggunakan Azure Virtual Network untuk menyambungkan sumber daya dalam jaringan Azure. Namun, sumber daya tersebut harus berada dalam grup sumber daya dan langganan yang sama. Selanjutnya, kita akan melihat gateway VPN yang memungkinkan Anda untuk menyambungkan jaringan virtual di berbagai grup sumber daya, langganan, dan bahkan wilayah geografis.
