import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  const MyTextField({super.key,required this.controller,required this.obscureText,required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black12),
          enabledBorder: OutlineInputBorder(
            
            borderSide: BorderSide(color: Colors.grey.shade400)
          ),
           focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          )
        ),
      ),
    );
  }
}