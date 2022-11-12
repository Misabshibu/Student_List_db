import 'dart:io';

import 'package:flutter/material.dart';
import '../../../models/student_model.dart';
import '../../edit%20screen/screen_edit.dart';

class DetailsImage extends StatelessWidget {
  const DetailsImage(
      {Key? key,
      required this.size,
      required this.data,
      required this.index,
      required this.imagepath})
      : super(key: key);
  final StudentModel data;
  final Size size;
  final int index;

  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.53,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: imagepath == 'assets/images/image_null.jpg'
                        ? const AssetImage(
                            'assets/images/image_null.jpg',
                          )
                        : Image.file(File(imagepath)).image,
                    fit: BoxFit.cover)),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    Text(
                      data.name,
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: ((context) =>
                        ScreenEdit(data: data, index: index))));
              },
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 20,
                child: Icon(Icons.edit),
              ),
            ),
          )
        ],
      ),
    );
  }
}
