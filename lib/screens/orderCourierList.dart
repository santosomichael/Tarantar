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
    Driver(id:1, name: "Alex Sutanto"),
    Driver(id:2, name: "Christopher Halim"),
    Driver(id:3, name: "Rivaldi"),
    Driver(id:4, name: "John Darmawan"),
    Driver(id:5, name: "Subagiono"),
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
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          final item = driverList[index];
          
          return Card(
            child: InkWell(
              child: Container(
                height: 75,
                child: Row(
                  children: [
                    Expanded(
                      flex:1,
                      child: Container()
                    ),
                    Expanded(
                      flex:1,
                      child: Container(
                        height: 40,
                        width: 40,
                        child: Image.network(
                          "https://www.1999.co.jp/itbig54/10547622.jpg",
                        ),
                      ),
                    ),
                    Expanded(
                      flex:1,
                      child: Container()
                    ),
                    Expanded(
                      flex:7,
                      child: CustomText(item.name),
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
                            cancel: false,
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
                customNavigator(context, "orderDetail");
              },
            )
          );
        }
      ),
    );
  }
}
