Nama : Annisa Kurniawati

NIM : 2341720070

# Praktikum 1: Membangun Layout di Flutter

**Langkah 1: Buat Project Baru**

**Langkah 2: Buka file lib/main.dart**

<img width="1920" height="1080" alt="Screenshot 2025-10-02 144935" src="https://github.com/user-attachments/assets/c998cc93-7e33-49bf-94e1-ca070b1e438f" />

**Langkah 3: Identifikasi layout diagram**

Langkah pertama adalah memecah tata letak menjadi elemen dasarnya:

Identifikasi baris dan kolom.
Apakah tata letaknya menyertakan kisi-kisi (grid)?
Apakah ada elemen yang tumpang tindih?
Apakah UI memerlukan tab?
Perhatikan area yang memerlukan alignment, padding, atau borders.

**Langkah 4: Implementasi title row**

**Soal 1**: Letakkan widget Column di dalam widget Expanded agar menyesuaikan ruang yang tersisa di dalam widget Row. Tambahkan properti crossAxisAlignment ke CrossAxisAlignment.start sehingga posisi kolom berada di awal baris.

<img width="265" height="40" alt="image" src="https://github.com/user-attachments/assets/7ad24e78-6c4c-483c-b3dd-7d5178817d13" />

**Soal 2**: Letakkan baris pertama teks di dalam Container sehingga memungkinkan Anda untuk menambahkan padding = 8. Teks ‘Batu, Malang, Indonesia' di dalam Column, set warna menjadi abu-abu.

<img width="261" height="99" alt="image" src="https://github.com/user-attachments/assets/57a787f5-332a-4d02-9b93-544c751483a5" />


**Soal 3**: Dua item terakhir di baris judul adalah ikon bintang, set dengan warna merah, dan teks "41". Seluruh baris ada di dalam Container dan beri padding di sepanjang setiap tepinya sebesar 32 piksel. Kemudian ganti isi body text ‘Hello World' dengan variabel titleSection 

<img width="228" height="90" alt="image" src="https://github.com/user-attachments/assets/6cc989ea-d3a4-4d3c-bc71-705c3a791b3a" />

Hasil: 

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/bf4dc16c-1a2e-49a0-864f-b14e4910875b" />


# Praktikum 2: Implementasi button row

**Langkah 1: Buat method Column _buildButtonColumn**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/d67084d4-d650-4d19-ae06-ce650394b11a" />

**Langkah 2: Buat widget buttonSection**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/905e66f5-4373-4ec4-a5ab-67fd20dc3f18" />

**Langkah 3: Tambah button section ke body**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/a1be0024-6702-412a-a28d-d593ed10b726" />

# Praktikum 3: Implementasi text section

**Langkah 1: Buat widget textSection**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/087d281f-121d-4573-9cef-cdb5c88dcc0a" />

**Langkah 2: Tambahkan variabel text section ke body**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/a7241d52-131a-4187-821d-601ce9a867cd" />

# Praktikum 4: Implementasi image section

**Langkah 1: Siapkan aset gambar**

<img width="109" height="48" alt="image" src="https://github.com/user-attachments/assets/3fcbbe17-23f3-4c19-a715-283794d70679" />

**Langkah 2: Tambahkan gambar ke body**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/f6ece692-e0fc-4982-84f2-9bb51c3a0bf0" />

**Langkah 3: Terakhir, ubah menjadi ListView**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/36fd3560-e992-44c7-b3bf-09eff6e8ed36" />








