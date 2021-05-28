Dalam latihan ini, Anda mengonfigurasi akses jaringan ke komputer virtual (VM) yang berjalan di Azure.

Anda akan mulai dengan membuat Linux VM dan menginstal Nginx, server web populer, pada VM tersebut. Agar server web Anda dapat diakses, Anda kemudian membuat aturan kelompok keamanan jaringan (NSG) yang memungkinkan akses masuk pada port 80 (HTTP).

Ada banyak cara untuk membuat dan mengelola VM, termasuk pengaturan jaringannya. Misalnya, Anda dapat menggunakan templat Azure Resource Manager (ARM), portal Microsoft Azure, Azure CLI, atau Azure PowerShell.

Di sini, Anda menggunakan Azure CLI. Azure CLI memungkinkan Anda menyambungkan ke Azure dan menjalankan perintah administratif pada sumber daya Azure. Seperti antarmuka baris perintah lainnya, Anda dapat menjalankan perintah langsung dari terminal atau Anda dapat menambahkan perintah ke skrip Bash atau skrip PowerShell. Azure CLI berjalan di Windows, macOS, atau Linux.

Di sini, Anda mengakses Azure CLI dari Azure Cloud Shell. Azure Cloud Shell adalah pengalaman shell berbasis browser untuk mengelola dan mengembangkan sumber daya Azure. Bayangkan Cloud Shell sebagai konsol interaktif yang berjalan di cloud.

Jika Anda baru menggunakan Azure CLI atau Cloud Shell, cukup ikuti.

## <a name="create-a-linux-virtual-machine-and-install-nginx"></a>Membuat komputer virtual Linux dan menginstal Nginx

Gunakan perintah Azure CLI berikut untuk membuat Linux VM dan menginstal Nginx. Setelah VM dibuat, Anda akan menggunakan Ekstensi Skrip Kustom untuk menginstal Nginx. Custom Script Extension adalah cara mudah untuk mengunduh dan menjalankan skrip di Azure VM Anda. Ini hanya salah satu dari banyak cara Anda dapat mengonfigurasi sistem setelah VM Anda berjalan.

1. Dari Cloud Shell, jalankan perintah `az vm create` berikut untuk membuat Linux VM:

    ```azurecli
    az vm create \
      --resource-group <rgn>[sandbox resource group name]</rgn> \
      --name my-vm \
      --image UbuntuLTS \
      --admin-username azureuser \
      --generate-ssh-keys
    ```

    VM Anda akan memakan waktu beberapa saat untuk muncul.

    Beri nama VM Anda dengan **my-vm**. Anda menggunakan nama ini untuk merujuk ke VM di langkah-langkah selanjutnya.

