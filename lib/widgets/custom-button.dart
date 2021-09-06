import 'package:calculator/provider/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../colors.dart';

class CustomButton extends StatelessWidget {
  final Color? bg;
  final Color? clr;
  final String text;
  const CustomButton({Key? key, this.bg, this.clr, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calcValues = context.watch<Values>();

    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(15),
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: this.bg ?? Colors.white10,
        shape: BoxShape.circle,
        // borderRadius: BorderRadius.all(Radius.circular(50))
      ),
      child: TextButton(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          onPressed: () {
            if (this.text != "C" && this.text != "=") {
              calcValues.setEnteredValue(this.text);
            }
            if (this.text == "C") {
              calcValues.reset();
            }
            if (this.text == "=") {
              calcValues.equalsTo();
            }
          },
          child: Text(
            this.text,
            style: TextStyle(
                fontSize: 30,
                color: this.clr ?? cMainW,
                height: 1,
                fontWeight: FontWeight.w900),
          )),
    ));
  }
}
