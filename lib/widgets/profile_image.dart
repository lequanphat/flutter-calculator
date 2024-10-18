import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(50),
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/penguin.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
