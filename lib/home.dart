import 'package:calculator/colors.dart';
import 'package:calculator/provider/values.dart';
import 'package:calculator/widgets/custom-button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double space = 20;
    final calcValues = context.watch<Values>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: CBackground,
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    calcValues.enteredValue.toString(),
                    style: TextStyle(color: cMainW, fontSize: 32),
                  )),
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(calcValues.result == 0 ? "" :  '= ${calcValues.result.toString()}',
                  style: TextStyle(color: cGreen, fontSize: 60),
                ),
              ),
              Spacer(),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 24, bottom: 24, top: 24, right: 4),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.white24, width: 1))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.query_builder,
                          color: cMainWLight,
                        ),
                        SizedBox(width: space),
                        Icon(
                          Icons.horizontal_split,
                          color: cMainWLight,
                        ),
                        SizedBox(width: space),
                        Icon(
                          Icons.menu_open,
                          color: cMainWLight,
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () => calcValues.clearLast(),
                          icon: Icon(
                            Icons.close_sharp,
                            color: cMainWLight,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      CustomButton(
                        text: "C",
                        clr: cRed,
                      ),
                      CustomButton(
                        text: "()",
                        clr: cGreen,
                      ),
                      CustomButton(
                        text: "%",
                        clr: cGreen,
                      ),
                      CustomButton(
                        text: "\u00F7",
                        clr: cGreen,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomButton(
                        text: "7",
                      ),
                      CustomButton(
                        text: "8",
                      ),
                      CustomButton(
                        text: "9",
                      ),
                      CustomButton(
                        text: "\u00D7",
                        clr: cGreen,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomButton(
                        text: "4",
                      ),
                      CustomButton(
                        text: "5",
                      ),
                      CustomButton(
                        text: "6",
                      ),
                      CustomButton(
                        text: "-",
                        clr: cGreen,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomButton(
                        text: "1",
                      ),
                      CustomButton(
                        text: "2",
                      ),
                      CustomButton(
                        text: "3",
                      ),
                      CustomButton(
                        text: "+",
                        clr: cGreen,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomButton(
                        text: "\u00B1",
                      ),
                      CustomButton(
                        text: "0",
                      ),
                      CustomButton(
                        text: ".",
                      ),
                      CustomButton(
                        bg: cGreen,
                        clr: CBackground,
                        text: "=",
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
