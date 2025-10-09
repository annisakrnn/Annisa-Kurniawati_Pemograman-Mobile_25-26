Nama : Annisa Kurniawati

NIM : 2341720070

Kelas : TI 3H

# Praktikum 7 Menerapkan Plugin di Project Flutter
**Langkah 1: Buat Project Baru**

Buatlah sebuah project flutter baru dengan nama flutter_plugin_pubdev. Lalu jadikan repository di GitHub Anda dengan nama flutter_plugin_pubdev.

<img width="469" height="344" alt="image" src="https://github.com/user-attachments/assets/df2bc219-8558-4a48-8c58-e026164b27bd" />

**Langkah 2: Menambahkan Plugin**

Tambahkan plugin auto_size_text menggunakan perintah berikut di terminal

<img width="436" height="122" alt="image" src="https://github.com/user-attachments/assets/ebd00c57-2c7b-4227-bd8f-44ac61e59e70" />

**Langkah 3: Buat file red_text_widget.dart**

Buat file baru bernama red_text_widget.dart di dalam folder lib lalu isi kode seperti berikut.

<img width="236" height="125" alt="image" src="https://github.com/user-attachments/assets/dbb3aec2-bf32-457a-9bfd-7b49ab83d5fe" />

**Langkah 4: Tambah Widget AutoSizeText**

Masih di file red_text_widget.dart, untuk menggunakan plugin auto_size_text, ubahlah kode return Container() menjadi seperti berikut.

<img width="227" height="190" alt="image" src="https://github.com/user-attachments/assets/86952229-d4f9-4a9b-abba-ed50f6a9f955" />



**Langkah 5: Buat Variabel text dan parameter di constructor**

Tambahkan variabel text dan parameter di constructor seperti berikut.

<img width="293" height="182" alt="image" src="https://github.com/user-attachments/assets/97aa7294-dfe3-4609-a66a-4a7d1d985f8f" />

**Langkah 6: Tambahkan widget di main.dart**

Buka file main.dart lalu tambahkan di dalam children: pada class _MyHomePageState

<img width="319" height="357" alt="image" src="https://github.com/user-attachments/assets/ef8a03ac-1e4e-4a39-a4cc-b861dbf3f2c9" />

<img width="290" height="200" alt="image" src="https://github.com/user-attachments/assets/454f3fec-a792-447c-be61-da7313ee1985" />

**Hasil Praktikum 7**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/0a64106f-fd1e-43ef-be1e-fd35a99451bd" />

# Tugas Praktikum

1. Selesaikan Praktikum tersebut, lalu dokumentasikan dan push ke repository Anda berupa screenshot hasil pekerjaan beserta penjelasannya di file README.md!
2. Jelaskan maksud dari langkah 2 pada praktikum tersebut!

  Jawab:

  Fungsi kode tersebut ialah untuk menambahkan plugin auto_size_text yang berguna untuk         menyesuaikan ukuran teks secara otomatis agar sesuai dengan ruang yang tersedia.
  
3. Jelaskan maksud dari langkah 5 pada praktikum tersebut!

  Jawab:

  untuk menambahkan variabel text ke dalam widget RedTextWidget sebagai parameter agar widget   tersebut bisa menerima teks dari luar. Dengan mendefinisikan final String text; dan           menambahkannya sebagai parameter di constructor const RedTextWidget({Key? key, required       this.text}) : super(key: key);, memungkinkan untuk mengirim nilai text saat membuat           instance RedTextWidget, sehingga teks bisa disesuaikan sesuai kebutuhan.
  
4. Pada langkah 6 terdapat dua widget yang ditambahkan, jelaskan fungsi dan perbedaannya!

   Jawab:

   dua widget Container ditambahkan dengan tujuan menampilkan teks yang berbeda.
   - Widget pertama adalah RedTextWidget yang menggunakan plugin auto_size_text untuk membuat      teks otomatis menyesuaikan ukuran lebar kontainer kuning berukuran 50 piksel, sehingga        teks tidak terpotong dan tetap terbaca dengan jelas. Di dalamnya, AutoSizeText
     memungkinkan teks menyesuaikan ukuran font secara otomatis berdasarkan ruang yang
     tersedia.
   - Widget kedua adalah Text biasa, ditampilkan dalam kontainer hijau berukuran 100 piksel.
     Karena menggunakan Text standar tanpa auto_size_text, teks ini tidak menyesuaikan ukuran
     font secara otomatis dan dapat terpotong jika ruangnya terbatas.
5. Jelaskan maksud dari tiap parameter yang ada di dalam plugin auto_size_text berdasarkan tautan pada dokumentasi ini !

   <img width="386" height="175" alt="image" src="https://github.com/user-attachments/assets/89785d06-f8dc-4927-8494-ff5a4fb9c4ea" />

   Jawab:

   maksudnya ialah untuk membuat tulisan menjadi penuh dengan ukuran container yang tersedia.



