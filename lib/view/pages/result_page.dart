import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/view/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultPage extends StatelessWidget {
  // const ResultPage({super.key});
  const ResultPage(
      {required this.bmiResult,
      required this.actualbmiresultvalue,
      required this.interpretation});
  final String bmiResult;
  final String actualbmiresultvalue;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title:const Text(
          "BMI CALCULATOR",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child:const Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
                color:const Color(0xFF1D1F33),
                customcontainer: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiResult,
                      style: kNormalTextStyle,
                    ),
                    Text(
                      actualbmiresultvalue,
                      style: kLargeTextStyle,
                    ),
                    Text(
                      interpretation,
                      style: kinterpretationStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
          ),
          BottomButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              buttonName: "CALCULATE AGAIN")
        ],
      ),
    );
  }
}
