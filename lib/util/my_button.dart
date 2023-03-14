import "package:flutter/material.dart";

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed
    });
  
  

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
      onPressed: onPressed,
      color: Colors.black,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'SF',
          letterSpacing: 2,
          color: Colors.white,
        ),
        ),
      );
  }
}