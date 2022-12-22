import 'package:flutter/material.dart';

class FixedButton extends StatelessWidget {
  const FixedButton({Key? key, this.label, this.onTap}) : super(key: key);
  final String? label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFeeaeca), Color(0xFF94bbe9)]),
            borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Text(
          label!,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        )),
      ),
    );
  }
}
