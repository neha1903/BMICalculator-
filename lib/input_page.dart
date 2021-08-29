import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';

const buttonContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF111328);
const buttonContainerColor = Color(0xFFEB1555);
const upperContainerMargin = 15.0;
const allFontSize = 18.0;

enum ContainerType {
  Gender,
  NoName,
}

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color femaleCardColor = inActiveCardColor;
  Color maleCardColor = inActiveCardColor;

  void updateButtonSelection(Gender gender) {
    setState(() {
      if (gender == Gender.male) {
        if (maleCardColor == activeCardColor) {
          maleCardColor = inActiveCardColor;
        } else {
          maleCardColor = activeCardColor;
          femaleCardColor = inActiveCardColor;
        }
      } else {
        if (femaleCardColor == activeCardColor) {
          femaleCardColor = inActiveCardColor;
        } else {
          femaleCardColor = activeCardColor;
          maleCardColor = inActiveCardColor;
        }
      }
    });
  }

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
    list.add(addRows(1, ContainerType.NoName));
    list.add(addRows(2, ContainerType.NoName));
    list.add(
      Container(
        height: buttonContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: upperContainerMargin),
        color: buttonContainerColor,
        child: Center(
          child: Text(
            "CALCULATE",
            style: TextStyle(
              fontSize: allFontSize,
            ),
          ),
        ),
      ),
    );
    return list;
  }

  Expanded addRows(int num, ContainerType containerType) {
    List<Widget> list = [];
    if (containerType == ContainerType.Gender) {
      list.add(addContainer(maleCardColor, Gender.male));
      list.add(addContainer(femaleCardColor, Gender.female));
    } else {
      for (int i = 0; i < num; i++) {
        list.add(addContainer(activeCardColor, ContainerType.NoName));
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
    } else {
      iconContent = Container();
    }

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (type == Gender.male) {
            updateButtonSelection(type);
          } else if (type == Gender.female) {
            updateButtonSelection(type);
          }
        },
        child: ReusableCard(
          cardColor: color,
          cardChild: iconContent,
        ),
      ),
    );
  }
}
