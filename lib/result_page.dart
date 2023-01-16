import 'package:flutter/material.dart';
import 'package:life_expectancy/calculate.dart';
import 'package:life_expectancy/constats.dart';
import 'package:life_expectancy/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SONUÇ SAYFASI",
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 10,
            child: Center(
                child: Text(
                    Calculate(_userData).calculate().round().toString() +
                        " YIL YAŞAYACAKSINIZ",
                    style: myStyleStr)),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "GERİ DÖN",
                style: myStyleStr,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
