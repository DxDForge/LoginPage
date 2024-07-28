import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final void Function() onTap;
  const MyButton({super.key,required this.buttonName,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: const BoxDecoration(color: Colors.black),
          child: Center(child: Text(buttonName,style: const TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
}