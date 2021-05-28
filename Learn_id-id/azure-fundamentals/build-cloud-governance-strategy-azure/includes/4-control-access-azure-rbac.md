Ketika Anda memiliki beberapa tim IT serta teknik, bagaimana Anda dapat mengontrol akses apa yang mereka miliki ke sumber daya di lingkungan cloud Anda? Ini adalah praktik keamanan yang baik untuk memberi pengguna hanya hak yang mereka butuhkan untuk melakukan pekerjaan mereka, serta hanya untuk sumber daya yang relevan. 

Alih-alih menentukan persyaratan akses mendetail untuk setiap individu, lalu memperbarui persyaratan akses saat sumber daya baru dibuat, Azure memungkinkan Anda untuk mengontrol akses melalui [kontrol akses berbasis peran Azure](https://docs.microsoft.com/azure/role-based-access-control/overview?azure-portal=true) (Azure RBAC).

Azure menyediakan peran bawaan yang menjelaskan aturan akses umum untuk sumber daya cloud. Anda juga dapat menentukan peran Anda sendiri. Setiap peran memiliki sekumpulan izin akses terkait yang terkait dengan peran tersebut. Saat Anda menetapkan individu atau grup ke satu peran atau lebih, mereka menerima semua izin akses terkait.

## <a name="how-is-role-based-access-control-applied-to-resources"></a>Bagaimana kontrol akses berbasis peran diterapkan ke sumber daya?

Kontrol akses berbasis peran diterapkan ke _cakupan_, yang merupakan sumber daya atau kumpulan sumber daya tempat akses ini diterapkan.

Berikut adalah diagram yang memperlihatkan hubungan antara peran serta ruang lingkup.

:::image type="content" source="../media/4-role-scope.png" alt-text="Diagram memperlihatkan cakupan di sepanjang sumbu Y serta peran di seluruh sumbu X. Peran dan cakupan mengombinasikan setiap peta ke jenis pengguna atau akun tertentu, seperti pengamat atau administrator." border="false":::

Cakupan meliputi:

* Grup manajemen (kumpulan beberapa langganan).
* Satu langganan.
* Grup sumber daya.
* Satu sumber daya.

*Pengamat*, *Pengguna yang mengelola sumber daya*, *Admin*, dan *Proses otomatis* menggambarkan jenis pengguna atau akun yang biasanya akan ditetapkan untuk setiap berbagai peran.

Saat Anda memberikan akses di lingkup induk, izin tersebut diwariskan oleh semua cakupan anak. Contohnya:

* Saat Anda menetapkan peran [Pemilik](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles?azure-portal=true#owner) kepada pengguna di lingkup grup manajemen, pengguna tersebut dapat mengelola semuanya di semua langganan dalam grup manajemen.
* Saat Anda menetapkan peran [Pembaca](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles?azure-portal=true#reader) ke grup pada cakupan langganan, anggota grup itu dapat melihat setiap grup sumber daya serta sumber daya dalam langganan.
* Saat Anda menetapkan peran [Kontributor](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles?azure-portal=true#contributor) ke aplikasi pada cakupan grup sumber daya, aplikasi tersebut dapat mengelola semua jenis sumber daya dalam grup sumber daya tersebut, tetapi tidak untuk grup sumber daya lain dalam langganan tersebut.

## <a name="when-should-i-use-azure-rbac"></a>Kapan saya harus menggunakan Azure RBAC?

Gunakan Azure RBAC saat Anda perlu:

* Izinkan satu pengguna untuk mengelola VM dalam langganan dan pengguna lain untuk mengelola jaringan virtual.
* Izinkan grup administrator database untuk mengelola database SQL dalam langganan.
* Izinkan pengguna untuk mengelola semua sumber daya dalam grup sumber daya, seperti komputer virtual, situs web, dan subnet.
* Izinkan aplikasi mengakses semua sumber daya dalam grup sumber daya.

Ini hanya beberapa contoh. Anda akan menemukan daftar lengkap peran bawaan di akhir modul ini.

## <a name="how-is-azure-rbac-enforced"></a>Bagaimana Azure RBAC diberlakukan?

Azure RBAC diberlakukan pada tindakan apa pun yang dimulai terhadap sumber daya Azure yang melewati Azure Resource Manager. Resource Manager adalah layanan manajemen yang menyediakan cara untuk mengatur serta mengamankan sumber daya cloud Anda.

Anda biasanya mengakses Resource Manager dari portal Microsoft Azure, Azure Cloud Shell, Azure PowerShell, serta Azure CLI. Azure RBAC tidak memberlakukan izin akses di tingkat aplikasi atau data. Keamanan aplikasi harus ditangani oleh aplikasi Anda.

RBAC menggunakan *model yang diperbolehkan*. Saat Anda diberi peran, RBAC *memungkinkan* Anda melakukan tindakan tertentu, seperti membaca, menulis, atau menghapus. Jika satu penetapan peran memberi Anda izin membaca ke grup sumber daya dan penetapan peran yang berbeda memberi Anda izin menulis ke grup sumber daya yang sama, Anda memiliki izin baca dan tulis pada grup sumber daya tersebut.

## <a name="who-does-azure-rbac-apply-to"></a>Untuk siapa Azure RBAC mendaftar?

Anda dapat menerapkan Azure RBAC ke orang individual atau ke grup. Anda juga dapat menerapkan Azure RBAC ke jenis identitas khusus lainnya, seperti kepala layanan dan identitas terkelola. Jenis identitas ini digunakan oleh aplikasi serta layanan untuk mengotomatiskan akses ke sumber daya Azure.

Tailwind Traders memiliki tim berikut dengan minat pada beberapa bagian dari lingkungan IT mereka secara keseluruhan:

* Administrator TI

    Tim ini memiliki kepemilikan tertinggi atas aset teknologi, baik di tempat maupun di cloud. Tim membutuhkan kontrol penuh atas semua sumber daya.
* Pencadangan dan Pemulihan Bencana

    Tim ini bertanggung jawab untuk mengelola kesehatan cadangan reguler dan memanggil data atau pemulihan sistem apa pun.
* Biaya dan Penagihan

    Orang-orang dalam tim ini melacak serta melaporkan pengeluaran terkait teknologi. Mereka juga mengelola anggaran internal organisasi.
* Operasi Keamanan

    Tim ini memantau serta menanggapi setiap insiden keamanan terkait teknologi. Tim memerlukan akses berkelanjutan ke file log serta peringatan keamanan.

## <a name="how-do-i-manage-azure-rbac-permissions"></a>Bagaimana cara mengelola izin RBAC Azure?

Anda mengelola izin akses di panel **Kontrol akses (IAM)** di portal Microsoft Azure. Panel ini memperlihatkan siapa yang memiliki akses ke lingkup apa serta peran apa yang berlaku. Anda juga bisa memberikan atau menghapus akses dari panel ini.

Tangkapan layar berikut menunjukkan contoh panel **Kontrol akses (IAM)** untuk grup sumber daya. Dalam contoh ini, Alain Charon telah diberi peran **Operator Cadangan** untuk grup sumber daya ini.

:::image type="content" source="../media/4-role-based-access-control-blade.png" alt-text="Cuplikan layar yang memperlihatkan panel Penetapan Peran Kontrol Akses. Di panel Microsoft Azure Access Control Service, pengaturan dan izin untuk pengguna akan diperlihatkan.":::
