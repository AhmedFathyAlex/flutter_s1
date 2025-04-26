import 'package:flutter/material.dart';
import 'package:flutter_s1/screens/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({super.key});

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
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
    );
  }
}
