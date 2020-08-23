import 'package:flutter/material.dart';
import 'package:tarantar/configuration.dart';
import 'package:tarantar/tools/functions.dart';
import 'package:tarantar/widgets/customText.dart';
import 'package:tarantar/widgets/customTextField.dart';
import 'package:tarantar/models/address.dart';

class OrderRating extends StatefulWidget {
  createState() {
    return OrderRatingState();
  }
}

class OrderRatingState extends State<OrderRating> {
  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText("Ulasan Driver", color: Colors.black, family: "Montserrat", fontSize: 16),
        iconTheme: IconThemeData(
          color: c.primaryColor
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: c.primaryColor, size: 24),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          double iconSize = 56;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: mediaWidth,
                color: Color(0xFFedfeee),
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(
                        getAssetImages("account.png"),
                        height: 65,
                        width: 65
                      ),
                      CustomText("Reza Ultraman", textAlign: TextAlign.center, family: "Montserrat", fontSize: 18, color: Colors.grey),
                    ],
                  )
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Center(
                child: CustomText("Beri rating untuk driver", textAlign: TextAlign.center, family: "Montserrat", fontSize: 18),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.orangeAccent, size: iconSize),
                    Icon(Icons.star, color: Colors.orangeAccent, size: iconSize),
                    Icon(Icons.star, color: Colors.orangeAccent, size: iconSize),
                    Icon(Icons.star, color: Colors.orangeAccent, size: iconSize),
                    Icon(Icons.star, color: Colors.orangeAccent, size: iconSize)
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Divider(),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                child: CustomText("Pesan untuk driver (opsional)", fontWeight: FontWeight.bold, fontSize: 10)
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: mediaWidth - 40, vertical: 60),
                )
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CustomText("0/160")
                )
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 60),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  color: c.primaryColor,
                  child: Container(
                    width: mediaWidth - 60,
                    height: 50,
                    child: Center(
                      child: CustomText("Kirim", color: Colors.white, fontWeight: FontWeight.bold)
                    )
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          );
        }
      )
    );
  }
}
