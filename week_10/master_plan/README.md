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



