import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/constats.dart';
import 'package:life_expectancy/result_page.dart';
import 'package:life_expectancy/user_data.dart';

import 'Cards.dart';
import 'Gender.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 0.0;
  double sporSayisi = 0.0;
  int boyUzunlugu = 170;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildColumnOutlineButtom("BOY", boyUzunlugu),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildColumnOutlineButtom("KİLO", kilo),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                children: [
                  Text(
                    "Haftada Kaç Kere Spor Yapıyorsunuz?",
                    style: myStyleStr,
                  ),
                  Text(
                    sporSayisi.round().toString(),
                    style: myStyleNum,
                  ),
                  Slider(
                      value: sporSayisi,
                      min: 0,
                      max: 7,
                      divisions: 7,
                      onChanged: (double newValue) {
                        setState(() {
                          sporSayisi = newValue;
                        });
                      }),
                ],
              ),
              onPress: () {},
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Günde Kaç Sigara İçiyorsunuz?",
                    style: myStyleStr,
                  ),
                  Text(
                    icilenSigara.round().toString(),
                    style: myStyleNum,
                  ),
                  Slider(
                      value: icilenSigara,
                      min: 0,
                      max: 30,
                      onChanged: (double newValue) {
                        setState(() {
                          icilenSigara = newValue;
                        });
                      }),
                ],
              ),
              onPress: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk:
                        seciliCinsiyet == 'KADIN' ? Colors.green : Colors.white,
                    child: Gender(
                      genderName: 'KADIN',
                      genderIcon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    renk:
                        seciliCinsiyet == 'ERKEK' ? Colors.green : Colors.white,
                    child: Gender(
                      genderName: 'ERKEK',
                      genderIcon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 50,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(UserData(
                            boyUzunlugu: boyUzunlugu,
                            icilenSigara: icilenSigara,
                            kilo: kilo,
                            sporSayisi: sporSayisi,
                            seciliCinsiyet: seciliCinsiyet))));
              },
              child: Text("HESAPLA", style: myStyleStr),
            ),
          ),
        ],
      ),
    );
  }

  Column buildColumnOutlineButtom(String label, int value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: myStyleStr),
        Text(
          value.toString(),
          style: myStyleNum,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? boyUzunlugu-- : kilo--;
                  });
                },
                child: Icon(Icons.remove),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    label == "BOY" ? boyUzunlugu++ : kilo++;
                  });
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
