import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'round_icon_button.dart';

enum ContainerType {
  Gender,
  NoName,
  Height,
  weight,
  age,
}

enum Gender {
  male,
  female,
  unKnown,
}

enum ButtonType {
  plus,
  minus,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late Gender selectedGender = Gender.unKnown;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: addColumn(),
        ),
      ),
    );
  }

  List<Widget> addColumn() {
    List<Widget> list = [];
    list.add(addRows(2, ContainerType.Gender));
    list.add(addRows(1, ContainerType.Height));
    list.add(addRows(2, ContainerType.NoName));
    list.add(
      Container(
        height: kButtonContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: kUpperContainerMargin),
        color: kButtonContainerColor,
        child: Center(
          child: Text(
            "CALCULATE",
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
    return list;
  }

  Expanded addRows(int num, ContainerType containerType) {
    List<Widget> list = [];
    if (containerType == ContainerType.Gender) {
      list.add(
        addContainer(
          selectedGender == Gender.male ? kActiveCardColor : kInActiveCardColor,
          Gender.male,
        ),
      );
      list.add(
        addContainer(
          selectedGender == Gender.female
              ? kActiveCardColor
              : kInActiveCardColor,
          Gender.female,
        ),
      );
    } else if (containerType == ContainerType.Height) {
      list.add(
        addContainer(
          kActiveCardColor,
          ContainerType.Height,
        ),
      );
    } else if (containerType == ContainerType.NoName) {
      list.add(
        addContainer(
          kActiveCardColor,
          ContainerType.weight,
        ),
      );
      list.add(
        addContainer(
          kActiveCardColor,
          ContainerType.age,
        ),
      );
    } else {
      for (int i = 0; i < num; i++) {
        list.add(addContainer(kActiveCardColor, ContainerType.NoName));
      }
    }
    return Expanded(
      child: Row(
        children: list,
      ),
    );
  }

  Expanded addContainer(Color color, var type) {
    var iconContent;
    if (type == Gender.male) {
      iconContent = IconContent(
        label: "MALE",
        iconData: FontAwesomeIcons.mars,
      );
    } else if (type == Gender.female) {
      iconContent = IconContent(
        label: "FEMALE",
        iconData: FontAwesomeIcons.venus,
      );
    } else if (type == ContainerType.Height) {
      iconContent = heightContainer();
    } else if (type == ContainerType.weight) {
      iconContent = addCustomWidgets("WEIGHT", weight, ContainerType.weight);
    } else if (type == ContainerType.age) {
      iconContent = addCustomWidgets("AGE", age, ContainerType.age);
    } else {
      iconContent = Container();
    }

    return Expanded(
      child: ReusableCard(
        cardColor: color,
        cardChild: iconContent,
        onPress: () {
          setFunctionality(type);
        },
      ),
    );
  }

  void addAndMinusTheValue(ContainerType containerType, ButtonType buttonType) {
    setState(() {
      if (containerType == ContainerType.weight) {
        if (buttonType == ButtonType.plus) {
          weight++;
        } else if (buttonType == ButtonType.minus) {
          if (weight > 0) {
            weight--;
          }
        }
      } else if (containerType == ContainerType.age) {
        if (buttonType == ButtonType.plus) {
          age++;
        } else if (buttonType == ButtonType.minus) {
          if (age > 0) {
            age--;
          }
        }
      }
    });
  }

  Container addCustomWidgets(
      String label, int customVar, ContainerType containerType) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: kLabelTextStyle,
          ),
          Text(
            customVar.toString(),
            style: kNumberTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPress: () {
                  addAndMinusTheValue(containerType, ButtonType.minus);
                },
              ),
              SizedBox(
                width: kSizeBoxHeight,
              ),
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPress: () {
                  addAndMinusTheValue(containerType, ButtonType.plus);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Container heightContainer() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "HEIGHT",
            style: kLabelTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                height.toString(),
                style: kNumberTextStyle,
              ),
              Text(
                "cm",
                style: kLabelTextStyle,
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbColor: kButtonContainerColor,
              activeTrackColor: Colors.white,
              inactiveTrackColor: Color(0xFF8D8E98),
              overlayColor: Color(0x29Eb1555),
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 15.0,
              ),
              overlayShape: RoundSliderOverlayShape(
                overlayRadius: 20.0,
              ),
            ),
            child: Slider(
              value: height.toDouble(),
              min: kMinHeight,
              max: kMaxHeight,
              onChanged: (double newValue) {
                setState(() {
                  height = newValue.toInt();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void setFunctionality(var type) {
    setState(() {
      if (type == Gender.male) {
        selectedGender = Gender.male;
      } else if (type == Gender.female) {
        selectedGender = Gender.female;
      }
    });
  }
}
