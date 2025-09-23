void main() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
  };

  // Menambahkan nama dan NIM ke 'gifts'
  gifts['name'] = 'Annisa Kurniawati';
  gifts['NIM'] = '2341720070';

  var nobleGases = {2: 'helium', 10: 'neon', 18: 2};

  // Menambahkan nama dan NIM ke 'nobleGases'
  nobleGases[100] = 'Annisa Kurniawati';
  nobleGases[101] = '2341720070';

  // Cetak hasil
  print('Gifts: $gifts');
  print('Noble Gases: $nobleGases');

  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  // Menambahkan nama dan NIM ke 'mhs1'
  mhs1['name'] = 'Annisa Kurniawati';
  mhs1['NIM'] = '2341720070';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  // Menambahkan nama dan NIM ke 'mhs2'
  mhs2[100] = 'Annisa Kurniawati';
  mhs2[101] = '2341720070';

  // Cetak hasil
  print('Mhs1: $mhs1');
  print('Mhs2: $mhs2');
}
