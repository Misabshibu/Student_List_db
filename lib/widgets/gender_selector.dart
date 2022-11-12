import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

class GenderSelector extends StatelessWidget {
  GenderSelector({
    Key? key,
    required this.genderFunc,
  }) : super(key: key);
  final void Function(Gender?)? genderFunc;

  @override
  Widget build(BuildContext context) {
    return GenderPickerWithImage(
      // showOtherGender: true,
      verticalAlignedText: false,
      selectedGender: Gender.Male,
      selectedGenderTextStyle: const TextStyle(
          color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
      unSelectedGenderTextStyle:
          const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
      onChanged: genderFunc,

      equallyAligned: true,
      animationDuration: const Duration(milliseconds: 300),
      isCircular: true,
      // default : true,
      opacityOfGradient: 0.4,
      padding: const EdgeInsets.all(3),
      size: 50, //default : 40
    );
  }
}
