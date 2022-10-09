import 'package:flutter/material.dart';

const textStyle1 = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
);

const textStyle2 = TextStyle(
  color: Colors.black,
  fontSize: 60.0,
  fontWeight: FontWeight.w900,
);

const textStyle3 = TextStyle(
  color: Colors.white,
  fontSize: 30.0,
);

class DataContainer extends StatelessWidget {

  DataContainer({required this.icon,required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 15.0,),
        Text(
          title,
          style: textStyle1,
        )
      ],
    );
  }
}