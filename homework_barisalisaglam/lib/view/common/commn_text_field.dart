import 'package:flutter/material.dart';

class CommonTextFiled extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;


  const CommonTextFiled({super.key,
    this.controller,
    this.label,
  
  });

  @override
  Widget build(BuildContext context) {
        return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: label != null ? Text(label ?? "") : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          
          borderRadius: BorderRadius.circular(16),

        ),
      ),

    );
  }
}