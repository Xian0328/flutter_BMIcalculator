import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'container_box.dart';
import 'data_container.dart';

const activeColor = Colors.lightGreenAccent;
const menColor = Colors.blue;
const womenColor = Colors.pink;
const boxColor1 = Colors.deepPurple;
const lineColor1 = Colors.blue;
const lineColor2 = Colors.red;
const btnColor1 = Colors.green;
const btnColor2 = Colors.red;
const backgroundColor1 = Colors.purpleAccent;
const backgroundColor2 = Colors.white;

class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Color maleBoxColor = menColor;
  Color femaleBoxColor = womenColor;
  int height = 180;
  int weight = 70;
  int age = 25;
  String result = "";
  String resultDetail = "";
  double bmi = 0;

  void updateBoxColor(int gender){
    if(gender == 1){
      if(maleBoxColor == menColor){
        maleBoxColor = activeColor;
        femaleBoxColor = womenColor;
      }
      else{
        maleBoxColor = menColor;
        femaleBoxColor = womenColor;
      }
    }
    else{
      if(femaleBoxColor == womenColor){
        femaleBoxColor = activeColor;
        maleBoxColor = menColor;
      }
      else{
        femaleBoxColor = womenColor;
        maleBoxColor = menColor;
      }
    }
  }

  String calculateBmi(int  weight,int height){
    bmi = weight / pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getInterpretation(double bmi){
    if(bmi >=18.5 && bmi < 24){
      return "體重正常，要繼續保持";
    }
    else if(bmi < 18.5){
      return "體重過輕，需要多運動，均衡飲食，以增加體能，維持健康！";
    }
    else if(bmi >=24 && bmi < 27){
      return "體重過重，要小心囉，趕快力行健康體重管理！";
    }
    else if(bmi >= 27){
      return "肥胖，需要立刻力行健康體重管理！";
    }
    return "錯誤！請重新執行";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "BMI計算器",
          style: TextStyle(
            fontSize: 40.0
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: backgroundColor2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              updateBoxColor(1);
                            });
                          },
                          child: ContainerBox(
                            boxColor: maleBoxColor,
                            childWidget: DataContainer(icon: FontAwesomeIcons.mars,title: "男性"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              updateBoxColor(2);
                            });
                          },
                          child: ContainerBox(
                              boxColor: femaleBoxColor,
                              childWidget: DataContainer(icon: FontAwesomeIcons.venus,title: "女性",)
                          ),
                        ),
                      ),
                    ],
                  )
              ),
          ),
          Expanded(
            child: ContainerBox(
              boxColor: Colors.white,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "身高",
                    style: textStyle1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: textStyle2,
                      ),
                      Text(
                        "公分",
                        style: textStyle1,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: lineColor1,
                    inactiveColor: lineColor2,
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });
                  },
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ContainerBox(
                      boxColor: Colors.white,
                      childWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "體重",
                            style: textStyle1,
                          ),
                          Text(
                            weight.toString(),
                            style: textStyle2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                backgroundColor: btnColor1,
                                child: Icon(FontAwesomeIcons.plus,color: Colors.white,),
                              ),
                              SizedBox(width: 10.0,),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if(weight > 0){
                                      weight--;
                                    }
                                  });
                                },
                                backgroundColor: btnColor2,
                                child: Icon(FontAwesomeIcons.minus,color: Colors.white,),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ContainerBox(
                      boxColor: Colors.white,
                      childWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "年齡",
                            style: textStyle1,
                          ),
                          Text(
                            age.toString(),
                            style: textStyle2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                backgroundColor: btnColor1,
                                child: Icon(FontAwesomeIcons.plus,color: Colors.white,),
                              ),
                              SizedBox(width: 10.0,),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if(age > 0){
                                      age--;
                                    }
                                  });
                                },
                                backgroundColor: btnColor2,
                                child: Icon(FontAwesomeIcons.minus,color: Colors.white,),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
          ),
          GestureDetector(
            onTap:(){
              setState(() {
                result = calculateBmi(weight, height);
                resultDetail = getInterpretation(bmi);
                showDialog(
                    context: context,
                    builder:(BuildContext context){
                      return Dialog(
                        backgroundColor: backgroundColor1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          color: backgroundColor1,
                          height: 200.0,
                          margin: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "結果",
                                style: textStyle1,
                              ),
                              Text(
                                result.toString(),
                                style: textStyle1,
                              ),
                              Text(
                                resultDetail,
                                style: textStyle1,
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                );
              });
            },
            child: Container(
              child: Center(
                child: Text(
                  "計算",
                  style: textStyle3,
                ),
              ),
              width: double.infinity,
              height: 80.0,
              color: boxColor1,
              margin: EdgeInsets.only(top: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}


