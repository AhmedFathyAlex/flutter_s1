import 'package:flutter/material.dart';
import 'package:flutter_s1/screens/signin.dart';
import 'package:flutter_s1/todo/data/db_service.dart';
import 'package:flutter_s1/todo/data/task_model.dart';
import 'package:flutter_s1/todo/ui/tasks_provider.dart';
import 'package:flutter_s1/todo/ui/widgets/task_card.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArchivedTasks extends StatelessWidget {
  const ArchivedTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archived'),
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
            
            return ListView.builder(
              itemBuilder: (context, index) {
                if(value.tasks[index].status != TaskStatus.archived){
                return SizedBox.shrink();
              }

                return TaskCard(taskModel: value.tasks[index]);
              },
              itemCount: value.tasks.length,
            );
          },
        ),
      ),
    );
  }
}
