import 'package:flutter/material.dart';

class ModalAddPost extends StatelessWidget {
  const ModalAddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add post'),
      content: TextFormField(),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}