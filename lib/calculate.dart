import 'package:life_expectancy/user_data.dart';

class Calculate {
  UserData _userData;
  Calculate(this._userData);

  double calculate() {
    double result = 90;
    result = result + _userData.sporSayisi - _userData.icilenSigara;
    result = result + (_userData.boyUzunlugu / _userData.kilo);
    if (_userData.seciliCinsiyet == 'KADIN') {
      return result + 3;
    } else {
      return result;
    }
  }
}
