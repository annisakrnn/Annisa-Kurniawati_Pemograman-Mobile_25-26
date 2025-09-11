void main() {
  // variabel non-nullable
  String nama = "Annisa"; //langsung diinisialisasi
  print("Nama: $nama");

  // variabel nullable: boleh null tandanya yang dipakai ?
  String? alamat;
  print("Alamat: $alamat");

  // menggunakan operator ??
  String alamatDefault = alamat ?? "Tidak ada alamat";
  print("Alamat default: $alamatDefault");

  // mengubah nilai variabel alamat = nullable
  alamat =
      "Jakarta"; // variabel alamat sebelumnya dideklarasikan sebagai String? alamt; yang artinya alamat bertibe nullable yang bisa diubah
  print("Alamat baru: $alamat");

  // variabel late
  late String
  deskripsi; //variabel ini tidak langsung diinisialisasi pada saat deklarasi, tapi harus diisi sebelum digunakan.
  void inisialisasiDeskripsi() {
    //fungsi untuk menginisialisasi deskripsi
    deskripsi = "Aplikasi mobile untuk tugas codelab02_dart";
  }

  // memanggil fungsi inisialisasiDeskripsi untuk mengisi nilai deskripsi
  inisialisasiDeskripsi();
  print("Deskripsi: $deskripsi");
}
