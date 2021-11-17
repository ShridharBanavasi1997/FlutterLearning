import "package:flutter/material.dart";

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 10.0, top: 40.0),
        alignment: Alignment.center,
        color: Colors.white70,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "column 1,row1",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 30.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black87),
                  ),
                ),
                Expanded(
                  child: Text(
                    "column 1,row2",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 30.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black87),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "column 2,row1",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 30.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black87),
                  ),
                ),
                Expanded(
                  child: Text(
                    "column 2,row2",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 30.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black87),
                  ),
                )
              ],
            ),
            FlightImageAsset(),
            BtnDemo()
          ],
        ),
      ),
    );
  }
}

class FlightImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/logo.png');
    Image image = Image(
      image: assetImage,
      width: 250.0,
      height: 250.0,
    );
    return Container(
      child: image,
    );
  }
}

class BtnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      width: 250.0,
      height: 50.0,
      child: RaisedButton(
        color: Colors.blueAccent,
        child: Text(
          "Demo Button",
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700),
        ),
        elevation: 6.0,
        onPressed: () => showDialogBox(context),
      ),
    );
  }

  void showDialogBox(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Demo AlertDialog"),
      content: Text("Dialog shows"),
    );

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }
}
