void main() {
  String namaLengkap = "Annisa Kurniawati"; // Ganti dengan nama lengkap Anda
  String nim = "241720070"; // Ganti dengan NIM Anda

  List<int> bilanganPrima = [];

  for (int i = 0; i <= 201; i++) {
    bool isPrima = true;

    for (int j = 2; j < i; j++) {
      if (i % j == 0) {
        isPrima = false;
        break;
      }
    }

    if (isPrima) {
      bilanganPrima.add(i);
      print("Bilangan prima: $i");
      print("Ditemukan oleh: $namaLengkap, NIM: $nim");
    }
  }

  print("\nSemua bilangan prima dari 0 sampai 201:");
  print(bilanganPrima);
}