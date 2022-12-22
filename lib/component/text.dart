import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({Key? key, this.label}) : super(key: key);
  final String? label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (v) {
        print(v);
      },
      decoration: InputDecoration(
          hintText: label,
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
