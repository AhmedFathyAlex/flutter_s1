import 'package:flutter/material.dart';
import 'package:flutter_s1/screens/signin.dart';
import 'package:flutter_s1/todo/data/db_service.dart';
import 'package:flutter_s1/todo/data/task_model.dart';
import 'package:flutter_s1/todo/ui/tasks_provider.dart';
import 'package:flutter_s1/todo/ui/widgets/task_card.dart';
import 'package:flutter_s1/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllTasks extends StatelessWidget {
   AllTasks({super.key});

  final TextEditingController titleC = TextEditingController();
  final TextEditingController dateC = TextEditingController();
  final TextEditingController descC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        actions: [
          IconButton(
            onPressed: () async {
              var sp = await SharedPreferences.getInstance();
              sp.setBool('isLoggedIn', false);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Signin();
                  },
                ),
              );
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<TasksProvider>(
          builder: (context, value, child) {
            return  ListView.builder(
            itemBuilder: (context,index){
              if(value.tasks[index].status != TaskStatus.todo){
                return SizedBox.shrink();
              }

            return TaskCard(taskModel: value.tasks[index], 
            onDelete: () {
               context.read<TasksProvider>().deleteTask(value.tasks[index]);
            },
            onComplete: () {
             context.read<TasksProvider>().markAsDone(value.tasks[index]);
            },
            onArchived: () {
             context.read<TasksProvider>().markAsArchive(value.tasks[index]);
            },
            );
          }, 
          itemCount: value.tasks.length);
          },
         
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
          showModalBottomSheet(context: context, builder: (context){
            return Container(width: double.infinity,
            color: Colors.amber,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(hint: 'title',controller: titleC,),
                CustomTextField(hint: 'description',controller: descC,),
                CustomTextField(hint: 'date',controller: dateC,),

                ElevatedButton(onPressed: (){
                  String? title = titleC.text.isEmpty ? null : titleC.text;
                  String? desc = descC.text.isEmpty ? null : descC.text ;
                  String? date = dateC.text.isEmpty ? null : dateC.text;
                  TaskModel model = TaskModel(title: title, desc: desc , date: date);

                  titleC.clear();
                  descC.clear();
                  dateC.clear();

                  context.read<TasksProvider>().addTask(model);

                  Navigator.pop(context);
                }, child: Text('save'))
              ],
            ),);
          });
      } , child: Icon(Icons.add),),
    );
  }
}
