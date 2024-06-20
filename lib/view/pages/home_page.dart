import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/controller/calculator.dart';
import 'package:bmi_calculator/controller/calculator_provider.dart';
import 'package:bmi_calculator/view/pages/result_page.dart';
import 'package:bmi_calculator/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Color maleInactiveColor = KInactiveContainerColor;
  Color femaleInactiveColor = KInactiveContainerColor;

  void changeColor(int gender) {
    if (gender == 1) {
      if (maleInactiveColor == KInactiveContainerColor) {
        maleInactiveColor = KReusableCardColor;
        femaleInactiveColor = KInactiveContainerColor;
      } else {
        maleInactiveColor = KInactiveContainerColor;
      }
    }
    if (gender == 2) {
      if (femaleInactiveColor == KInactiveContainerColor) {
        femaleInactiveColor = KReusableCardColor;
        maleInactiveColor = KInactiveContainerColor;
      } else {
        femaleInactiveColor = KInactiveContainerColor;
      }
    }
  }

  int age = 22;

  @override
  Widget build(BuildContext context) {
    final calculator = ref.watch(calculatorProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text(
          "BMI CALCULATOR",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeColor(1);
                      });
                    },
                    child: ReusableContainer(
                      customcontainer: const iconDetails(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                      color: maleInactiveColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeColor(2);
                      });
                    },
                    child: ReusableContainer(
                      customcontainer: const iconDetails(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                      color: femaleInactiveColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableContainer(
              customcontainer: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                 const Text(
                    "HEIGHT",
                    style: KLabelStyle,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        calculator.height.toString(),
                        style: KNumberStyle,
                      ),
                     const Text("cm"),
                    ],
                  ),
                  SliderTheme(
                    data:const SliderThemeData(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                    ),
                    child: Slider(
                      value: calculator.height.toDouble(),
                      min: 115,
                      max: 215,
                      activeColor:const Color(0xFFEB1555),
                      inactiveColor:const Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        ref
                            .read(calculatorProvider.notifier)
                            .setHeight(newValue.round());
                      },
                    ),
                  ),
                ],
              ),
              color: const Color(0xFF1D1F33),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    customcontainer: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                     const   Text(
                          'WEIGHT',
                          style: KLabelStyle,
                        ),
                        Text(
                          calculator.weight.toString(),
                          style: KNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                ref
                                    .read(calculatorProvider.notifier)
                                    .setWeight(calculator.weight - 1);
                              },
                            ),
                         const   SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                ref
                                    .read(calculatorProvider.notifier)
                                    .setWeight(calculator.weight + 1);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: const Color(0xFF1D1F33),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    customcontainer: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const    Text(
                          'AGE',
                          style: KLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          const  SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: const Color(0xFF1D1F33),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onPressed: () {
              ref.read(calculatorProvider.notifier).calculateBmi();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    actualbmiresultvalue: calculator.bmi.toStringAsFixed(1),
                    bmiResult:
                        ref.read(calculatorProvider.notifier).getResult(),
                    interpretation: ref
                        .read(calculatorProvider.notifier)
                        .getInterpretation(),
                  ),
                ),
              );
            },
            buttonName: "CALCULATE",
          ),
        ],
      ),
    );
  }
}
