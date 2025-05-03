import 'package:flutter/material.dart';
import 'package:flutter_s1/todo/data/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key , required this.taskModel, this.onDelete});
  final TaskModel taskModel;
  final void Function()? onDelete;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: Text(taskModel.title ?? 'No title'),
      subtitle: Text(taskModel.desc ?? 'No description'),
      leading: CircleAvatar(child: Text(taskModel.date ?? 'No date'), radius: 30,),
      trailing: IconButton(onPressed: onDelete,
       icon: CircleAvatar(child: Icon(Icons.delete,color: Colors.red,),
       backgroundColor: Colors.redAccent.shade100.withOpacity(0.5),),),

    );
  }
}