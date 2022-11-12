import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField(
      {Key? key, required this.controller, required this.searchfunc})
      : super(key: key);

  final TextEditingController controller;
  final Function(String) searchfunc;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: const BoxDecoration(color: Color(0Xff480ca8), boxShadow: [
        BoxShadow(
            color: Color(0Xffba324f),
            blurRadius: 1,
            spreadRadius: 2,
            offset: Offset(0, 1))
      ]),
      alignment: Alignment.center,
      child: AnimationSearchBar(
          isBackButtonVisible: false,
          backIconColor: Colors.white,
          searchIconColor: Colors.white,
          hintStyle: const TextStyle(color: Colors.white),
          closeIconColor: Colors.white,
          cursorColor: Colors.white,
          searchFieldDecoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20)),
          textStyle: const TextStyle(color: Colors.white),
          centerTitleStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          centerTitle: 'Home Page',
          onChanged: searchfunc,
          searchTextEditingController: controller,
          horizontalPadding: 5),
    ));
  }
}
