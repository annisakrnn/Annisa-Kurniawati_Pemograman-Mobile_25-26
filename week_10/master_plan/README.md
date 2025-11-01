Nama: Annisa Kurniawati

NIM: 2341720070

Kelas: TI/3H

**Praktikum 1**

Langkah 1: Buat Project Baru

<img width="85" height="46" alt="image" src="https://github.com/user-attachments/assets/0076a16a-dc0f-471c-85d5-c19017a230f8" />

Langkah 2: Membuat model task.dart

<img width="248" height="63" alt="image" src="https://github.com/user-attachments/assets/0a561295-0433-4ea9-b004-07f0462dc5a0" />

Langkah 3: Buat file plan.dart

<img width="221" height="83" alt="image" src="https://github.com/user-attachments/assets/15a0504c-1b4b-44b8-8c23-1409aace8043" />

Langkah 4: Buat file data_layer.dart

<img width="125" height="30" alt="image" src="https://github.com/user-attachments/assets/b265e735-fcac-415d-a92e-21741cea66ae" />

Langkah 5: Pindah ke file main.dart

<img width="226" height="199" alt="image" src="https://github.com/user-attachments/assets/7e012d6e-72c5-4bcb-8b32-434a1f3d1ef3" />

Langkah 6: buat plan_screen.dart

```
import 'package:flutter/material.dart';

import '../models/data_layer.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan plan = const Plan();
  late ScrollController scrollController;
  final Map<int, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ganti 'Namaku' dengan nama panggilan anda
      appBar: AppBar(title: const Text('Master Plan Annisa')),
      body: _buildList(),
      floatingActionButton:
          _buildAddTaskButton(), // gunakan nama fungsi yang benar
    );
  }

  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        setState(() {
          plan = Plan(
            name: plan.name,
            tasks: List<Task>.from(plan.tasks)..add(const Task()),
          );
        });
      },
    );
  }

  Widget _buildList() {
    return ListView.builder(
      controller: scrollController,
      keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index], index),
    );
  }

  Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      leading: Checkbox(
        value: task.completed,
        onChanged: (selected) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: task.description,
                  completed: selected ?? false,
                ),
            );
          });
        },
      ),
      title: TextField(
        controller: _controllers.putIfAbsent(
          index,
          () => TextEditingController(text: task.description),
        ),
        onChanged: (text) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(description: text, completed: task.completed),
            );
          });
        },
        decoration: const InputDecoration(hintText: 'Enter task description'),
      ),
    );
  }
}
```
Hasil:

<img width="365" height="500" alt="image" src="https://github.com/user-attachments/assets/038f5bf2-2ce6-431b-94de-17c7222d6050" />

**Tugas Praktikum 1: Dasar State dengan Model-View**

1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki.

2. Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?

   Langkah ini digunakan untuk menggabungkan beberapa file model ke dalam satu titik
   akses (satu “gateway”), agar file lain cukup melakukan satu kali import saja.

4. Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?

   Variabel plan dibuat agar aplikasi punya tempat menyimpan dan memperbarui data
   rencana (state), sedangkan const Plan() dipakai supaya data awal efisien, stabil,
   dan mendukung konsep immutable state di Flutter.

4. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!

<img width="365" height="500" alt="image" src="https://github.com/user-attachments/assets/862df0d2-6a47-4544-b523-1b81681f9ce4" />

  Pada langkah ini dibuat widget _buildTaskTile yang berfungsi untuk menampilkan
  setiap elemen Task dalam bentuk ListTile yang berisi Checkbox dan TextField.
  Checkbox digunakan untuk menandai apakah tugas telah selesai, sedangkan
  TextField digunakan untuk mengedit deskripsi tugas. Setiap perubahan nilai pada
  Checkbox atau TextField akan memperbarui data plan.tasks melalui fungsi
  setState(), sehingga tampilan aplikasi berubah secara dinamis sesuai data
  terbaru.

5. Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?

   Pada langkah 11 digunakan method initState() yang berfungsi untuk melakukan
   inisialisasi awal sebelum widget ditampilkan, seperti membuat objek
   ScrollController dan menambahkan listener untuk menutup keyboard ketika pengguna
   melakukan scroll.

   Sedangkan pada langkah 13 digunakan method dispose() yang berfungsi untuk
   membersihkan resource yang sudah tidak digunakan, yaitu dengan     memanggil
   scrollController.dispose(). Hal ini dilakukan agar tidak terjadi kebocoran memori
   (memory leak) dan menjaga performa aplikasi tetap optimal.

7. Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke dosen yang telah disepakati !

**Praktikum 2**

Langkah 1: Buat file plan_provider.dart

```import 'package:flutter/material.dart';
import '../models/data_layer.dart';

class PlanProvider extends InheritedNotifier<ValueNotifier<Plan>> {
  const PlanProvider({
    super.key,
    required Widget child,
    required ValueNotifier<Plan> notifier,
  }) : super(child: child, notifier: notifier);

  static ValueNotifier<Plan> of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PlanProvider>()!
        .notifier!;
  }
}
```

