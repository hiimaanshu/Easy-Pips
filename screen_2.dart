import 'dart:math';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenTwo extends StatefulWidget {
  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  final _formKey = GlobalKey<FormState>();
  final _lots = TextEditingController();
  final _currency = TextEditingController();
  Map data = {};
  double contract;
  double end;
  String result = ' ';
  String ofData;

  void res() {
    if (_formKey.currentState.validate()) {
      print('Map is $data');

      ofData = data['price'];
      print('Price is $ofData');

      double stUnits = 100000.0;
      print('Standerd units are $stUnits');

      double positionSize = double.parse(_lots.text);
      print('The value of text is $positionSize');

      contract = positionSize * stUnits;
      print('The value of units is $contract');

      double price = double.parse(ofData);
      print('double price : $price');

      print(selectedLeverage);
      print('The list of string is ${selectedLeverage.split(" ")}');
      double lev = double.parse(selectedLeverage.split(" ").last);
      print('leverage is $lev');

      double calculation = (contract / lev) * price;
      double roundDouble(double value, int places) {
        double mod = pow(10.0, places);
        return ((value * mod).round().toDouble() / mod);
      }

      end = roundDouble(calculation, 4);
      // end = double.parse(((price * units) / lev).toStringAsFixed(5));
      print(end);
      setState(() {
        result = "$end ${_currency.text}";
      });
    } else {
      end = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      data = {};
      print("data was null ,data : $data");
    } else if (data.isEmpty) {
      data = ModalRoute.of(context).settings.arguments;
      print("data was empty ,data : $data");
    } else {
      data = data;
      print("there was some data ,data : $data");
    }

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Form(
          autovalidate: false,
          key: _formKey,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 13, left: 10),
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text('C',
                                    style: TextStyle(
                                        fontSize: 66,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 5, bottom: 10, right: 5),
                                child: Text('urrency',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 5, bottom: 4),
                                    child: Text('P',
                                        style: TextStyle(
                                            fontSize: 56,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(26, 32, 5, 10),
                                    child: Text('air',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 8, 20, 22),
                        child: SizedBox(
                          width: 200.0,
                          height: 58,
                          child: FlatButton(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            17, 3, 0, 3),
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage: AssetImage(
                                                "img/${data['flagB']}"),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage: AssetImage(
                                                "img/${data['flagA']}"),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    data['url'],
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                            color: Colors.white,
                            onPressed: () async {
                              dynamic result = await Navigator.pushNamed(
                                  context, '/Choose Pair');
                              setState(() {
                                data = {
                                  'price': result['price'],
                                  'url': result['url'],
                                  'flagA': result['flagA'],
                                  'flagB': result['flagB'],
                                };
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.red)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('L',
                                  style: TextStyle(
                                      fontSize: 66,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 5, bottom: 10, right: 5),
                              child: Text('average',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 3, right: 22),
                      child: DropdownButtonHideUnderline(
                        child: DropdownSearch(
                          showSearchBox: true,
                          mode: Mode.MENU,
                          label: 'Leverage',
                          selectedItem: selectedLeverage,
                          items: leverage,
                          hint: selectedLeverage,
                          onChanged: (value) {
                            setState(() {
                              selectedLeverage = value;
                            });
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('C',
                                      style: TextStyle(
                                          fontSize: 66,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 5, bottom: 10, right: 5),
                                  child: Text('urrency',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 8, 20, 22),
                        child: TextFormField(
                            inputFormatters: [
                              UpperCaseTextFormatter(),
                            ],
                            // ignore: missing_return
                            validator: (value) {
                              if (value.isEmpty) return 'Please enter a value';
                            },
                            keyboardType: TextInputType.text,
                            controller: _currency,
                            decoration: InputDecoration(
                                labelText: 'Currency',
                                hintText: "   e..g. USD",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black12),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black54),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Stack(children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('P',
                                      style: TextStyle(
                                          fontSize: 65,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(32, 38, 5, 10),
                                  child: Text('osition',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ]),
                              Container(
                                padding: EdgeInsets.only(left: 5, bottom: 4),
                                child: Text('s',
                                    style: TextStyle(
                                        fontSize: 55,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
                                child: Text('ize',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 8, 20, 22),
                        child: TextFormField(

                            // ignore: missing_return
                            validator: (value) {
                              if (value.isEmpty) return 'Please enter a value';
                            },
                            keyboardType: TextInputType.number,
                            controller: _lots,
                            decoration: InputDecoration(
                                labelText: 'Position Size',
                                hintText: "   In Standard Lots",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black12),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black54),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: FlatButton(
                  child: Text(
                    'Calculate',
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  ),
                  color: Colors.white,
                  onPressed: res,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Colors.red)),
                ),
                padding: EdgeInsets.all(32),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                child: Card(
                  // clipBehavior: Clip.antiAlias,
                  // elevation: 5,
                  // shape: Border(right: BorderSide(color: Colors.red, width: 5)),
                  elevation: 1,

                  child: ClipPath(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey[30],
                          border: Border(
                            right: BorderSide(color: Colors.red, width: 5),
                            top: BorderSide(color: Colors.black38, width: 0.15),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.fromLTRB(22, 5, 22, 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${data['url']}',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${data['price']}',
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.fromLTRB(22, 5, 22, 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Required Margin',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '$result',
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3))),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(' '),
                padding: EdgeInsets.all(32),
              ),
              Container(
                width: double.infinity,
                child: Text(' '),
                padding: EdgeInsets.all(32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String selectedLeverage = '1 : 100';
final leverageSelected = TextEditingController();
List<String> leverage = [
  "1 : 1",
  "1 : 2",
  "1 : 5",
  "1 : 10",
  "1 : 50",
  "1 : 100",
  "1 : 200",
  "1 : 500",
  "1 : 800",
  "1 : 1000",
  "1 : 2000",
  "1 : 3000",
];

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text?.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
