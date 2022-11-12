import 'package:flutter/material.dart';

class DetailsGender extends StatelessWidget {
  const DetailsGender({
    required this.gender,
    Key? key,
  }) : super(key: key);
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          const Text(
            'Gender:',
          ),
          const SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 25,
            backgroundImage: gender == 'Gender.Male'
                ? const AssetImage('assets/images/male_avatar.png')
                : const AssetImage('assets/images/female_avatar.png'),
          )
        ],
      ),
    );
  }
}