Langkah 2: Edit main.dart

```import 'package:flutter/material.dart';
// import 'package:mater_plan/provider/plan_provider.dart';
import '../provider/plan_provider.dart';
import '../models/data_layer.dart';
import '../views/plan_screen.dart';

void main() {
  runApp(MasterPlanApp());
}

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: PlanProvider(notifier: ValueNotifier<Plan>(const Plan()),
      child: const PlanScreen(),
      ),
    );
  }
}
```

Langkah 3: Tambah method pada model plan.dart

```
import './task.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  const Plan({this.name = '', this.tasks = const []});

  int get completedCount => tasks
  .where((task) => task.completed)
  .length;
  String get completenessMessage =>
       '$completedCount out of ${tasks.length} tasks';
}
```

Langkah 4: Pindah ke PlanScreen

Langkah 5: Edit method _buildAddTaskButton

```
 Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = planNotifier.value;
        planNotifier.value = Plan(
          name: currentPlan.name,
          tasks: List<Task>.from(currentPlan.tasks)..add(const Task()),
        );
      },
    );
  }
```

Langkah 6: Edit method _buildTaskTile

```
 Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
    return ListTile(
      leading: Checkbox(
        value: task.completed,
        onChanged: (selected) {
          Plan currentPlan = planNotifier.value;
          planNotifier.value = Plan(
            name: currentPlan.name,
            tasks: List<Task>.from(currentPlan.tasks)
            ..[index] = Task(
              description: task.description,
              completed: selected ?? false,
            ),
          );
        }),
```

Langkah 7: Edit _buildList

```
Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      // keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
      //     ? ScrollViewKeyboardDismissBehavior.onDrag
      //     : ScrollViewKeyboardDismissBehavior.manual,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index], index, context),
    );
  }
```

Langkah 8: Tetap di class PlanScreen

Langkah 9: Tambah widget SafeArea

```
@override
  Widget build(BuildContext context) {
    return Scaffold(
      //ganti 'Namaku' dengan nama panggilan anda
      appBar: AppBar(title: const Text('Master Plan Annisa')),
      body: ValueListenableBuilder<Plan>(
        valueListenable: PlanProvider.of(context),
        builder: (context, plan, child) {
          return Column(
          children: [
            Expanded(child: _buildList(plan)),
            SafeArea(child: Text(plan.completenessMessage))
          ],
      );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
      );
    }
```

**Tugas Praktikum 2: InheritedWidget**

1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki sesuai dengan tujuan aplikasi tersebut dibuat.

2. Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan InheritedNotifier?

    Yang termasuk adalah code bagian InheritedNotifier, yang memungkinkan data (Plan) diwariskan ke seluruh widget anak melalui konteks. alasanya karena widget ini terhubung dengan ValueNotifier<Plan>, sehingga dapat mendengarkan perubahan nilai Plan dan otomatis memperbarui UI tanpa memanggil setState() secara manual.
   
4. Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?

    Getter completedCount dan completenessMessage dibuat agar objek Plan dapat secara otomatis menghitung dan melaporkan kemajuan (progress) tugas-tugasnya tanpa perlu penyimpanan tambahan atau perhitungan manual, sehingga data tetap konsisten dan mudah digunakan di tampilan aplikasi.
   
6. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!

<img src="https://github.com/user-attachments/assets/7e25e30b-a2ce-444b-9816-326aa556c4f6" width="260">


Yang telah saya buat adalah tampilan tugas flutter dengan menambahkan kombinasi InheritedNotifier dan ValueNotifier untuk mengatur state dan memperbarui tampilan secara reaktif setiap kali data berubah.

7. Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke dosen yang telah disepakati !

**Praktikum 3**

Langkah 1: Edit PlanProvider

Langkah 2: Edit main.dart

Langkah 3: Edit plan_screen.dart

Langkah 4: Error

Langkah 5: Tambah getter Plan

Langkah 6: Method initState()

Langkah 7: Widget build

Langkah 8: Edit _buildTaskTile

Langkah 9: Buat screen baru

Langkah 10: Pindah ke class _PlanCreatorScreenState

Langkah 11: Pindah ke method build

Langkah 12: Buat widget _buildListCreator

Langkah 13: Buat void addPlan()

Langkah 14: Buat widget _buildMasterPlans()

**Tugas Praktikum 3: State di Multiple Screens**

1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki sesuai dengan tujuan aplikasi tersebut dibuat.

2. Berdasarkan Praktikum 3 yang telah Anda lakukan, jelaskan maksud dari gambar diagram berikut ini!

   <img width="268" height="142" alt="image" src="https://github.com/user-attachments/assets/ffc47e49-eb9d-4fad-adf8-31411219e610" />

3. Lakukan capture hasil dari Langkah 14 berupa GIF, kemudian jelaskan apa yang telah Anda buat!

4. Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke dosen yang telah disepakati !






