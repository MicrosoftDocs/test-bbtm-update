[Penguncian sumber daya](https://docs.microsoft.com/azure/azure-resource-manager/management/lock-resources?azure-portal=true) mencegah sumber daya terhapus atau berubah secara tidak sengaja.

Bahkan dengan kebijakan kontrol akses berbasis peran Azure (Azure RBAC), masih ada risiko bahwa orang-orang dengan tingkat akses yang tepat dapat menghapus sumber daya cloud penting. Pikirkan kunci sumber daya sebagai sistem peringatan yang mengingatkan Anda bahwa sumber daya tidak boleh dihapus atau diubah.

Misalnya, di Tailwind Traders, administrator TI melakukan pembersihan rutin sumber daya yang tidak digunakan di Azure. Admin secara tidak sengaja menghapus sumber daya yang tampaknya tidak digunakan. Tetapi sumber daya ini sangat penting untuk aplikasi yang digunakan untuk promosi musiman. Bagaimana kunci sumber daya dapat membantu mencegah insiden semacam ini terjadi di masa depan?

## <a name="how-do-i-manage-resource-locks"></a>Bagaimana cara mengelola kunci sumber daya?

Anda dapat mengelola kunci sumber daya dari portal Microsoft Azure, PowerShell, Azure CLI, atau dari templat Azure Resource Manager.

Untuk melihat, menambah, atau menghapus kunci di portal Microsoft Azure, buka bagian **Pengaturan** dari panel **Pengaturan** sumber daya apa pun di portal Microsoft Azure.

Berikut ini contoh yang memperlihatkan cara menambahkan kunci sumber daya dari portal Microsoft Azure. Anda akan menerapkan kunci sumber daya serupa di bagian berikutnya.

:::image type="content" source="../media/7-portal-add-lock.png" alt-text="Cuplikan layar dari portal Microsoft Azure memperlihatkan cara menambahkan kunci sumber daya.":::

## <a name="what-levels-of-locking-are-available"></a>Tingkat penguncian apa yang tersedia?

Anda dapat menerapkan kunci ke langganan, grup sumber daya, atau sumber daya individual. Anda dapat menyetel tingkat kunci ke **CanNotDelete** atau **ReadOnly**.

* **CanNotDelete** artinya orang yang berwenang masih dapat membaca serta memodifikasi sumber daya, tetapi mereka tidak dapat menghapus sumber daya tanpa terlebih dahulu menghapus kunci.
* **ReadOnly** artinya orang yang berwenang dapat membaca sumber daya, tetapi mereka tidak dapat menghapus atau mengubah sumber daya. Menerapkan kunci ini seperti membatasi semua pengguna yang berwenang untuk izin yang diberikan oleh peran **Pembaca** di Azure RBAC.

## <a name="how-do-i-delete-or-change-a-locked-resource"></a>Bagaimana cara menghapus atau mengubah sumber daya yang dikunci?

Meskipun penguncian membantu mencegah perubahan yang tidak disengaja, Anda masih dapat membuat perubahan dengan mengikuti proses dua langkah.

Untuk mengubah sumber daya yang terkunci, Anda harus terlebih dahulu menghapus kunci. Setelah Anda menghapus kunci, Anda bisa menerapkan tindakan apa pun yang anda miliki izin untuk melakukan. Langkah tambahan ini memungkinkan tindakan diambil, tetapi membantu melindungi administrator Anda dari melakukan sesuatu yang mungkin tidak ingin mereka lakukan.

Kunci sumber daya berlaku terlepas dari izin RBAC. Meskipun Anda adalah pemilik sumber daya, Anda masih harus menghapus kunci sebelum dapat melakukan aktivitas yang diblokir.

## <a name="combine-resource-locks-with-azure-blueprints"></a>Menggabungkan kunci sumber daya dengan Azure Blueprints

Bagaimana jika administrator awan secara tidak sengaja menghapus kunci sumber daya? Jika kunci sumber daya dihapus, sumber daya terkait dapat diubah atau dihapus.

Untuk membuat proses perlindungan lebih kuat, Anda dapat menggabungkan kunci sumber daya dengan Azure Blueprints. Azure Blueprints memungkinkan Anda menentukan sekumpulan sumber daya Azure standar yang diperlukan organisasi Anda. Misalnya, Anda dapat menentukan cetak biru yang menentukan bahwa kunci sumber daya tertentu harus ada. Azure Blueprints dapat secara otomatis mengganti kunci sumber daya jika kunci tersebut dihapus.

Anda akan mempelajari selengkapnya tentang Azure Blueprints nanti dalam modul ini.
