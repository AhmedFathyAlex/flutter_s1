import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint,
   this.isPassword = false , this.controller,
   this.onValidate});
  final String hint;
  final bool isPassword;
  final TextEditingController? controller ;
  final String? Function(String?)? onValidate;
  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(width: MediaQuery.of(context).size.width * .8,
              child: TextFormField(
                validator: onValidate,
                controller: controller,
                obscureText: isPassword,
                decoration: InputDecoration(
                  hintText: hint,
                  border: OutlineInputBorder()
                ),
              ),
              ),
            );
  }
}