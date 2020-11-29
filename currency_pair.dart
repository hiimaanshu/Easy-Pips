import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_pageview/utilities/currency_info.dart';

class ChoosePair extends StatefulWidget {
  @override
  _ChoosePairState createState() => _ChoosePairState();
}

class _ChoosePairState extends State<ChoosePair> {
  List<CurrInfo> pair = [
    CurrInfo(url: "EUR/GBP", flagA: 'eur.png', flagB: 'gbp.png'),
    CurrInfo(url: "EUR/USD", flagA: 'eur.png', flagB: 'usd.png'),
    CurrInfo(url: "EUR/AUD", flagA: 'eur.png', flagB: 'aud.png'),
    CurrInfo(url: "EUR/JPY", flagA: 'eur.png', flagB: 'jpy.png'),
    CurrInfo(url: "EUR/NZD", flagA: 'eur.png', flagB: 'nzd.png'),
    CurrInfo(url: "EUR/CAD", flagA: 'eur.png', flagB: 'cad.png'),
    CurrInfo(url: "EUR/CHF", flagA: 'eur.png', flagB: 'chf.png'),
    CurrInfo(url: "GBP/USD", flagA: 'gbp.png', flagB: 'usd.png'),
    CurrInfo(url: "GBP/AUD", flagA: 'gbp.png', flagB: 'aud.png'),
    CurrInfo(url: "GBP/JPY", flagA: 'gbp.png', flagB: 'jpy.png'),
    CurrInfo(url: "GBP/NZD", flagA: 'gbp.png', flagB: 'nzd.png'),
    CurrInfo(url: "GBP/CAD", flagA: 'gbp.png', flagB: 'cad.png'),
    CurrInfo(url: "GBP/CHF", flagA: 'gbp.png', flagB: 'chf.png'),
    CurrInfo(url: "USD/CAD", flagA: 'usd.png', flagB: 'cad.png'),
    CurrInfo(url: "USD/JPY", flagA: 'usd.png', flagB: 'jpy.png'),
    CurrInfo(url: "USD/CHF", flagA: 'usd.png', flagB: 'chf.png'),
    CurrInfo(url: "AUD/USD", flagA: 'aud.png', flagB: 'usd.png'),
    CurrInfo(url: "AUD/JPY", flagA: 'aud.png', flagB: 'jpy.png'),
    CurrInfo(url: "AUD/NZD", flagA: 'aud.png', flagB: 'nzd.png'),
    CurrInfo(url: "AUD/CAD", flagA: 'aud.png', flagB: 'cad.png'),
    CurrInfo(url: "AUD/CHF", flagA: 'aud.png', flagB: 'chf.png'),
    CurrInfo(url: "NZD/USD", flagA: 'nzd.png', flagB: 'usd.png'),
    CurrInfo(url: "NZD/JPY", flagA: 'nzd.png', flagB: 'nzd.png'),
    CurrInfo(url: "NZD/CAD", flagA: 'nzd.png', flagB: 'cad.png'),
    CurrInfo(url: "NZD/CHF", flagA: 'nzd.png', flagB: 'chf.png'),
    CurrInfo(url: "CAD/JPY", flagA: 'cad.png', flagB: 'jpy.png'),
    CurrInfo(url: "CAD/CHF", flagA: 'cad.png', flagB: 'chf.png'),
    CurrInfo(url: "CHF/JPY", flagA: 'chf.png', flagB: 'jpy.png'),
    CurrInfo(url: "XAU/USD", flagA: 'xau.png', flagB: 'usd.png'),
  ];

  void updateInfo(index) async {
    CurrInfo instance = pair[index];
    await instance.getInfo();
    Navigator.pop(context, {
      'url': instance.url,
      'flagA': instance.flagA,
      'flagB': instance.flagB,
      'price': instance.price,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Choose Currency Pair'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: ListView.builder(
            itemCount: pair.length,
            itemBuilder: (context, index) {
              return Container(
                child: Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Card(
                      elevation: 20,
                      child: ListTile(
                        onTap: () {
                          updateInfo(index);
                        },
                        title: Text(pair[index].url),
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 3, 0, 3),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage(
                                          'img/${pair[index].flagB}'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage(
                                          'img/${pair[index].flagA}'),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
