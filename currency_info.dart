import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CurrInfo {
  String url;
  String flagA;
  String flagB;
  String price;
  String furl;
  Map data;
  List info;

  CurrInfo({this.url, this.flagA, this.flagB});

  Future<void> getInfo() async {
    try {
      print((url));
      furl =
          "https://fcsapi.com/api-v2/forex/latest?symbol=$url&access_key=t58zo1uMFJZlNJxSrSmZv2qIUlSkCk9RAfCLkwnMwt1q1FFS";
      print((furl));
      Response response = await http
          .get(Uri.encodeFull(furl), headers: {"Accept": "application/json"});

      data = jsonDecode(response.body);
      print(data);

      info = data['response'];
      print(info);

      price = info[0]['price'];

      print("string price : $price");
    } catch (e) {
      price = "not connected";
      print('error is : $e &  $price');
    }
  }
}
