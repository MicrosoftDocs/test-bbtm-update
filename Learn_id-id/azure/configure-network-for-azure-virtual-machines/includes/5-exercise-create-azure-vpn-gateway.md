Anda ingin memastikan bahwa Anda dapat menyambungkan klien atau situs dalam lingkungan Anda ke Azure menggunakan terowongan terenkripsi di internet publik. Di unit ini, Anda akan membuat gateway VPN titik-ke-situs, lalu menyambungkan ke gateway tersebut dari komputer klien Anda. Anda akan menggunakan koneksi autentikasi sertifikat Azure asli untuk keamanan.

Anda akan melakukan proses berikut:

1. Membuat gateway VPN RouteBased.

1. Mengunggah kunci publik untuk sertifikat akar untuk tujuan autentikasi.

1. Membuat sertifikat klien dari sertifikat akar, lalu memasang sertifikat klien pada setiap komputer klien yang akan terhubung ke jaringan virtual untuk tujuan autentikasi.

1. Membuat file konfigurasi klien VPN yang berisi informasi yang diperlukan bagi klien untuk tersambung ke jaringan virtual.

## <a name="setup"></a>Siapkan

Untuk menyelesaikan modul ini, gunakan Azure PowerShell dari komputer Windows 10 lokal Anda.

1. Buka sesi PowerShell baru di komputer Windows 10 lokal tempat Anda memasang modul Azure PowerShell.

1. Masuk ke Azure dengan menjalankan cmdlet `Connect-AzAccount` PowerShell.

1. Siapkan variabel yang akan Anda gunakan untuk membuat jaringan virtual. Salin dan tempelkan variabel berikut ke PowerShell.

```PowerShell
$VNetName  = "VNetData"
$FESubName = "FrontEnd"
$BESubName = "Backend"
$GWSubName = "GatewaySubnet"
$VNetPrefix1 = "192.168.0.0/16"
$VNetPrefix2 = "10.254.0.0/16"
$FESubPrefix = "192.168.1.0/24"
$BESubPrefix = "10.254.1.0/24"
$GWSubPrefix = "192.168.200.0/26"
$VPNClientAddressPool = "172.16.201.0/24"
$ResourceGroup = "VpnGatewayDemo"
$Location = "East US"
$GWName = "VNetDataGW"
$GWIPName = "VNetDataGWPIP"
$GWIPconfName = "gwipconf"
```

## <a name="configure-a-virtual-network"></a>Konfigurasi jaringan virtual

1. Jalankan perintah berikut untuk membuat grup sumber daya.

    ```PowerShell
    New-AzResourceGroup -Name $ResourceGroup -Location $Location
    ```

1. Jalankan perintah berikut untuk membuat konfigurasi subnet untuk jaringan virtual. Ini memiliki nama **FrontEnd, BackEnd**, dan **GatewaySubnet**. Semua subnet ini ada dalam prefiks jaringan virtual.

    ```PowerShell
    $fesub = New-AzVirtualNetworkSubnetConfig -Name $FESubName -AddressPrefix $FESubPrefix
    $besub = New-AzVirtualNetworkSubnetConfig -Name $BESubName -AddressPrefix $BESubPrefix
    $gwsub = New-AzVirtualNetworkSubnetConfig -Name $GWSubName -AddressPrefix $GWSubPrefix
    ```

1. Selanjutnya, jalankan perintah berikut untuk membuat jaringan virtual menggunakan nilai subnet dan server DNS statis.

    ```PowerShell
    New-AzVirtualNetwork -Name $VNetName -ResourceGroupName $ResourceGroup -Location $Location -AddressPrefix $VNetPrefix1,$VNetPrefix2 -Subnet $fesub, $besub, $gwsub -DnsServer 10.2.1.3
    ```

1. Sekarang, tentukan variabel untuk jaringan ini yang baru saja Anda buat.

    ```PowerShell
    $vnet = Get-AzVirtualNetwork -Name $VNetName -ResourceGroupName $ResourceGroup
    $subnet = Get-AzVirtualNetworkSubnetConfig -Name $GWSubName -VirtualNetwork $vnet
    ```

1. Jalankan perintah berikut untuk meminta alamat IP publik yang ditetapkan secara dinamis.

    ```PowerShell
    $pip = New-AzPublicIpAddress -Name $GWIPName -ResourceGroupName $ResourceGroup -Location $Location -AllocationMethod Dynamic
    $ipconf = New-AzVirtualNetworkGatewayIpConfig -Name $GWIPconfName -Subnet $subnet -PublicIpAddress $pip
    ```

