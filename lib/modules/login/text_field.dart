import 'package:flutter/material.dart';

textField(
    {required String hint,
    required bool secure,
    required Function validate,
    required Function onsave}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: TextFormField(
      validator: (s) {
        validate(s);
      },
      obscureText: secure,
      onSaved: (s) {
        onsave(s);
      },
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    ),
  );
}
