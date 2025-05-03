import 'package:flutter/material.dart';
import 'package:flutter_s1/screens/signin.dart';
import 'package:flutter_s1/todo/data/db_service.dart';
import 'package:flutter_s1/todo/data/task_model.dart';
import 'package:flutter_s1/todo/ui/widgets/task_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArchivedTasks extends StatefulWidget {
  const ArchivedTasks({super.key});

  @override
  State<ArchivedTasks> createState() => _ArchivedTasksState();
}

class _ArchivedTasksState extends State<ArchivedTasks> {
  List<TaskModel> tasks = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

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
          return TaskCard(taskModel: tasks[index], 
          );
        }, 
        itemCount: tasks.length , ),
      ),
    );
  }

  _fetchData()async{
   tasks = await DbService.fetchArchivedTasks();
   setState(() {
     
   });
  }
}
