//langkah 3
(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
void main() {
  //langkah 1
  // var record = ('first', a: 2, b: true, 'last');
  // print(record);

//langkah 3
var record = (1, 2);
print('Original record: $record');
var swapped = tukar(record); // Menggunakan fungsi tukar untuk menukar elemen
  print('Swapped record: $swapped'); // Mencetak tuple yang sudah ditukar

//langkah 4
(String, int) mahasiswa;
mahasiswa = ('Annisa Kurniawati', 2341720070);
print(mahasiswa);

//langkah 5
var mahasiswa2 = ('first', a: 2, b: true, 'last');

print(mahasiswa2.$1); // Prints 'first'
print(mahasiswa2.a); // Prints 2
print(mahasiswa2.b); // Prints true
print(mahasiswa2.$2); // Prints 'last'
}