## <a name="create-the-vpn-gateway"></a>Membuat gateway VPN

Saat membuat gateway VPN ini:

- GatewayType harus Vpn
- VpnType harus RouteBased

Perhatikan bahwa bagian latihan ini dapat membutuhkan waktu hingga 45 menit.

1. Untuk membuat gateway VPN, jalankan perintah berikut ini, dan tekan <kbd>Enter</kbd>.

    ```PowerShell
    New-AzVirtualNetworkGateway -Name $GWName -ResourceGroupName $ResourceGroup `
    -Location $Location -IpConfigurations $ipconf -GatewayType Vpn `
    -VpnType RouteBased -EnableBgp $false -GatewaySku VpnGw1 -VpnClientProtocol "IKEv2"
    ```

1. Tunggu hingga output perintah muncul.

## <a name="add-the-vpn-client-address-pool"></a>Menambahkan kumpulan alamat klien VPN

1. Jalankan perintah berikut untuk menambahkan kumpulan alamat klien VPN.

    ```PowerShell
    $Gateway = Get-AzVirtualNetworkGateway -ResourceGroupName $ResourceGroup -Name $GWName
    Set-AzVirtualNetworkGateway -VirtualNetworkGateway $Gateway -VpnClientAddressPool $VPNClientAddressPool
    ```

1. Tunggu hingga output perintah muncul.

## <a name="generate-a-client-certificate"></a>Menghasilkan sertifikat klien

Dengan infrastruktur jaringan yang dibuat di Azure, kita perlu membuat sertifikat klien yang ditandatangani sendiri di komputer lokal kita. Ini dapat dilakukan dengan cara yang sama pada sebagian besar sistem operasi, tetapi kita akan membahas cara menghasilkan sertifikat klien Anda pada Windows 10 menggunakan PowerShell dengan modul Azure PowerShell dan utilitas Windows **Certificate Manager**.

