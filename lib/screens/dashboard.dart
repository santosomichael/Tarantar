import 'package:flutter/material.dart';
import 'package:tarantar/tools/functions.dart';

class Dashboard extends StatefulWidget {
  createState() {
    return DashboardState();
  }
}

class Order {
  int id;
  String name;

  Order({this.id, this.name});
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
        title: Text("Tarantar"),
        iconTheme: IconThemeData(
          color: Colors.green
        ),
        actions: [
          Icon(Icons.person)
          // Image.asset(
          //   getAssetImages("account.png"),
          //   height: 40,
          //   width: 40
          // )
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
                    Text("Kamu tidak\nmempunyai pesanan", textAlign: TextAlign.center),
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
                            child: Text(item.name),
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
            padding: EdgeInsets.only(bottom: 25),
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              color: Color(0XFF2e7d32),
              child: Container(
                width: mediaWidth - 100,
                height: 50,
                child: Center(
                  child: Text("Tambah Pesanan", style: TextStyle(color: Colors.white))
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
