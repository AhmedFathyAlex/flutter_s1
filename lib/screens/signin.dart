import 'package:flutter/material.dart';
import 'package:flutter_s1/screens/home.dart';
import 'package:flutter_s1/todo/ui/screens/all_tasks.dart';
import 'package:flutter_s1/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatelessWidget {
  Signin({super.key});

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign in')),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/img.jpg', height: 150),
                SizedBox(height: 20),
                CustomTextField(
                  hint: 'Email',
                  controller: emailController,
                  onValidate: (email) {
                    if (email!.contains('@') && email.contains('.')) {
                      return null;
                    }
                    return 'Invalid Email';
                  },
                ),
                CustomTextField(
                  hint: 'Password',
                  controller: passwordController,
                  isPassword: true,
                  onValidate: (password) {
                    if (password!.length >= 8) {
                      return null;
                    }
                    return 'weak password';
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  child: Text('first time ? sign up'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var sp = await SharedPreferences.getInstance();
                    if (_formKey.currentState!.validate()) {
                      sp.setBool('isLoggedIn', true);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AllTasks();
                          },
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error'),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Text('Sign in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
