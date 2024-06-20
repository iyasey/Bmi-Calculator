import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/view/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const labelStyle = TextStyle(color: Color(0xFF808F9E), fontSize: 18.0);

class ReusableContainer extends StatelessWidget {
  final Color color;
  final Widget customcontainer;
  ReusableContainer(
      {super.key, required this.color, required this.customcontainer});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: customcontainer,
      margin: EdgeInsets.all(15),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
    );
  }
}

class iconDetails extends StatelessWidget {
  final IconData icon;
  final String label;
  const iconDetails({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: labelStyle,
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: onPressed,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}

class BottomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  const BottomButton({required this.onPressed,required this.buttonName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed,
      child: Container(
        child: Center(
            child: Text(
          buttonName,
          style: kbottomContainerTextStyle,
        )),
        color: const Color(0xFFEA1556),
        width: double.infinity,
        height: 80.0,
        margin: const EdgeInsets.only(top: 10.0),
        padding:const EdgeInsets.only(bottom: 10),
      ),
    );
  }
}
