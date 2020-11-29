import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:swipeable_pageview/utilities/currency_info.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupPair() async {
    CurrInfo instance =
        CurrInfo(url: 'EUR/USD', flagA: 'eur.png', flagB: 'usd.png');
    await instance.getInfo();
    if (instance.price != "not connected") {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'url': instance.url,
        'flagA': instance.flagA,
        'flagB': instance.flagB,
        'price': instance.price,
      });
    } else if (instance.price == "not connected") {
      Navigator.pushReplacementNamed(context, '/not connected');
    }
  }

  @override
  void initState() {
    super.initState();
    setupPair();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            // connected
            //     ?
            Center(
                child: SpinKitWave(
      color: Colors.black,
      size: 50.0,
    )));
  }
}
