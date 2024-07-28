import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final String location;
  final void Function() onTap;
  const MyTile({super.key,required this.location,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white)
          
        ),
        child: Image.asset(location,height: 60,),
      ),
    );
  }
}