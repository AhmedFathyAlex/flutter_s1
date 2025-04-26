import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_s1/screens/signin.dart';
import 'package:flutter_s1/todo/data/task_model.dart';
import 'package:flutter_s1/todo/ui/widgets/task_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({super.key});

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  List<TaskModel> tasks = [];
  final TextEditingController titleC = TextEditingController();
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
        child: ListView.builder(
          itemBuilder: (context,index){
          return TaskCard(taskModel: tasks[index]);
        }, 
        itemCount: tasks.length , ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          showModalBottomSheet(context: context, builder: (context){
            return Container(width: double.infinity,
            height: 200,
            color: Colors.amber,child: Column(
              children: [
                TextField(controller: titleC,),
                ElevatedButton(onPressed: (){
                  String title = titleC.text;
                  titleC.clear();
                  setState(() {
                     tasks.add(TaskModel(title: title));
                  });
                  Navigator.pop(context);
                }, child: Text('save'))
              ],
            ),);
          });
        });
      } , child: Icon(Icons.add),),
    );
  }
}
