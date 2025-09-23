void main() {
  final List list = [
    null,
    'Annisa Kurniawati',
    2341720070,
    2,
    3,
  ]; // Mengubah menjadi final dengan index 5
  list[0] = null; // Nilai default pada index 0
  assert(list.length == 5);
  assert(list[1] == 'Annisa Kurniawati');
  assert(list[2] == 2341720070);

  print("List length: ${list.length}");
  print("Nama: ${list[1]}");
  print("NIM: ${list[2]}");

  list[1] = 'Annisa Kurniawati'; // Ubah nilai index ke-1
  assert(list[1] == 'Annisa Kurniawati');
  print("Updated Nama: ${list[1]}");
}