1. Langkah pertama adalah membuat sertifikat akar yang ditandatangani sendiri. Jalankan perintah berikut.

    ```PowerShell
    $cert = New-SelfSignedCertificate -Type Custom -KeySpec Signature `
    -Subject "CN=P2SRootCert" -KeyExportPolicy Exportable `
    -HashAlgorithm sha256 -KeyLength 2048 `
    -CertStoreLocation "Cert:\CurrentUser\My" -KeyUsageProperty Sign -KeyUsage CertSign
    ```

1. Selanjutnya, buat sertifikat klien yang ditandatangani oleh sertifikat akar baru Anda.

    ```PowerShell
    New-SelfSignedCertificate -Type Custom -DnsName P2SChildCert -KeySpec Signature `
    -Subject "CN=P2SChildCert" -KeyExportPolicy Exportable `
    -HashAlgorithm sha256 -KeyLength 2048 `
    -CertStoreLocation "Cert:\CurrentUser\My" `
    -Signer $cert -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.2")
    ```

## <a name="export-certificate-public-key"></a>Mengekspor kunci publik sertifikat

Dengan sertifikat kita yang dihasilkan, kita perlu mengekspor kunci publik sertifikat akar kita.

1. Jalankan `certmgr` dari PowerShell untuk membuka Manajer Sertifikat.

1. Buka **Sertifikat** > **Pribadi**.

1. Klik kanan sertifikat **P2SRootCert** dalam daftar, dan pilih **Semua tugas** > **Ekspor**.

1. Di Wizard Ekspor Sertifikat, pilih **Berikutnya**.

1. Pastikan bahwa **Tidak, jangan ekspor kunci privat** dipilih, lalu pilih **Berikutnya**.

1. Pada halaman **Ekspor Format File**, pastikan bahwa **Base-64 encoded X.509 (.CER)** dipilih, lalu pilih **Berikutnya**.

1. Di halaman **File untuk Diekspor**, di **Nama file**, navigasi ke lokasi yang akan Anda ingat, dan simpan file sebagai **P2SRootCert.cer**, lalu pilih **Berikutnya**.

1. Pada halaman **Menyelesaikan Wizard Ekspor Sertifikat**, pilih **Selesai**.

1. Pada kotak pesan **Wizard Ekspor Sertifikat**, pilih **OK**.

## <a name="upload-the-root-certificate-public-key-information"></a>Mengunggah informasi kunci publik sertifikat akar

1. Di jendela PowerShell, jalankan perintah berikut ini untuk mendeklarasikan variabel untuk nama sertifikat.

    ```PowerShell
    $P2SRootCertName = "P2SRootCert.cer"
    ```

1. Ganti placeholder `<cert-path>` dengan lokasi ekspor sertifikat akar Anda, dan jalankan perintah berikut.

    ```PowerShell
    $filePathForCert = "<cert-path>\P2SRootCert.cer"
    $cert = new-object System.Security.Cryptography.X509Certificates.X509Certificate2($filePathForCert)
    $CertBase64 = [system.convert]::ToBase64String($cert.RawData)
    $p2srootcert = New-AzVpnClientRootCertificate -Name $P2SRootCertName -PublicCertData $CertBase64
    ```

1. Dengan set nama grup, unggah sertifikat ke Azure dengan perintah berikut.

    ```PowerShell
    Add-AzVpnClientRootCertificate -VpnClientRootCertificateName $P2SRootCertName -VirtualNetworkGatewayname $GWName -ResourceGroupName $ResourceGroup -PublicCertData $CertBase64
    ```

    Azure sekarang akan mengenali sertifikat ini sebagai sertifikat akar tepercaya untuk jaringan virtual kita.

## <a name="configure-the-native-vpn-client"></a>Mengonfigurasi klien VPN asli

1. Jalankan perintah berikut untuk membuat file konfigurasi klien VPN dalam format .ZIP.

    ```PowerShell
    $profile = New-AzVpnClientConfiguration -ResourceGroupName $ResourceGroup -Name $GWName -AuthenticationMethod "EapTls"
    $profile.VPNProfileSASUrl
    ```

1. Salin URL yang dikembalikan dalam output dari perintah ini, dan tempelkan ke browser Anda. Browser Anda akan mulai mengunduh file .ZIP. Ekstrak konten arsip dan letakkan di lokasi yang sesuai.

   Beberapa browser awalnya akan mencoba memblokir pengunduhan file ZIP ini sebagai pengunduhan berbahaya. Anda perlu menimpa ini di browser Anda untuk dapat mengekstrak konten arsip.

1. Di folder yang diekstrak, navigasikan ke folder **WindowsAmd64** (untuk komputer Windows 64-bit) atau folder **WindowsX86** (untuk komputer 32-bit).

    Jika Anda ingin mengonfigurasi VPN pada komputer non-Windows, Anda dapat menggunakan sertifikat dan file pengaturan dari folder **Generik**.

1. Klik ganda file **VpnClientSetup{architecture}.exe**, dengan `{architecture}` mencerminkan arsitektur Anda.

1. Di layar **PC Anda yang dilindungi Windows**, pilih **Info selengkapnya**, lalu pilih **Tetap jalankan**.

1. Dalam kotak dialog **Kontrol Akun Pengguna**, pilih **Ya**.

1. Dalam kotak dialog **VNetData**, pilih **Ya**.

## <a name="connect-to-azure"></a>Menyambungkan ke Azure

1. Tekan tombol <kbd>Windows</kbd>, masuk ke **Pengaturan**, dan tekan kbd>Enter</kbd>.

1. Di jendela **Pengaturan**, pilih **Jaringan dan Internet**.

1. Di panel sebelah kiri, pilih **VPN**.

1. Di panel kanan, pilih **VNetData**, lalu pilih **Sambungkan**.

1. Di jendela VNetData, pilih **Sambungkan**.

1. Di jendela VNetData berikutnya, pilih **Lanjutkan**.

1. Dalam kotak pesan **Kontrol Akun Pengguna**, pilih **Ya**.

 Jika langkah-langkah ini tidak berhasil, Anda mungkin perlu memulai ulang komputer Anda.

## <a name="verify-your-connection"></a>Memverifikasi koneksi Anda

1. Di prompt perintah Windows baru, jalankan `IPCONFIG /ALL`.

1. Salin alamat IP di PPP adapter VNetData, atau tulis.

1. Konfirmasi bahwa alamat IP berada di **kisaran VPNClientAddressPool 172.16.201.0/24**.

1. Anda berhasil membuat koneksi ke gateway Azure VPN.

Anda baru saja menyiapkan gateway VPN yang memungkinkan Anda membuat koneksi klien terenkripsi ke jaringan virtual di Azure. Pendekatan ini sangat cocok untuk komputer klien dan koneksi situs-ke-situs yang lebih kecil.
