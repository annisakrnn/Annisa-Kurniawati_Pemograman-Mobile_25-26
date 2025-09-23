void main(){
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
print(halogens);

var names1 = <String>{};
Set<String> names2 = {}; // This works, too.

  // Menambahkan elemen nama dan NIM Anda menggunakan fungsi .add() dan .addAll()
  names1.add('Annisa'); // Menggunakan .add() tambah nama
  names2.addAll({'Annisa', '2341720070'}); // Menggunakan .addAll()

print(names1);
print(names2);
}