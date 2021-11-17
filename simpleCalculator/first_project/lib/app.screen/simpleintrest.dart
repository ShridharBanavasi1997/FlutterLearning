import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleInterst extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SimpleInterastState();
  }
}

class _SimpleInterastState extends State<SimpleInterst> {
  var _formKey = GlobalKey<FormState>();

  var _currencies = ['Rupees', 'Dollars', 'Pounds'];
  final double _minimumPadding = 5.0;

  var _currentItemSelected = '';

  @override
  void initState() {
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var displayResult = '';

  @override
  Widget build(BuildContext context) {
    TextStyle? headline = Theme.of(context).textTheme.headline1;
    TextStyle? bodyText = Theme.of(context).textTheme.bodyText1;

    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(_minimumPadding * 5),
              child: Text(
                "Simple Interest Calculator",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              )),
          Padding(
            padding:
                EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
            child: TextFormField(
              keyboardType: TextInputType.number,
              style: bodyText,
              controller: principalController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter principal amount';
                }
              },
              decoration: InputDecoration(
                  labelText: 'Principal',
                  hintText: 'Enter Principal e.g. 12000',
                  labelStyle: bodyText,
                  errorStyle:
                      TextStyle(color: Colors.yellowAccent, fontSize: 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: bodyText,
                controller: roiController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter rate of interest';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Rate of Interest',
                    hintText: 'In percent',
                    labelStyle: bodyText,
                    errorStyle:
                        TextStyle(color: Colors.yellowAccent, fontSize: 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              )),
          Padding(
            padding:
                EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: bodyText,
                  controller: termController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter time';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Term',
                      hintText: 'Time in years',
                      labelStyle: bodyText,
                      errorStyle:
                          TextStyle(color: Colors.yellowAccent, fontSize: 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
                Container(
                  width: _minimumPadding * 5,
                ),
                Expanded(
                    child: DropdownButton<String>(
                  items: _currencies.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: _currentItemSelected,
                  onChanged: (String? newValueSelected) {
                    _onDropDownItemSelected(newValueSelected!);
                  },
                ))
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  bottom: _minimumPadding, top: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      textColor: Theme.of(context).primaryColorDark,
                      child: Text(
                        'Calculate',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_formKey.currentState!.validate()) {
                            this.displayResult = _calculateTotalReturns();
                          }
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Reset',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          _reset();
                        });
                      },
                    ),
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.all(_minimumPadding * 2),
            child: Text(
              this.displayResult,
              style: bodyText,
            ),
          )
        ],
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;

    String result =
        'After $term years, your investment will be worth $totalAmountPayable $_currentItemSelected';
    return result;
  }

  void _reset() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    displayResult = '';
    _currentItemSelected = _currencies[0];
  }
}
