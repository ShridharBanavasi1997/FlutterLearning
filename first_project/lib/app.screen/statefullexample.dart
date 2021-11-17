import "package:flutter/material.dart";

class FavoriteCity extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _FavorityCityState();
  }
}

class _FavorityCityState extends State<FavoriteCity>{
  String cityName = "";
  var _currencies = ['Rupees', 'Dollars', 'Pounds', 'Others'];
  var _selectedCurrencies = 'Dollars';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          TextField(
            onChanged:(String changedName){
              setState(() {
                cityName = changedName;
              });
            },
          ),
          DropdownButton<String>(
            items: _currencies.map((String dropDOwnButtonItem){
              return DropdownMenuItem<String>(
                value: dropDOwnButtonItem,
                child: Text(dropDOwnButtonItem),
              );
            }).toList(),
            value: _selectedCurrencies,
            onChanged: (String? newValueSelected) {
              // Your code to execute, when a menu item is selected from drop down
              _onDropDownItemSelected(newValueSelected!);
            },
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              "City Name is $cityName",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected){
    setState(() {
      _selectedCurrencies = newValueSelected;
    });
  }
}