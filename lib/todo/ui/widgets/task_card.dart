import 'package:flutter/material.dart';
import 'package:flutter_s1/todo/data/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key , required this.taskModel, this.onDelete,this.onComplete,this.onArchived});

  final TaskModel taskModel;
  final void Function()? onDelete;
  final void Function()? onComplete;
  final void Function()? onArchived;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: Text(taskModel.title ?? 'No title'),
      subtitle: Text(taskModel.desc ?? 'No description'),
      leading: CircleAvatar(radius: 30,child: Text(taskModel.date ?? 'No date'),),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
         GestureDetector(
          onTap: onComplete,
           child: CircleAvatar(backgroundColor: Colors.green.shade100.withOpacity(0.5),
           child: Icon(Icons.check,color: Colors.green,),),
         ) , 
           GestureDetector(
            onTap: onArchived,
             child: CircleAvatar(backgroundColor: Colors.grey.shade100.withOpacity(0.5),
             child: Icon(Icons.archive,color: Colors.grey,),),
           ),
           GestureDetector(
            onTap: onDelete,
             child: CircleAvatar(backgroundColor: Colors.redAccent.shade100.withOpacity(0.5),
             child: Icon(Icons.delete,color: Colors.red,),
             ),
           )
           
        ],
      ),

    );
  }
}