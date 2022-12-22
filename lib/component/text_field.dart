import 'package:flutter/material.dart';

class FixedTextField extends StatelessWidget {
  const FixedTextField(
      {Key? key,
      this.label,
      this.icon,
      this.onChange,
      this.textEditingController})
      : super(key: key);
  final IconData? icon;
  final String? label;
  final Function(String)? onChange;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: textEditingController,
        onChanged: onChange,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: label,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.blue)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.blue)),
        ),
      ),
    );
  }
}
