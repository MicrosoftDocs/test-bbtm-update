Dalam penelitian Anda untuk Tailwind Traders, Anda telah melihat dua cara berbeda untuk memvirtualisasi aplikasi Anda. Alternatif lain adalah dengan menyebarkan situs web front-end aplikasi Anda ke Azure App Service, yang memudahkan untuk menanggapi permintaan aplikasi.

:::row:::
  :::column span="3":::
App Service memungkinkan Anda untuk membangun dan menghosting aplikasi web, pekerjaan latar belakang, back-end seluler, dan RESTful API dalam bahasa pemrograman pilihan Anda tanpa mengelola infrastruktur. Ini menawarkan penskalaan otomatis dan ketersediaan tinggi. App Service mendukung Windows dan Linux dan memungkinkan penyebaran secara otomatis dari GitHub, Azure DevOps, atau Git repo apa pun guna mendukung model penyebaran berkelanjutan.
  :::column-end:::
  :::column:::
    :::image type="icon" source="../media/appservice.png" border="false":::
  :::column-end:::
:::row-end:::

Platform ini sebagai lingkungan platform as a service (PaaS) memungkinkan Anda untuk berfokus pada situs web dan logika API, sementara Azure menangani infrastruktur untuk menjalankan dan menskalakan aplikasi web Anda.

## <a name="azure-app-service-costs"></a>Biaya Azure App Service

Anda membayar sumber daya komputasi Azure yang digunakan oleh aplikasi Anda saat memproses permintaan berdasarkan paket App Service yang Anda pilih. Paket App Service menentukan seberapa banyak perangkat keras yang dikhususkan untuk host Anda. Misalnya, paket menentukan apakah perangkat keras ini khusus ataukah untuk dipakai bersama dan berapa banyak memori yang disediakan untuknya. Bahkan ada tingkatan _gratis_ yang dapat Anda gunakan untuk menghosting situs kecil dengan lalu lintas rendah.

## <a name="types-of-app-services"></a>Jenis layanan aplikasi

Dengan App Service, Anda dapat menghosting gaya layanan aplikasi yang paling umum, seperti:

- Aplikasi Web
- Aplikasi API
- WebJobs
- Mobile apps

App Service menangani sebagian besar keputusan infrastruktur yang Anda tangani dalam menghosting aplikasi yang dapat diakses oleh web:

* Penyebaran dan manajemen diintegrasikan ke dalam platform.
* Titik akhir dapat diamankan.
* Situs dapat diskalakan dengan cepat guna menangani beban lalu lintas yang tinggi.
* Penyeimbangan beban bawaan dan pengelola lalu lintas memberikan ketersediaan tinggi.

Semua gaya aplikasi ini dihosting dalam infrastruktur yang sama dan berbagi bersama manfaat ini. Fleksibilitas ini menjadikan App Service sebagai pilihan ideal untuk menghosting aplikasi berorientasi web.

### <a name="web-apps"></a>Aplikasi Web

App Service mencakup dukungan penuh untuk menghosting aplikasi web dengan menggunakan ASP.NET, ASP.NET Core, Java, Ruby, Node.js, PHP, atau Python. Anda dapat memilih Windows atau Linux sebagai sistem operasi host.

### <a name="api-apps"></a>Aplikasi API

Sama seperti menghosting situs web, Anda dapat membangun API web berbasis REST menggunakan pilihan bahasa dan kerangka kerja Anda. Anda mendapatkan dukungan Swagger penuh dan kemampuan untuk mengemas dan menerbitkan API Anda di Azure Marketplace. Aplikasi yang diproduksi dapat dikonsumsi dari klien berbasis HTTP atau HTTPS.

### <a name="webjobs"></a>WebJobs

Anda dapat menggunakan fitur WebJobs untuk menjalankan program (.exe, Java, PHP, Python, atau Node.js) atau skrip (.cmd, .bat, PowerShell, atau Bash) dalam konteks yang sama seperti aplikasi web, aplikasi API, atau aplikasi seluler. Program-program ini dapat dijadwalkan atau dijalankan oleh pemicu. WebJobs sering digunakan untuk menjalankan tugas latar belakang sebagai bagian dari logika aplikasi Anda.

### <a name="mobile-apps"></a>Mobile apps

Gunakan fitur Mobile App dari App Service guna membangun backend dengan cepat untuk aplikasi iOS dan Android. Hanya dengan beberapa klik di portal Azure, Anda dapat:

- Menyimpan data aplikasi seluler dalam database SQL berbasis cloud.
- Mengautentikasi pelanggan terhadap penyedia sosial umum, seperti MSA, Google, Twitter, dan Facebook.
- Mengirim pemberitahuan push.
- Menjalankan logika back-end kustom di C# atau Node.js.

Di sisi aplikasi seluler, ada dukungan SDK untuk aplikasi iOS dan Android native, Xamarin, dan aplikasi native React.
