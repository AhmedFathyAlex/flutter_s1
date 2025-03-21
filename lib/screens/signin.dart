import 'package:flutter/material.dart';
import 'package:flutter_s1/widgets/custom_text_field.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                 TextButton(onPressed: (){
                   Navigator.pushReplacementNamed(context, '/signup');
                 }, child: Text('first time ? sign up')),
                ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                         ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login Success'),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }else{
                         ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error'),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                    // if (emailController.text.contains('@') &&
                    //     emailController.text.contains('.') &&
                    //     passwordController.text.length >= 8) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       content: Text('Login Success'),
                    //       duration: Duration(seconds: 1),
                    //       backgroundColor: Colors.green,
                    //     ),
                    //   );
                    //   Navigator.pushReplacementNamed(
                    //     context,
                    //     '/home'
                    //   );
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       content: Text('Login Error'),
                    //       duration: Duration(seconds: 1),
                    //       backgroundColor: Colors.red,
                    //     ),
                    //   );
                    // }
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
