import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  final String genderName;
  final IconData genderIcon;

  Gender({required this.genderName, required this.genderIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          //FontAwesomeIcons.venus,
          genderIcon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox.fromSize(size: Size(0, 10)),
        Text(
          genderName,
          style: TextStyle(
              fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
