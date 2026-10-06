/* ======================= IF-ELSE ========================== */
void printHariLibur() {
  var libur = true;

  if (libur == true) {
    print("Hari ini libur");
  } else {
    print("Hari ini tidak libur");
  }
}

// lebih dari satu kondisi
void multipleConditions() {
  var nilai = 30;

  if (nilai >= 90) {
    print("A");
  } else if (nilai < 90) {
    print("B");
  } else if (nilai < 80) {
    print("C");
  } else if (nilai < 60) {
    print("D");
  }
}

// menggunakan operator logika
void withLogicalOperators() {
  var nilai = -101;

  if (nilai >= 90 && nilai <= 100) {
    print("A");
  } else if (nilai >= 80 && nilai < 90) {
    print("B");
  } else if (nilai >= 60 && nilai < 80) {
    print("C");
  } else if (nilai >= 0 && nilai < 60) {
    print("D");
  } else {
    print("nilai $nilai tidak diakui");
  }
}

// conditional expression
void withConditionalExpression() {
  var nilaiMin = 70;
  var nilaiKu = 65;

  var ket = nilaiKu > nilaiMin ? "Lulus" : "Tidak Lulus";
  print(ket);
}

/* ======================= FOR ========================== */
/* Rumus dasar for
  for (var i = 0; i < limit; i++) {
    // kode yang akan diulang sejumlah limit kali.
  }
*/

void printNumbers() {
  for (int angka = 1; angka <= 5; angka++) {
    print(angka);
  }
}

void printText() {
  var bahasa = "dart";
  for (int angka = 1; angka <= 5; angka++) {
    print(bahasa);
  }
}

/* ======================= FOR-IN ========================== */
/* var myList = [1, 2, 3, 4, 5];
   for (var item in myList) {
      // kode yang dijalankan untuk setiap item dalam myList
   }

   var mySet = {1, 2, 3, 4, 5};
   for (var item in mySet) {
     // kode yang dijalankan untuk setiap item dalam mySet
   }

   var myMap = {'a': 1, 'b': 2, 'c': 3};
   for (var key in myMap.keys) {
     var value = myMap[key];
     // kode yang dijalankan untuk setiap item dalam mySet
   }
*/

/* ======================= FOREACH ========================== */
/* var myList = [1, 2, 3, 4, 5];
   myList.forEach((item) {
     // kode yang dijalankan untuk setiap item dalam myList
   });

   var mySet = {1, 2, 3, 4, 5};
   mySet.forEach((item) {
     // kode yang dijalankan untuk setiap item dalam mySet
   });

   var myMap = {'a': 1, 'b': 2, 'c': 3};
   myMap.forEach((key, value) {
     // kode yang dijalankan untuk setiap pasangan key-value dalam myMap
   });
*/

/* ======================= WHILE ========================== */
/* while (condition) {
    // kode yang akan diulang selama kondisi benar
  }
*/

void printNumbersUsingWhile() {
  var angka = 1;

  while (angka <= 5) {
    print(angka);
    angka++;
  }
}

/* ======================= DO-WHILE ========================== */
/* syntax:
    do {
      // kode yang dijalankan sekali jika kondisi tidak terpenuhi
    } while (condition);
*/

void count() {
  var count = 1;

  do {
    print("Nilai count: $count");
    count++;
  } while (count <= 5);
}

/* ======================= SWITCH-CASE ========================== */
/* switch (expression) {
    case value1:
      // kode yang dieksekusi jika expression sama dengan value1
      break;
    case value2:
      // kode yang dieksekusi jika expression sama dengan value2
      break;
    default:
      // kode yang dieksekusi jika expression tidak sama dengan nilai semua case
  }
*/

void printNilai() {
  var nilai = 'B';

  switch (nilai) {
    case 'A':
      print('Sangat Baik');
      break;
    case 'B':
      print('Baik');
      break;
    case 'C':
      print('Cukup');
      break;
    default:
      print('Nilai tidak valid');
  }
}
