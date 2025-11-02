import 'package:flutter/material.dart';

import '../models/data_layer.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late final ScrollController scrollController;

  Plan get currentPlan {
    final plans = PlanProvider.of(context).value;
    return plans.firstWhere((p) => p.name == widget.plan.name);
  }

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
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(currentPlan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: PlanProvider.of(context),
        builder: (context, plans, child) {
          // mencari plan aktif
          Plan currentPlan = plans.firstWhere(
            (p) => p.name == widget.plan.name,
          );

          return Column(
            children: [
              Expanded(child: _buildList(currentPlan, plansNotifier)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(plansNotifier),
    );
  }

  Widget _buildAddTaskButton(ValueNotifier<List<Plan>> planNotifier) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        final currentPlan = this.currentPlan;
        int planIndex = planNotifier.value.indexWhere(
          (p) => p.name == currentPlan.name,
        );

        // menambahkan task baru
        List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
          ..add(const Task());

        // mengupdate list plan
        planNotifier.value = List<Plan>.from(planNotifier.value)
          ..[planIndex] = Plan(name: currentPlan.name, tasks: updatedTasks);
      },
    );
  }

  Widget _buildList(Plan plan, ValueNotifier<List<Plan>> planNotifier) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index, planNotifier),
    );
  }

  Widget _buildTaskTile(
    Task task,
    int index,
    ValueNotifier<List<Plan>> planNotifier,
  ) {
    return ListTile(
      leading: Checkbox(
        value: task.completed,
        onChanged: (selected) {
          int planIndex = planNotifier.value.indexWhere(
            (p) => p.name == widget.plan.name,
          );

          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(
                  description: task.description,
                  completed: selected ?? false,
                ),
            );
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          int planIndex = planNotifier.value.indexWhere(
            (p) => p.name == currentPlan.name,
          );

          planNotifier.value.indexWhere((p) => p.name == currentPlan.name);
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(description: text, completed: task.completed),
            );
        },
      ),
    );
  }
}