1. Jalankan perintah `az vm extension set` berikut untuk mengonfigurasi Nginx pada VM Anda:

    ```azurecli
    az vm extension set \
      --resource-group <rgn>[sandbox resource group name]</rgn> \
      --vm-name my-vm \
      --name customScript \
      --publisher Microsoft.Azure.Extensions \
      --version 2.1 \
      --settings '{"fileUris":["https://raw.githubusercontent.com/MicrosoftDocs/mslearn-welcome-to-azure/master/configure-nginx.sh"]}' \
      --protected-settings '{"commandToExecute": "./configure-nginx.sh"}'
    ```

    Perintah ini menggunakan Custom Script Extension untuk menjalankan skrip Bash pada VM Anda. Skrip ini disimpan di GitHub.

    Saat perintah berjalan, Anda dapat memilih untuk [memeriksa skrip Bash](https://raw.githubusercontent.com/MicrosoftDocs/mslearn-welcome-to-azure/master/configure-nginx.sh?azure-portal=true) dari bilah browser terpisah.

    Singkatnya, skrip:

    1. Menjalankan `apt-get update` untuk mengunduh informasi paket terbaru dari internet. Langkah ini membantu memastikan bahwa perintah berikutnya dapat menemukan versi terbaru dari paket Nginx.
    1. Menginstal Nginx.
    1. Mengatur halaman beranda, */var/www/html/index.html*, untuk mencetak pesan selamat datang yang menyertakan nama host VM Anda.

## <a name="access-your-web-server"></a>Mengakses server web Anda

Dalam prosedur ini, Anda mendapatkan alamat IP untuk VM Anda dan mencoba mengakses halaman beranda server web Anda.

1. Jalankan perintah `az vm list-ip-addresses` berikut untuk mendapatkan alamat IP VM Anda dan simpan hasilnya sebagai variabel Bash:

    ```azurecli
    IPADDRESS="$(az vm list-ip-addresses \
      --resource-group <rgn>[sandbox resource group name]</rgn> \
      --name my-vm \
      --query "[].virtualMachine.network.publicIpAddresses[*].ipAddress" \
      --output tsv)"
    ```

1. Jalankan perintah `curl` berikut untuk mengunduh halaman beranda:

    ```bash
    curl --connect-timeout 5 http://$IPADDRESS
    ```

    Argumen `--connect-timeout` menentukan hingga lima detik agar koneksi tersambung.

    Setelah lima detik, Anda akan melihat pesan kesalahan yang menyatakan bahwa koneksi kehabisan waktu:

    ```output
    curl: (28) Connection timed out after 5001 milliseconds
    ```

    Pesan ini berarti bahwa VM tidak dapat diakses dalam periode waktu habis.

1. Sebagai langkah opsional, coba akses server web dari browser:

    1. Jalankan hal berikut untuk mencetak alamat IP VM Anda ke konsol:

        ```bash
        echo $IPADDRESS
        ```

        Anda melihat alamat IP, misalnya, *23.102.42.235*.

    1. Salin alamat IP yang Anda lihat ke clipboard.
    1. Buka tab browser baru dan buka server web Anda.

        Setelah beberapa saat, Anda melihat bahwa koneksi tidak terjadi. Jika Anda menunggu browser kehabisan waktu, Anda akan melihat sesuatu seperti ini:

        :::image type="content" source="../media/7-browser-timeout.png" alt-text="Browser web memperlihatkan pesan kesalahan yang mengatakan koneksi kehabisan waktu.":::

        Buka tab browser ini untuk nanti.

## <a name="list-the-current-network-security-group-rules"></a>Mencantumkan aturan kelompok keamanan jaringan saat ini

Server web Anda tidak dapat diakses. Untuk mengetahui alasannya, mari periksa aturan NSG Anda saat ini.

1. Jalankan perintah `az network nsg list` berikut ini untuk mencantumkan kelompok keamanan jaringan yang terkait dengan VM Anda:

    ```azurecli
    az network nsg list \
      --resource-group <rgn>[sandbox resource group name]</rgn> \
      --query '[].name' \
      --output tsv
    ```

    Anda akan melihat berikut ini:

    ```output
    my-vmNSG
    ```

    Setiap VM di Azure dikaitkan dengan setidaknya satu grup keamanan jaringan. Dalam hal ini, Azure membuat NSG untuk Anda yang disebut *my-vmNSG*.

1. Jalankan perintah `az network nsg rule list` berikut untuk mencantumkan aturan yang terkait dengan NSG bernama *my-vmNSG*:

    ```azurecli
    az network nsg rule list \
      --resource-group <rgn>[sandbox resource group name]</rgn> \
      --nsg-name my-vmNSG
    ```

    Anda melihat blok teks besar dalam format JSON dalam output. Pada langkah berikutnya, Anda akan menjalankan perintah serupa yang membuat output ini lebih mudah dibaca.

1. Jalankan perintah `az network nsg rule list` untuk kedua kalinya.

    Kali ini, gunakan argumen `--query` untuk mengambil hanya nama, prioritas, port yang terpengaruh, dan akses (**Izinkan** atau **Tolak**) untuk setiap aturan.

    Argumen `--output` memformat output sebagai tabel sehingga mudah dibaca.

    ```azurecli
    az network nsg rule list \
      --resource-group <rgn>[sandbox resource group name]</rgn> \
      --nsg-name my-vmNSG \
      --query '[].{Name:name, Priority:priority, Port:destinationPortRange, Access:access}' \
      --output table
    ```

    Anda akan melihat berikut ini:

    ```output
    Name               Priority    Port    Access
    -----------------  ----------  ------  --------
    default-allow-ssh  1000        22      Allow
    ```

    Anda melihat aturan default, *default-allow-ssh*. Aturan ini memungkinkan sambungan masuk melalui port 22 (SSH). SSH (Secure Shell) adalah protokol yang digunakan di Linux untuk memungkinkan administrator mengakses sistem dari jarak jauh.

    Prioritas aturan ini adalah 1000. Aturan diproses dalam urutan prioritas, dengan angka yang lebih rendah diproses sebelum angka yang lebih tinggi.

Secara default, NSG Linux VM memungkinkan akses jaringan hanya pada port 22. Hal ini memungkinkan administrator untuk mengakses sistem. Anda juga perlu mengizinkan koneksi masuk pada port 80, yang memungkinkan akses melalui HTTP.

## <a name="create-the-network-security-rule"></a>Membuat aturan keamanan jaringan

Di sini, Anda membuat aturan keamanan jaringan yang memungkinkan akses masuk pada port 80 (HTTP).

1. Jalankan perintah `az network nsg rule create` berikut untuk membuat aturan yang disebut *allow-http* yang memungkinkan akses masuk pada port 80:

    ```azurecli
    az network nsg rule create \
      --resource-group <rgn>[sandbox resource group name]</rgn> \
      --nsg-name my-vmNSG \
      --name allow-http \
      --protocol tcp \
      --priority 100 \
      --destination-port-range 80 \
      --access Allow
    ```

    Untuk tujuan pembelajaran, Anda menetapkan prioritas ke 100 di sini. Dalam hal ini, prioritas tidak dipertimbangkan. Anda perlu mempertimbangkan prioritas jika Anda memiliki rentang port yang tumpang tindih.

1. Untuk memverifikasi konfigurasi, jalankan `az network nsg rule list` untuk melihat daftar aturan yang diperbarui:

    ```azurecli
    az network nsg rule list \
      --resource-group <rgn>[sandbox resource group name]</rgn> \
      --nsg-name my-vmNSG \
      --query '[].{Name:name, Priority:priority, Port:destinationPortRange, Access:access}' \
      --output table
    ```

    Anda melihat aturan *default-allow-ssh* dan aturan baru Anda, *allow-http*:

    ```output
    Name               Priority    Port    Access
    -----------------  ----------  ------  --------
    default-allow-ssh  1000        22      Allow
    allow-http         100         80      Allow
    ```

## <a name="access-your-web-server-again"></a>Mengakses server web Anda lagi

Sekarang setelah Anda mengonfigurasi akses jaringan ke port 80, mari mencoba mengakses server web untuk kedua kalinya.

1. Jalankan perintah `curl` yang sama yang Anda jalankan sebelumnya:

    ```bash
    curl --connect-timeout 5 http://$IPADDRESS
    ```

    Anda akan melihat berikut ini:

    ```html
    <html><body><h2>Welcome to Azure! My name is my-vm.</h2></body></html>
    ```

1. Sebagai langkah opsional, refresh tab browser Anda yang menunjuk ke server web Anda.

    Anda akan melihat berikut ini:

    :::image type="content" source="../media/7-browser-success.png" alt-text="Browser web yang menunjukkan halaman beranda dari server web. Halaman beranda menampilkan pesan selamat datang bersama dengan nama host server web.":::

[!include[](../../../includes/azure-sandbox-cleanup.md)]

Kerja bagus. Dalam praktiknya, Anda dapat membuat grup keamanan jaringan mandiri yang menyertakan aturan akses jaringan masuk dan keluar yang Anda butuhkan. Jika Anda memiliki beberapa VM yang memiliki tujuan yang sama, Anda dapat menetapkan NSG tersebut ke setiap VM pada saat Anda membuatnya. Teknik ini memungkinkan Anda mengontrol akses jaringan ke beberapa VM di bawah satu kumpulan aturan terpusat.
