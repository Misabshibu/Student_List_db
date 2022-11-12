import 'package:flutter/material.dart';

import '../screens/home%20screen/screen_home.dart';

class ImageAddAndEdit extends StatelessWidget {
  const ImageAddAndEdit(
      {required this.titel,
      required this.funcImage,
      required this.imgstudent,
      Key? key,
      required this.size,
      required this.saveFunction})
      : super(key: key);
  final String titel;
  final ImageProvider imgstudent;
  final void Function() funcImage;
  final Size size;
  final Function() saveFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width,
        height: size.width,
        color: const Color(0Xff480ca8),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ScreenHome()));
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    titel,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: saveFunction,
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.green, fontSize: 18),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: size.width * 0.1,
            ),
            Stack(
              children: [
                CircleAvatar(radius: 100, backgroundImage: imgstudent

                    // child: ClipOval(
                    //   child: Image(
                    //       image: state.imgPath !=
                    //               'assets/images/image_null.jpg'
                    //           ? Image.file(state.image):
                    //           : AssetImage(state.imgPath)),
                    // ),
                    ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: funcImage,
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
