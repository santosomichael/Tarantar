import 'package:flutter/material.dart';
import 'package:tarantar/configuration.dart';
import 'package:tarantar/tools/functions.dart';
import 'package:tarantar/widgets/customText.dart';
import 'package:tarantar/models/order.dart';

class Dashboard extends StatefulWidget {
  createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  List<Order> orderList = [
    Order(id:1, name: "Garlic Cheese"),
    Order(id:2, name: "Korean Barbeque"),
    Order(id:3, name: "Samyang"),
    Order(id:4, name: "Indomie Ceplok"),
    Order(id:5, name: "Indomie Ceplok"),
  ];

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText("Tarantar", color: Colors.black, family: "Montserrat"),
        iconTheme: IconThemeData(
          color: Colors.green
        ),
        leading: null,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Image.asset(
              getAssetImages("account.png"),
              height: 30,
              width: 30
            )
          )
          
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.all(20),  
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                border: OutlineInputBorder(),
                hintText: "Cari Pesanan",
              ),
            ),
          ),
          Expanded(
            child: orderList.length == 0 ?
            ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Image.asset(
                      getAssetImages("orderNotFound.png"),
                      height: 300,
                      width: 300
                    ),
                    CustomText("Kamu tidak\nmempunyai pesanan", textAlign: TextAlign.center),
                  ],
                );
              }
            )
            :
            ListView.builder(
              itemCount: orderList.length,
              itemBuilder: (BuildContext context, int index) {
                final item = orderList[index];
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
                              color: Colors.grey,
                              height: 40,
                              width: 40,
                              child: ClipOval(
                                // borderRadius: BorderRadius.circular(50),
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
                        ],
                      ),
                    ),
                    onTap: () {
                      customNavigator(context, "orderDetail");
                    },
                  )
                );
              }
            )
          ),

          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              color: c.primaryColor,
              child: Container(
                width: mediaWidth - 100,
                height: 50,
                child: Center(
                  child: CustomText("Tambah Pesanan", color: Colors.white)
                )
              ),
              onPressed: () {
                customNavigator(context, "orderForm");
              },
            ),
          )
        ],
      ),
    );
  }
}
