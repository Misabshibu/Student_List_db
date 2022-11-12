import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/search/search_bloc.dart';
import '../../home%20screen/screen_home.dart';

import '../../../models/student_model.dart';
import '../../details%20screen/screen_details.dart';
import '../../edit%20screen/screen_edit.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class ListContainer extends StatelessWidget {
  const ListContainer(
      {Key? key, required this.size, required this.data, required this.index})
      : super(key: key);

  final Size size;
  final StudentModel data;
  final int index;
  @override
  Widget build(BuildContext context) {
    log('hello${data.gender}');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ScreenDetails(
                    index: index,
                    data: data,
                  )));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            width: size.width,
            height: size.width * 0.25,
            decoration: BoxDecoration(
                color: const Color(0Xffcaa8f5),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.03,
                ),
                CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        data.imagepath == 'assets/images/image_null.jpg'
                            ? const AssetImage('assets/images/image_null.jpg')
                            : Image.file(File(data.imagepath)).image),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.43,
                      child: Text(
                        'Name: ${data.name}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.02,
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Age    : ${data.age}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          CircleAvatar(
                              radius: 10,
                              child: data.gender.toString() == 'Gender.Male'
                                  ? const Image(
                                      image: AssetImage(
                                          'assets/images/male_avatar.png'))
                                  : const Image(
                                      image: AssetImage(
                                          'assets/images/female_avatar.png'))),
                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ScreenEdit(
                                data: data,
                                index: index,
                              )));
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.green,
                    )),
                IconButton(
                    onPressed: () {
                      deleteDialogue(context, data.key);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
                SizedBox(
                  width: size.width * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Delete dialogue box functioin
deleteDialogue(context, key) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text(
              'Confirm Delete',
            ),
            titleTextStyle: const TextStyle(color: Colors.red, fontSize: 20),
            content: const Text('Do you want to delete this student details?'),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    FocusNode().unfocus();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.green),
                  )),
              TextButton(
                  onPressed: () {
                    context.read<SearchBloc>().add(RemoveStudent(id: key));
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ScreenHome()));
                    log('deleter');
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ));
}
