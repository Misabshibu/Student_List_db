import 'dart:developer';

import 'package:flutter/material.dart';

import '../../add%20student%20screen/screen_add_student.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        // Functions.pickImage();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ScreenAddStudent()));
        log('before');

        log('addstudnt');
      },
      icon: const Icon(Icons.person_add),
      label: const Text('Add'),
      elevation: 10,
      backgroundColor: Colors.green,
      splashColor: Colors.yellow,
    );
  }
}
