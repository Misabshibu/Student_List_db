import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Textfield extends StatelessWidget {
  final TextEditingController textController;
  final Widget iconprefix;
  final String text;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final int textLimit;
  const Textfield(
      {Key? key,
      this.keyboardType = TextInputType.text,
      this.onChanged,
      required this.text,
      required this.iconprefix,
      required this.textController,
      this.textLimit = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: textController,
            keyboardType: keyboardType,
            onChanged: onChanged,
            inputFormatters: [
              LengthLimitingTextInputFormatter(textLimit),
            ],
            decoration: InputDecoration(
              prefixIcon: iconprefix,
              hintText: text,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
