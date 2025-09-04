void main() {
  // variabel non-nullable
  String nama = "Annisa";
  print("Nama: $nama"); 

  // variabel nullable: boleh null
  String? alamat;
  print("Alamat: $alamat"); 

  // menggunakan operator ??
  String alamatDefault = alamat ?? "Tidak ada alamat";
  print("Alamat default: $alamatDefault"); 

  // mengubah nilai variabel nullable
  alamat = "Jakarta";
  print("Alamat baru: $alamat"); 

  // variabel late
  late String deskripsi;
  void inisialisasiDeskripsi() {
    deskripsi = "Aplikasi mobile untuk tugas codelab02_dart";
  }
  inisialisasiDeskripsi();
  print("Deskripsi: $deskripsi");
}