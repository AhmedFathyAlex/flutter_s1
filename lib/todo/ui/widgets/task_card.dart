import 'package:flutter/material.dart';
import 'package:flutter_s1/todo/data/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key , required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: Text(taskModel.title ?? 'No title'),
      subtitle: Text(taskModel.desc ?? 'No description'),
      trailing: CircleAvatar(child: Text(taskModel.date ?? 'No date'), radius: 30,),

    );
  }
}