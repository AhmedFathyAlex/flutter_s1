import 'package:flutter/material.dart';
import 'package:flutter_s1/widgets/custom_text_field.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign up')),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/img.jpg', height: 150),
                SizedBox(height: 20),
                CustomTextField(
                  hint: 'Name',
                  controller: nameController,
                  onValidate: (name) {
                    if (name!.length >= 3) {
                      return null;
                    }
                    return 'Name is too short';
                  },
                ),
                CustomTextField(hint: 'Email', controller: emailController,
                 onValidate: (email){
                    if(email!.contains('@') && email.contains('.')){
                      return null;
                    }
                    return 'Invalid Email';
                  },),
                CustomTextField(
                  hint: 'Password',
                  controller: passwordController,
                  isPassword: true,
                  onValidate: (password){
                      if(password!.length >= 8){
                        return null;
                      }
                      return 'weak password';
                    },
                ),
                CustomTextField(
                  hint: 'Confirm Password',
                  controller: confirmpasswordController,
                  isPassword: true,
                  onValidate: (confirmPassword){
                    if(confirmPassword == passwordController.text){
                      return null;
                    }
                    return 'Password must match';
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                  child: Text('already have account ? sign in'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Signup Success'),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.green,
                        ),
                      );
                      // Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(' Error'),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Text('Sign up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
