import 'package:flutter/material.dart';
import 'package:tarantar/tools/functions.dart';
import 'package:tarantar/configuration.dart';
import 'package:tarantar/widgets/customText.dart';
import 'package:tarantar/models/driver.dart';

class OrderCourierList extends StatefulWidget {
  createState() {
    return OrderCourierListState();
  }
}

class OrderCourierListState extends State<OrderCourierList> {
  List<Driver> driverList = [
    Driver(id:1, name: "Reza Ultraman", rating: 5),
    Driver(id:2, name: "Christopher Halim", rating: 3),
    Driver(id:3, name: "Rivaldi", rating: 4),
    Driver(id:4, name: "John Darmawan", rating: 4),
    Driver(id:5, name: "Subagiono", rating: 2)
  ];

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText("List Kurir", color: Colors.black, family: "Montserrat"),
        iconTheme: IconThemeData(
          color: Colors.green
        ),
        actions: [
          
        ],
      ),
      body: ListView.builder(
        itemCount: driverList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = driverList[index];
          double iconSize = 24;

          List<Widget> starWidgetList = [];

          for (int i = 0; i < item.rating; i++) {
            starWidgetList.add(
              Icon(Icons.star, color: Colors.orangeAccent, size: iconSize)
            );
          }

          for (int i = 0; i < 5 - item.rating; i++) {
            starWidgetList.add(
              Icon(Icons.star_border, color: Colors.orangeAccent, size: iconSize)
            );
          }
          
          return Card(
            child: InkWell(
              child: Container(
                height: 75,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 75,
                      width: 75,
                      child: Image.network(
                        "https://www.1999.co.jp/itbig54/10547622.jpg"
                      ),
                    ),
                    
                    Expanded(
                      flex:7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(item.name, fontWeight: FontWeight.bold),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: starWidgetList
                          )
                        ]
                      ),
                    ),
                    Expanded(
                      flex:2,
                      child: IconButton(
                        icon: Icon(Icons.check, color: c.primaryColor),
                        onPressed: () {
                          Alert(
                            context: context,
                            title: "Apakah anda yakin?",
                            showIcon: false,
                            content: CustomText("Anda akan memilih ${item.name} sebagai kurir anda?"),
                            defaultAction: () async {
                              Navigator.of(context).pop(true);
                            }
                          );
                        },
                      )
                    ),
                  ],
                ),
              ),
              onTap: () {
                
              },
            )
          );
        }
      ),
    );
  }
}
